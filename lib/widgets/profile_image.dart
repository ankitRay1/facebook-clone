import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebookclone/config/palette.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageurl;

  final bool isActive;

  final bool hasBorder;
  final bool isBoxColor;

  const ProfileAvatar(
      {Key key,
      this.imageurl,
      this.isActive = false,
      this.hasBorder = false,
      this.isBoxColor = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: isBoxColor ? Palette.facebookBlue : Colors.grey,
          child: CircleAvatar(
            backgroundColor: Colors.grey[200],
            backgroundImage: CachedNetworkImageProvider(imageurl),
            radius: hasBorder ? 22.0 : 24.0,
          ),
        ),
        isActive
            ? Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                        color: Palette.online,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2.0))))
            : const SizedBox.shrink()
      ],
    );
  }
}
