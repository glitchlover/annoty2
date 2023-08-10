import 'package:annoty/app/core/constants/color/text.dart';
import 'package:flutter/material.dart';

class MyTextField extends TextField {
  final String label;
  final TextEditingController? txtController;
  final String? helperTxt;
  final String? value;
  final bool isPwd;
  final bool isUserId;

  const MyTextField(
      {super.key,
      required this.label,
      this.helperTxt,
      this.txtController,
      this.value,
      super.onChanged,
      this.isUserId = false,
      this.isPwd = false});

  Widget scaleton() {
    var seepass = false;
    return TextFormField(
        controller: txtController,
        obscureText: seepass,
        onChanged: onChanged,
        decoration: InputDecoration(
            labelText: label,
            helperText: helperTxt,
            helperStyle: const TextStyle(color: TextColorsConstant.helper),
            suffix: isPwd
                ? IconButton(
                    constraints: const BoxConstraints(),
                    onPressed: () {
                      seepass = !seepass;
                    },
                    icon: const Icon(
                      Icons.remove_red_eye,
                    ),
                    padding: EdgeInsets.zero,
                    splashRadius: 20,
                  )
                : null,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))));
  }
}
