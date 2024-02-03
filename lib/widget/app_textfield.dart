import 'package:flutter/material.dart';

import '../constant.dart';

// ignore: must_be_immutable
class AppTextField extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  Icon? prefixIcon;
  Widget? suffixIcon;
  bool? obscureText;
  TextInputType? inputType;
  String? Function(String?)? validator;
  AppTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.prefixIcon,
      this.obscureText,
      this.suffixIcon,
      this.validator,
      this.inputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        textAlignVertical: TextAlignVertical.bottom,
        cursorColor: appBlackColor,
        controller: controller,
        validator: validator,
        keyboardType: inputType,
        obscuringCharacter: '*',
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color: buttonBorderColor, width: 2),
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: appBlackColor, width: 2),
            ),
            hintText: hintText,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
