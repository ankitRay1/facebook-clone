import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebookclone/models/models.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final User currentUser;

  const UserCard({Key key, this.currentUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 18,
          backgroundColor: Colors.grey[200],
          backgroundImage: CachedNetworkImageProvider(currentUser.imageUrl),
        ),
        SizedBox(
          width: 7,
        ),
        Text(
          currentUser.name,
          style: TextStyle(color: Colors.black, fontSize: 15),
        )
      ],
    );
  }
}
