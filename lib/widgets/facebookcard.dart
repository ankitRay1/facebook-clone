import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebookclone/config/palette.dart';
import 'package:facebookclone/data/data.dart';
import 'package:facebookclone/models/models.dart';
import 'package:facebookclone/widgets/usercard.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FbCard extends StatelessWidget {
  final List<List> _moreOptionsList = const [
    [MdiIcons.shieldAccount, Colors.deepPurple, 'COVID-19 Info Center'],
    [MdiIcons.accountMultiple, Colors.cyan, 'Friends'],
    [MdiIcons.facebookMessenger, Palette.facebookBlue, 'Messenger'],
    [MdiIcons.flag, Colors.orange, 'Pages'],
    [MdiIcons.storefront, Palette.facebookBlue, 'Marketplace'],
    [Icons.ondemand_video, Palette.facebookBlue, 'Watch'],
    [MdiIcons.calendarStar, Colors.red, 'Events'],
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(maxWidth: 280.0),
        child: ListView.builder(
            itemCount: _moreOptionsList.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: UserCard(currentUser: currentUser),
                );
              }
              final List option = _moreOptionsList[index - 1];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: _Options(
                  icon: option[0],
                  color: option[1],
                  name: option[2],
                ),
              );
            }));
  }
}

class _Options extends StatelessWidget {
  final IconData icon;

  final String name;

  final Color color;

  const _Options({Key key, this.icon, this.name, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print("option"),
      child: Row(
        children: [
          Icon(
            icon,
            size: 38,
            color: color,
          ),
          const SizedBox(width: 6.0),
          Flexible(
            child: Text(
              name,
              style: TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
