import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../constant.dart';
import '../../controller/image_cnt.dart';
import '../../dashboard/screen/profile_screen/widget/image_dialog.dart';
import 'doctor_profile_cnt.dart';
import 'model/doctor.dart';

TextEditingController doctorNameController = TextEditingController();
TextEditingController doctorTypeController = TextEditingController();
TextEditingController doctorAddressController = TextEditingController();
TextEditingController clinicTimeController = TextEditingController();
TextEditingController doctorNumberController = TextEditingController();

class AddDoctorProfile extends StatefulWidget {
  const AddDoctorProfile({
    Key? key,
  }) : super(key: key);

  @override
  State<AddDoctorProfile> createState() => _AddDoctorProfileState();
}

class _AddDoctorProfileState extends State<AddDoctorProfile> {
  final doctorProfileCnt = Get.put(DoctorProfileCnt());
  FirebaseFirestore store = FirebaseFirestore.instance;
  String? hintText;
  Icon? prefixIcon;
  Icon? suffixIcon;

  final cnt = Get.put(ImageCnt());
  // Future<PickedFile?> getImagePicker() async {
  //   imageData = await picker.getImage(source: ImageSource.gallery);
  //   debugPrint(imageData.toString());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'addDoctorProfile'.tr,
            style: TextStyle(color: appBlackColor, fontWeight: FontWeight.bold),
          ),
          backgroundColor: appWhiteColor,
          elevation: 0,
          iconTheme: IconThemeData(color: appBlackColor),
        ),
        body: Obx(
          () => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  h20,
                  GestureDetector(
                    onTap: () async {
                      // await getImagePicker();
                      showDialog(
                        context: context,
                        builder: (context) => const ImageDialog(),
                      );
                    },
                    child: cnt.getImage == null || cnt.getImage == ''
                        ? ClipOval(
                            child: ClipRRect(
                              borderRadius: cr10,
                              child: SizedBox(
                                // height: 100,
                                // width: 100,
                                child: Image.asset(
                                  'asset/doctor_profile.png',
                                  scale: 2,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )
                        : ClipRRect(
                            borderRadius: cr20,
                            child: Image.file(
                              File(cnt.getImage),
                              fit: BoxFit.cover,
                              height: Get.height * 0.2,
                              width: Get.width,
                            ),
                          ),
                  ),
                  h30,
                  TextFormField(
                    cursorColor: appBlackColor,
                    controller: doctorNameController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12.0)),
                        borderSide:
                            BorderSide(color: buttonBorderColor, width: 2),
                      ),
                      prefixIcon: prefixIcon,
                      suffix: suffixIcon,
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: appBlackColor, width: 2),
                      ),
                      hintText: 'nameHint'.tr,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    cursorColor: appBlackColor,
                    controller: doctorTypeController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12.0)),
                        borderSide:
                            BorderSide(color: buttonBorderColor, width: 2),
                      ),
                      prefixIcon: prefixIcon,
                      suffix: suffixIcon,
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: appBlackColor, width: 2),
                      ),
                      hintText: 'typeHint'.tr,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    cursorColor: appBlackColor,
                    controller: doctorAddressController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12.0)),
                        borderSide:
                            BorderSide(color: buttonBorderColor, width: 2),
                      ),
                      prefixIcon: prefixIcon,
                      suffix: suffixIcon,
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: appBlackColor, width: 2),
                      ),
                      hintText: 'addressHint'.tr,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    cursorColor: appBlackColor,
                    controller: clinicTimeController,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => SfDateRangePicker(
                          view: DateRangePickerView.month,
                          backgroundColor: Colors.white,
                          showActionButtons: true,

                          onCancel: () {
                            Navigator.pop(context);
                            clinicTimeController.text = "";
                          },
                          onSubmit: (value) {
                            clinicTimeController.text = value.toString();
                            Navigator.pop(context);
                          },
                          // selectionMode: DateRangePickerSelectionMode.range,
                          // monthViewSettings: ,
                          initialSelectedRange: PickerDateRange(
                              DateTime.now().subtract(const Duration(days: 4)),
                              DateTime.now().add(const Duration(days: 3))),
                        ),
                      );
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12.0)),
                        borderSide:
                            BorderSide(color: buttonBorderColor, width: 2),
                      ),
                      prefixIcon: prefixIcon,
                      suffix: suffixIcon,
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: appBlackColor, width: 2),
                      ),
                      hintText: 'timeHint'.tr,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    cursorColor: appBlackColor,
                    controller: doctorNumberController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12.0)),
                        borderSide:
                            BorderSide(color: buttonBorderColor, width: 2),
                      ),
                      prefixIcon: prefixIcon,
                      suffix: suffixIcon,
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: appBlackColor, width: 2),
                      ),
                      hintText: 'numberHint'.tr,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  OutlinedButton(
                    onPressed: () async {
                      try {
                        doctorProfileCnt.doctorDataList.add(DoctorData(
                            address: doctorAddressController.text,
                            name: doctorNameController.text,
                            image: cnt.getImage,
                            time: clinicTimeController.text,
                            type: doctorTypeController.text));

                        final docUser = store.collection('doctor').doc();

                        await docUser.set({
                          "address": doctorAddressController.text,
                          "name": doctorNameController.text,
                          "time": clinicTimeController.text,
                          "type": doctorTypeController.text,
                          "number": doctorNumberController.text,
                          "image": cnt.getImage,
                          "bookappoinment": [],
                          "closeappoinment": [],
                          "id": docUser.id,
                        });

                        Navigator.pop(context);
                      } catch (e) {
                        debugPrint('===> ERROR : ${e.toString()}');
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      shape: const StadiumBorder(),
                      side: BorderSide(color: appBlackColor),
                    ),
                    child: Text(
                      'addDoctorProfile'.tr,
                      style: TextStyle(color: appBlackColor),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
