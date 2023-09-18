import 'package:annoty/app/core/constants/color/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyIconButton extends IconButton {
  @override
  Widget get icon => iconSet;
  final Widget iconSet;
  @override
  VoidCallback? get onPressed => onPressedSet;
  final VoidCallback? onPressedSet;
  @override
  Color? get color => colorSet;
  final Color? colorSet;
  @override
  double get iconSize => iconSizeSet;
  final double iconSizeSet;
  @override
  Color get hoverColor => Colors.transparent;

  const MyIconButton._(
      {required this.iconSet,
      required this.onPressedSet,
      this.colorSet,
      this.iconSizeSet = 20})
      : super(
            onPressed: onPressedSet,
            icon: iconSet,
            color: colorSet,
            iconSize: iconSizeSet);

  factory MyIconButton(
      {required Icon icon,
      required onPressed,
      Color? color,
      double iconSize = 20}) {
    Color bcolor = color ??
        (Get.theme.brightness == Brightness.dark
            ? MyCoreColor.muteGrey
            : MyCoreColor.muteBlack);
    return MyIconButton._(
        iconSet: icon, onPressedSet: onPressed, colorSet: bcolor, iconSizeSet: iconSize);
  }

  IconButton paint({double? size}) {
    return IconButton(
      icon: icon,
      onPressed: onPressed,
      iconSize: size ?? 16,
      color: color,
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
          color: color!.withOpacity(1)),
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
      hoverColor: Colors.transparent, // color: color!.withOpacity(1)
    );
  }
}
