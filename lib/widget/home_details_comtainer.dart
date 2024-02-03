import 'package:flutter/material.dart';

import '../constant.dart';

class HomeDetailsContainer extends StatelessWidget {
  String image;
  String title;
  Function() press;
  double fontSize;
  HomeDetailsContainer(
      {Key? key,
      required this.image,
      required this.title,
      required this.press,
      required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(appLightBlueColor),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            // side: BorderSide(color: buttonBorderColor),
          ),
        ),
      ),
      onPressed: press,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
                height: 65,
                width: 65,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.08,
              ),
              Text(
                title,
                style: TextStyle(
                    color: appPrimaryColor,
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
