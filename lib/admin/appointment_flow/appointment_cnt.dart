import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentCnt extends GetxController {
  // Book Appointment Controller

  TextEditingController appointmentNameController = TextEditingController();
  TextEditingController appointmentNumberController = TextEditingController();

  Rx<String> selectedDoctor = ''.obs;

  var isAdmin = false.obs;
  List appointmentList = [].obs;

  List closeAppointmentList = [].obs;
}
