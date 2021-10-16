import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebookclone/data/data.dart';
import '../widgets/components.dart';
import 'package:flutter/material.dart';

class PostContainer extends StatelessWidget {
  const PostContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(12.0, 8, 12, 0),
        child: Column(
          children: [
            Row(
              children: [
                ProfileAvatar(
                  imageurl: currentUser.imageUrl,
                  isActive: false,
                  isBoxColor: false,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                        hintText: "What\'s on your mind?"),
                  ),
                )
              ],
            ),
            const Divider(
              height: 10,
              thickness: 0.5,
            ),
            Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton.icon(
                      onPressed: () => print("mai chala chaaye peene"),
                      label: Text(
                        "Live",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      icon: Icon(
                        Icons.videocam,
                        color: Colors.red,
                      )),
                  VerticalDivider(
                    width: 8,
                  ),
                  TextButton.icon(
                      onPressed: () => print("hey how are you"),
                      label: Text(
                        "Photo",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      icon: Icon(Icons.photo_library, color: Colors.green)),
                  VerticalDivider(
                    width: 8,
                  ),
                  TextButton.icon(
                      onPressed: () => print("hey how are you"),
                      label: Text(
                        "Room",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      icon: Icon(
                        Icons.video_call,
                        color: Colors.purpleAccent,
                      )),
                ],
              ),
            ),
            Row(
              children: [],
            )
          ],
        ));
  }
}
