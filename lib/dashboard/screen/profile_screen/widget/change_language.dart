import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Mycontroller extends GetxController {
  void changeLanguage({var param1, var param2}) {
    var locale = Locale(param1, param2);
    Get.updateLocale(locale);
  }
}
