import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;

  final double iconsize;

  const CircleButton({Key key, this.icon, this.iconsize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6),
      decoration:
          BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
      child: IconButton(
        color: Colors.black,
        icon: Icon(
          icon,
        ),
        iconSize: iconsize,
        onPressed: () => print("search pressed"),
      ),
    );
  }
}
