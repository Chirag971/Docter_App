import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'model/doctor.dart';

class DoctorProfileCnt extends GetxController {
  // admin : add doctor controller

  TextEditingController doctorNameController = TextEditingController();
  TextEditingController doctorTypeController = TextEditingController();
  TextEditingController doctorAddressController = TextEditingController();
  TextEditingController clinicTimeController = TextEditingController();
  TextEditingController doctorNumberController = TextEditingController();

  Rx<bool> isUser = true.obs;

  List doctorList = ['vivek', 'happy', 'jenish'].obs;

  List doctorNameList = [].obs;

  static int id = 0;

  List<DoctorData> doctorDataList = <DoctorData>[].obs;
}
