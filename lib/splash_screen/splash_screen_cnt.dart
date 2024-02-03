import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/utils.dart';

import '../introduction_screen/introduction_screen.dart';

class SplashScreenCnt extends GetxController {

  @override
  void onInit() {
     Timer(const Duration(seconds: 3), () {
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => const AppIntroductionScreen(),
      //     ));
      Get.to(AppIntroductionScreen());
    });
    super.onInit();
  }
  
}