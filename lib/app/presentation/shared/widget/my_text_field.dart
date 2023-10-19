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
  TextEditingController? get controller => controllerSet;
  final TextEditingController? controllerSet;
  @override
  ValueChanged<String>? get onChanged => onChangedSet;
  final ValueChanged<String>? onChangedSet;
  @override
  Color get cursorColor => ConstColorMain.activeGrey;
  Widget? get suffix => suffixIcon == null
      ? MyIconButton(icon: suffixIcon!, onPressed: onPressed)
      : null;
  @override
  InputDecoration get decoration => MyInputDecoration(
      labelTextSet: labelText,
      helperTextSet: helperText,
      hintTextSet: hintText,
      suffixIconSet: suffixIcon,
      prefixIconSet: preffixIcon);

  const MyTextField({
    this.labelText,
    this.helperText,
    this.hintText,
    this.onChangedSet,
    this.suffixIcon,
    this.preffixIcon,
    this.onPressed,
    super.key,
    this.controllerSet,
  });
}

class MyInputDecoration extends InputDecoration {
  @override
  String? get labelText => labelTextSet;
  final String? labelTextSet;
  @override
  String? get helperText => helperTextSet;
  final String? helperTextSet;
  @override
  Widget? get prefixIcon => prefixIconSet;
  final Widget? prefixIconSet;
  @override
  Widget? get suffixIcon => suffixIconSet;
  final Widget? suffixIconSet;
  @override
  String? get hintText => hintTextSet;
  final String? hintTextSet;
  @override
  InputBorder? get border => InputBorder.none;
  final BorderSide noBorder = const BorderSide(color: Colors.transparent);

  const MyInputDecoration({
    this.labelTextSet,
    this.helperTextSet,
    this.hintTextSet,
    this.prefixIconSet,
    this.suffixIconSet
    });
}
