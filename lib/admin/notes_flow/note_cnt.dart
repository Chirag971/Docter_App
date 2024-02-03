import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoteCnt extends GetxController {
  TextEditingController noteController = TextEditingController();

  List noteList = ['clinic is close on sunday'].obs;
}
