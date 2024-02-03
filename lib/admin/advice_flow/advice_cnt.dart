import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';

import '../../model/advice.dart';

class AdviceCnt extends GetxController {
  TextEditingController adviceTitleController = TextEditingController();
  TextEditingController adviceController = TextEditingController();

  List<Advice> adviceList = <Advice>[].obs;

   List<File>? _imageFileList;

    final ImagePicker _picker = ImagePicker();

  getImage(){
// _imageFileList = _picker.picImage();
  }

}
