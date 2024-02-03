import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant.dart';
import 'splash_screen_cnt.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final cnt = Get.put(SplashScreenCnt());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: Get.height,
            width: Get.width,
            child: Image.asset(
              'asset/FB.png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                'asset/logo.png',
                scale: 2.8,
              ),
              h10,
              Text('appName'.tr,
                  style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: appPrimaryColor)),
            ]),
          ),
        ],
      ),
    );
  }
}
