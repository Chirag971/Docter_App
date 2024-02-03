import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../admin/appointment_flow/appointment_cnt.dart';
import '../../../admin/doctor_profile/doctor_profile_cnt.dart';
import '../../../constant.dart';
import '../../../controller/image_cnt.dart';
import '../../../data/user_model.dart';
import '../../../widget/app_button.dart';
import '../../../widget/app_textfield.dart';
import 'widget/details_container.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  final appointment_cnt = Get.put(AppointmentCnt());
  final doctorProfileCnt = Get.put(DoctorProfileCnt());
  final imageCnt = Get.put(ImageCnt());
  @override
  void dispose() {
    appointment_cnt.appointmentNameController.clear();
    appointment_cnt.appointmentNumberController.clear();
    appointment_cnt.selectedDoctor.value = '';
    super.dispose();
  }

  FirebaseFirestore store = FirebaseFirestore.instance;

  Stream<List<User>> responce() =>
      store.collection("doctor").snapshots().map((event) => event.docs
          .map(
            (e) => User.fromJson(e.data()),
          )
          .toList());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<User>>(
      stream: responce(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final users = snapshot.data!;
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  'appointmentBook'.tr,
                  style: const TextStyle(color: Colors.black),
                ),
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                elevation: 0,
              ),
              body: Obx(
                () => Padding(
                  padding: hz30,
                  child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('asset/book.png', scale: 1),
                          h20,
                          AppTextField(
                            controller:
                                appointment_cnt.appointmentNameController,
                            hintText: 'nameHint'.tr,
                          ),
                          h20,
                          AppTextField(
                            controller:
                                appointment_cnt.appointmentNumberController,
                            hintText: 'numberHint'.tr,
                            inputType: TextInputType.number,
                          ),
                          h20,
                          DetailContainer(
                            child: Padding(
                                padding: hz10,
                                child: Obx(
                                  () => DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),
                                      borderRadius: cr10,
                                      hint: Text(
                                        'selectDoctor'.tr,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: buttonBorderColor),
                                      ),
                                      value: appointment_cnt
                                              .selectedDoctor.value.isNotEmpty
                                          ? appointment_cnt.selectedDoctor.value
                                          : null,
                                      items: users.map((eve) {
                                        return DropdownMenuItem(
                                          value: eve.name,
                                          child: Text(eve.name.toString()),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        print('================$value');
                                        appointment_cnt.selectedDoctor.value =
                                            value.toString();
                                      },
                                    ),
                                  ),
                                )),
                          ),
                          h10,
                          const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Report (Optional)',
                                style: TextStyle(fontSize: 18),
                              )),
                          Row(
                            children: [
                              ElevatedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius: cr10))),
                                  onPressed: () async {
                                    await imageCnt.getPicker(
                                        context: context,
                                        source: ImageSource.camera);
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: Get.width * 0.3,
                                      child: const Text('Camera'))),
                              const Spacer(),
                              ElevatedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius: cr10))),
                                  onPressed: () async {
                                    await imageCnt.getPicker(
                                        context: context,
                                        source: ImageSource.gallery);
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: Get.width * 0.3,
                                      child: const Text('Gallery'))),
                            ],
                          ),
                          imageCnt.getImage == null
                              ? Container()
                              : Container(
                                  height: Get.height * 0.25,
                                  decoration: BoxDecoration(
                                    borderRadius: cr10,
                                    color: Colors.amber,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(
                                        File(imageCnt.getImage ?? ''),
                                        fit: BoxFit.cover),
                                  ),
                                  width: Get.width * 0.8,
                                ),
                          h40,
                          AppButton(
                            press: () async {
                              appointment_cnt.appointmentList.add({
                                "doctorName":
                                    appointment_cnt.selectedDoctor.value,
                                "name": appointment_cnt
                                    .appointmentNameController.text,
                                "number": int.parse(appointment_cnt
                                    .appointmentNumberController.text),
                              });
                              String id = '';
                              for (var i = 0; i < users.length; i++) {
                                if (appointment_cnt.selectedDoctor.value ==
                                    users[i].name) {
                                  id = users[i].id!;
                                  print("object");
                                  print(appointment_cnt.appointmentList);
                                  store.collection('doctor').doc(id).set(
                                        User(
                                          address: users[i].address,
                                          name: users[i].name,
                                          id: users[i].id,
                                          number: users[i].number,
                                          time: users[i].time,
                                          image: users[i].image,
                                          type: users[i].type,
                                          bookappoinment:
                                              appointment_cnt.appointmentList,
                                          closeappoinment: [],
                                        ).toJson(),
                                      );
                                }
                              }
                              Get.back();

                              // appointment_cnt.appointmentList.add(Appointment(
                              //   doctorName: appointment_cnt.selectedDoctor.value,
                              //   name:
                              //       appointment_cnt.appointmentNameController.text,
                              //   number: int.parse(appointment_cnt
                              //       .appointmentNumberController.text),
                              // ));
                              // if (appointment_cnt.isAdmin.value) {
                              //   Get.back();
                              //   appointment_cnt.isAdmin.value = false;
                              // }
                              appointment_cnt.appointmentNameController.clear();
                              appointment_cnt.appointmentNumberController
                                  .clear();
                              appointment_cnt.selectedDoctor.value = '';
                            },
                            title: 'book'.tr,
                          )
                        ]),
                  ),
                ),
              ));
        }
        return Container();
      },
    );
  }
}
