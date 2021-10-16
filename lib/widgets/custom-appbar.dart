import 'package:facebookclone/config/palette.dart';
import 'package:facebookclone/models/models.dart';
import 'package:facebookclone/widgets/components.dart';
import 'package:facebookclone/widgets/usercard.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomAppBar extends StatelessWidget {
  final List<IconData> icons;
  final User currentuser;

  final Function(int) onTap;

  final int selectedIndex;

  const CustomAppBar(
      {Key key, this.icons, this.currentuser, this.selectedIndex, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.0,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(color: Colors.white, boxShadow: const [
        BoxShadow(blurRadius: 4.0, offset: Offset(0, 2), color: Colors.black12),
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text("facebook",
                style: TextStyle(
                    color: Palette.facebookBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 28.0,
                    letterSpacing: -1.2)),
          ),
          Container(
            width: 600,
            height: double.infinity,
            child: CustomTabBar(
              selectedIndex: selectedIndex,
              icons: icons,
              onPressed: onTap,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                UserCard(
                  currentUser: currentuser,
                ),
                SizedBox(
                  width: 8,
                ),
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
          )
        ],
      ),
    );
  }
}
