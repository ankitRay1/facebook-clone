import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebookclone/config/palette.dart';
import 'package:facebookclone/models/models.dart';
import 'package:facebookclone/widgets/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostViewContainer extends StatelessWidget {
  final Post postview;

  const PostViewContainer({Key key, this.postview}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _PostHeader(post: postview),
                const SizedBox(
                  height: 6,
                ),
                Text(postview.caption),
                postview.imageUrl != null
                    ? const SizedBox.shrink()
                    : const SizedBox(height: 6.0),
              ],
            ),
          ),
          postview.imageUrl != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: CachedNetworkImage(imageUrl: postview.imageUrl),
                )
              : SizedBox.shrink(),
          _PostStats(post: postview),
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(
          imageurl: post.user.imageUrl,
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo} • ',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12.0,
                    ),
                  ),
                  Icon(
                    Icons.public,
                    size: 14,
                    color: Colors.grey[600],
                  )
                ],
              )
            ],
          ),
        ),
        IconButton(
            onPressed: () => print("menu pressed"),
            icon: Icon(Icons.more_horiz))
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;

  const _PostStats({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 17,
                height: 18,
                child: Icon(Icons.thumb_up, color: Colors.white, size: 12),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Palette.facebookBlue,
                ),
              ),
            ),
            Expanded(
              child: Text(
                post.likes.toString(),
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              '${post.comments} Comments',
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(width: 8),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Text(
                '${post.comments} Shares',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
          ],
        ),
        const Divider(),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _CustomPostButton(
              icon: Icon(
                MdiIcons.thumbUpOutline,
                color: Colors.grey[600],
                size: 20,
              ),
              text: "19",
              onTapped: () => print("like pressed"),
            ),
            _CustomPostButton(
              icon: Icon(
                MdiIcons.commentOutline,
                color: Colors.grey[600],
                size: 20,
              ),
              text: "56",
              onTapped: () => print("like pressed"),
            ),
            _CustomPostButton(
              icon: Icon(
                MdiIcons.shareOutline,
                color: Colors.grey[600],
                size: 28,
              ),
              text: "19",
              onTapped: () => print("like pressed"),
            ),
          ],
        )
      ],
    );
  }
}

class _CustomPostButton extends StatelessWidget {
  final Icon icon;
  final Function onTapped;
  final String text;

  const _CustomPostButton({
    Key key,
    this.icon,
    this.onTapped,
    this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
            onTap: onTapped,
            child: Container(
              height: 25.0,
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon,
                  const SizedBox(
                    width: 4,
                  ),
                  Text(text),
                ],
              ),
            )),
      ),
    );
  }
}
