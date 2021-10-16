import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebookclone/config/palette.dart';
import 'package:facebookclone/data/data.dart';
import 'package:facebookclone/models/user_model.dart';
import 'package:facebookclone/widgets/components.dart';
import 'package:flutter/material.dart';

class CreateRoomContainer extends StatelessWidget {
  final List<User> onlineUser;

  const CreateRoomContainer({Key key, this.onlineUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 65,
        color: Colors.white,
        child: ListView.builder(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 4.0,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: 1 + onlineUser.length,
            itemBuilder: (context, index) {
              // print("$index mai chala");

              if (index == 0) {
                return _CreateRoomButton();
              }
              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: InkWell(
                    onTap: () => print("rooms"),
                    child: ProfileAvatar(
                      imageurl: onlineUser[index - 1].imageUrl,
                      isActive: true,
                    ),
                  ));
            }));
  }
}

class _CreateRoomButton extends StatelessWidget {
  const _CreateRoomButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () => print("room chala"),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: Colors.white,
      borderSide: BorderSide(
        width: 3.0,
        color: Colors.blueAccent[100],
      ),
      textColor: Palette.facebookBlue,
      child: Row(
        children: [
          ShaderMask(
              shaderCallback: (rect) =>
                  Palette.createRoomGradient.createShader(rect),
              child: Icon(Icons.video_call, color: Colors.white, size: 35)),
          const SizedBox(
            width: 4,
          ),
          Text(
            "Create\nRoom",
          )
        ],
      ),
    );
  }
}
