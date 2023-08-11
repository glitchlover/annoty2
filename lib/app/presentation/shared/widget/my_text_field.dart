// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:annoty/app/presentation/shared/widget/my_icon_button.dart';
import 'package:flutter/material.dart';

import 'package:annoty/app/core/constants/color/core.dart';

class MyTextField extends TextField {
  final Icon? suffixIcon;
  final VoidCallback? onPressed;
  final String? labelText;
  final String? helperText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  Widget? get suffix => suffixIcon == null
      ? MyIconButton(icon: suffixIcon!, onPressed: onPressed)
      : null;
  @override
  InputDecoration get decoration => MyInputDecoration(labelText: labelText, helperText: helperText);
  const MyTextField({
    this.labelText,
    this.helperText,
    this.onChanged,
    this.suffixIcon,
    this.onPressed,
    super.key,
    this.controller,
  });
  // final String? value;
  // final bool isPwd;
  // final bool isUserId;

  // const MyTextField(
  //     {super.key,
  //     required this.label,
  //     this.helperTxt,
  //     this.txtController,
  //     this.value,
  //     super.onChanged,
  //     this.isUserId = false,
  //     this.isPwd = false});

  // Widget scaleton() {
  //   var seepass = false;
  //   return TextFormField(
  //       controller: txtController,
  //       obscureText: seepass,
  //       onChanged: onChanged,
  //       decoration: InputDecoration(
  //           labelText: label,
  //           helperText: helperTxt,
  //           helperStyle: const TextStyle(color: TextColorsConstant.helper),
  //           suffix: isPwd
  //               ? IconButton(
  //                   constraints: const BoxConstraints(),
  //                   onPressed: () {
  //                     seepass = !seepass;
  //                   },
  //                   icon: const Icon(
  //                     Icons.remove_red_eye,
  //                   ),
  //                   padding: EdgeInsets.zero,
  //                   splashRadius: 20,
  //                 )
  //               : null,
  //           border:
  //               OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))));
  // }
}

class MyInputDecoration extends InputDecoration {
  @override
  final String? labelText;
  @override
  final String? helperText;
  @override
  Color? get fillColor => MyCoreColor.highlightBlack;
  @override
  OutlineInputBorder get border => OutlineInputBorder(
        borderRadius: BorderRadius.circular(2),
      );
  const MyInputDecoration({
    this.labelText,
    this.helperText,
  });
}
