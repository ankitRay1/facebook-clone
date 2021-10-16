import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebookclone/config/palette.dart';
import 'package:facebookclone/data/data.dart';
import 'package:facebookclone/models/models.dart';

import 'package:facebookclone/widgets/circle_button.dart';
import 'package:facebookclone/widgets/facebookcard.dart';
import 'package:facebookclone/widgets/usercard.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../widgets/components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        mobile: _HomeScreenMobile(),
        desktop: _HomeScreenDesktop(),
      ),
    );
  }
}

class _HomeScreenMobile extends StatelessWidget {
  const _HomeScreenMobile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          title: Text(
            "facebook",
            style: TextStyle(
                color: Palette.facebookBlue,
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
                letterSpacing: -1.2),
          ),
          centerTitle: false,
          floating: true,
          actions: [
            CircleButton(
              icon: Icons.search,
              iconsize: 30.0,
            ),
            CircleButton(
              icon: MdiIcons.facebookMessenger,
              iconsize: 30.0,
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: PostContainer(),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(0, 10.0, 0, 5.0),
          sliver: SliverToBoxAdapter(
            child: CreateRoomContainer(onlineUser: onlineUsers),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
          sliver: SliverToBoxAdapter(
            child: StoryContainer(
              storiesData: stories,
              currentUser: currentUser,
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          final Post post = posts[index];
          return PostViewContainer(postview: post);
        }, childCount: posts.length))
      ],
    );
  }
}

class _HomeScreenDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: FbCard(),
              ),
            ),
          ),
          Container(
            width: 600.0,
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
                  sliver: SliverToBoxAdapter(
                    child: StoryContainer(
                      storiesData: stories,
                      currentUser: currentUser,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: PostContainer(),
                ),
                SliverPadding(
                  padding: EdgeInsets.fromLTRB(0, 10.0, 0, 5.0),
                  sliver: SliverToBoxAdapter(
                    child: CreateRoomContainer(onlineUser: onlineUsers),
                  ),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                  final Post post = posts[index];
                  return PostViewContainer(postview: post);
                }, childCount: posts.length))
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
                child: ListView.builder(
                    padding: EdgeInsets.only(left: 150, bottom: 10),
                    scrollDirection: Axis.vertical,
                    itemCount: onlineUsers.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Container(
                            padding: EdgeInsets.all(7),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text("Contacts",
                                      style: TextStyle(fontSize: 17)),
                                ),
                                IconButton(
                                    iconSize: 18,
                                    onPressed: () => print("search"),
                                    icon: Icon(Icons.search)),
                                IconButton(
                                    iconSize: 18,
                                    onPressed: () => print("search"),
                                    icon: Icon(Icons.messenger_rounded)),
                              ],
                            ));
                      }
                      return Container(
                        padding: EdgeInsets.all(5),
                        child: InkWell(
                          onTap: () => print("contact"),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.grey[200],
                                backgroundImage: CachedNetworkImageProvider(
                                    onlineUsers[index - 1].imageUrl),
                              ),
                              const SizedBox(width: 7),
                              Text(onlineUsers[index - 1].name,
                                  style: TextStyle(fontSize: 15)),
                            ],
                          ),
                        ),
                      );
                    })),
          ),
        ],
      ),
    );
  }
}
