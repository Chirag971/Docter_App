import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

import '../constant.dart';
import '../login_option_screen/login_option.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pages = [
      PageViewModel(
        pageBackground: Image.asset(
          'asset/1.png',
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),

        // iconImageAssetPath: 'assets/air-hostess.png',
        bubble: Image.asset(
          'asset/intro1.png',
        ),
        body: Text(
          'introduction1'.tr,
          style: TextStyle(color: appWhiteColor),
        ),
        title: Text(
          'Doctors',
          style: TextStyle(
              color: appPrimaryColor,
              fontSize: 40,
              fontWeight: FontWeight.bold),
        ),
        titleTextStyle: TextStyle(color: appPrimaryColor),
        bodyTextStyle: TextStyle(color: appPrimaryColor),
      ),
      PageViewModel(
        pageBackground: Image.asset('asset/2.png',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height),
        iconImageAssetPath: 'asset/intro2.png',
        body:  Text(
          'introduction2'.tr,
        ),
        title: Text(
          'Hospital',
          style: TextStyle(
              color: appPrimaryColor,
              fontSize: 40,
              fontWeight: FontWeight.bold),
        ),
        titleTextStyle: TextStyle(color: appWhiteColor),
        bodyTextStyle: TextStyle(color: appWhiteColor),
      ),
      PageViewModel(
        pageBackground: Image.asset('asset/4.png',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height),
        iconImageAssetPath: 'asset/intro3.png',
        body:  Text(
          'introduction3'.tr,
        ),
        title: Text(
          'Body & Fitness',
          style: TextStyle(
              color: appPrimaryColor,
              fontSize: 40,
              fontWeight: FontWeight.bold),
        ),
        titleTextStyle: TextStyle(color: appWhiteColor),
        bodyTextStyle: TextStyle(color: appWhiteColor),
      ),
    ];

    return Scaffold(
      body: IntroViewsFlutter(
        pages,
        showNextButton: true,
        showBackButton: true,
        onTapDoneButton: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (_) => const LoginOptionScreen()),
          // );
          Get.to(const LoginOptionScreen());
        },
        onTapSkipButton: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (_) => const LoginOptionScreen()),
          // );
          Get.to(const LoginOptionScreen());
        },
        pageButtonTextStyles: TextStyle(
          color: appWhiteColor,
          fontSize: 18.0,
        ),
      ),
    );
  }
}
