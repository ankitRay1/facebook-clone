import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebookclone/config/palette.dart';
import 'package:facebookclone/data/data.dart';
import 'package:facebookclone/models/story_model.dart';
import 'package:facebookclone/models/user_model.dart';
import 'package:facebookclone/screens/story_screen.dart';
import 'package:flutter/material.dart';

import 'components.dart';

class StoryContainer extends StatelessWidget {
  final List<Story> storiesData;
  final User currentUser;

  const StoryContainer({Key key, this.storiesData, this.currentUser})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200.0,
        color: Colors.white,
        child: ListView.builder(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 8.0,
            ),
            itemCount: 1 + stories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: _StoryCardWidget(
                    isAddStory: true,
                    presentUser: currentUser,
                  ),
                );
              }

              // final Story story = stories[index - 1];

              return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            StoryScreen(stories: storiesData))),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: _StoryCardWidget(
                    story: storiesData[index - 1],
                  ),
                ),
              );
            }));
  }
}

class _StoryCardWidget extends StatelessWidget {
  final bool isAddStory;
  final User presentUser;
  final Story story;

  const _StoryCardWidget(
      {Key key, this.isAddStory = false, this.presentUser, this.story})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            imageUrl: isAddStory ? currentUser.imageUrl : story.imageUrl,
            height: double.infinity,
            width: 110,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            gradient: Palette.storyGradient,
          ),
        ),
        Positioned(
          top: 8.0,
          left: 8.0,
          child: isAddStory
              ? Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.add),
                    iconSize: 30.0,
                    color: Palette.facebookBlue,
                    onPressed: () => print('Add to Story'),
                  ),
                )
              : ProfileAvatar(
                  imageurl: story.user.imageUrl,
                  hasBorder: !story.isViewed,
                ),
        ),
        Positioned(
            bottom: 8.0,
            left: 8.0,
            right: 8.0,
            child: Text(isAddStory ? "Add to Story" : story.user.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ))),
      ],
    );
  }
}
