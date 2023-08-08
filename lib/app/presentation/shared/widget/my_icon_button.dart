import 'package:annoty/app/core/constants/color/core.dart';
import 'package:flutter/material.dart';

class MyIconButton extends IconButton {
  const MyIconButton({super.key, required VoidCallback? onPressed, required Widget icon, Color color = MyCoreColor.muteBlack})
      : super(onPressed: onPressed, icon: icon);
  IconButton paint({double? size}) {
    return IconButton(
      icon: icon,
      onPressed: onPressed,
      iconSize: size??16,
      splashRadius: 20.0
      // color: color,
    );
  }
  Widget cicle([double size = 20]) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      child: IconButton(
        icon: icon,
        onPressed: onPressed,
        iconSize: size,
        // color: color!.withOpacity(1)
      ),
    );
  }
  Widget box([double size = 20]) {
    return IconButton(
        icon: icon,
        onPressed: onPressed,
        iconSize: size,
        splashRadius: 20.0,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,    // color: color!.withOpacity(1)
    );
  }
}
