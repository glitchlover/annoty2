// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:annoty/app/presentation/shared/widget/my_icon_button.dart';
import 'package:flutter/material.dart';

import 'package:annoty/app/core/constants/color/core.dart';

class MyTextField extends TextField {
  final Icon? suffixIcon;
  final Icon? preffixIcon;
  final VoidCallback? onPressed;
  final String? labelText;
  final String? helperText;
  final String? hintText;
  @override
  final TextEditingController? controller;
  @override
  final ValueChanged<String>? onChanged;
  @override
  Color get cursorColor => MyCoreColor.activeGrey;
  Widget? get suffix => suffixIcon == null
      ? MyIconButton(icon: suffixIcon!, onPressed: onPressed)
      : null;
  @override
  InputDecoration get decoration => MyInputDecoration(
      labelText: labelText,
      helperText: helperText,
      hintText: hintText,
      suffixIcon: suffixIcon,
      prefixIcon: preffixIcon);

  const MyTextField({
    this.labelText,
    this.helperText,
    this.hintText,
    this.onChanged,
    this.suffixIcon,
    this.preffixIcon,
    this.onPressed,
    super.key,
    this.controller,
  });
}

class MyInputDecoration extends InputDecoration {
  @override
  final String? labelText;
  @override
  final String? helperText;
  @override
  final Widget? prefixIcon;
  @override
  final Widget? suffixIcon;
  @override
  final String? hintText;
  @override
  InputBorder? get border => InputBorder.none;
  final BorderSide noBorder = const BorderSide(color: Colors.transparent);

  const MyInputDecoration(
      {this.labelText,
      this.helperText,
      this.hintText,
      this.prefixIcon,
      this.suffixIcon});
}
