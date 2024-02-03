// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../constant.dart';

class AppButton extends StatelessWidget {
  Function() press;
  String title;
  double? buttonHeight;
  double? buttonWeight;
  AppButton({Key? key, required this.press, required this.title,this.buttonHeight=45,this.buttonWeight=double.infinity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight,
      width: buttonWeight,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(appPrimaryColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              // side: BorderSide(color: buttonBorderColor),
            ),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(fontSize: 16, color: appWhiteColor),
        ),
        onPressed: press,
      ),
    );
  }
}
