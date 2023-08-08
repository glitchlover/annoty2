import 'package:flutter/material.dart';

class MyCircleAvatar extends CircleAvatar {
  final Image? img;
  final IconData icon;
  final Color color;

  const MyCircleAvatar({
    Key? key,
    required this.color,
    required this.icon,
    radius = 20,
    this.img,
  }) : super(key: key);

  CircleAvatar paint() {
    return CircleAvatar(
      radius: radius,
      backgroundColor: color.withOpacity(0.1),
      child: Icon(
        icon,
        color: color,
        size: radius!+radius!*.1,
      ),
    );
  }
}
