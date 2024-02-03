import 'package:flutter/material.dart';

import '../constant.dart';

// ignore: must_be_immutable
class SignInButton extends StatelessWidget {
  Function()? press;
  String image;
  String title;
  SignInButton({Key? key, required this.press, required this.image,required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonTotalHeight,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: buttonBorderColor))),
            backgroundColor: MaterialStateProperty.all(Colors.white)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 30,
              width: 30,
            ),
            w20,
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        onPressed: press,
      ),
    );
  }
}
