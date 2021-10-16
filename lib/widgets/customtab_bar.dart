import 'package:facebookclone/config/palette.dart';
import 'package:facebookclone/widgets/components.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;

  final int selectedIndex;

  final Function(int) onPressed;

  final bool isBorderCheck;

  const CustomTabBar(
      {Key key,
      this.icons,
      this.selectedIndex,
      this.onPressed,
      this.isBorderCheck})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
          border: Responsive.isDesktop(context)
              ? Border(
                  bottom: BorderSide(color: Palette.facebookBlue, width: 3.0))
              : Border(
                  top: BorderSide(color: Palette.facebookBlue, width: 3.0))),
      tabs: icons
          .asMap()
          .map((i, e) => MapEntry(
                i,
                Tab(
                  icon: Icon(
                    e,
                    color: i == selectedIndex
                        ? Palette.facebookBlue
                        : Colors.black45,
                    size: 30.0,
                  ),
                ),
              ))
          .values
          .toList(),
      onTap: onPressed,
    );
  }
}
