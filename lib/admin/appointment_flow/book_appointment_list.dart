import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import '../../dashboard/screen/appointment_screen/appointment_screen.dart';
import '../../data/user_model.dart';
import '../../widget/app_button.dart';
import 'appointment_cnt.dart';
import 'close_appoint_list.dart';

class BookAppointmentList extends StatefulWidget {
  const BookAppointmentList({Key? key}) : super(key: key);

  @override
  State<BookAppointmentList> createState() => _BookAppointmentListState();
}

class _BookAppointmentListState extends State<BookAppointmentList> {
  final appointment_cnt = Get.put(AppointmentCnt());

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
            backgroundColor: appWhiteColor,
            // appBar: AppBar(
            //   title: Text(
            //     'appointment'.tr,
            //     style: const TextStyle(color: Colors.black),
            //   ),
            //   backgroundColor: Colors.white,
            //   iconTheme: const IconThemeData(color: Colors.black),
            //   elevation: 0,
            // ),
            body: DraggableHome(
              leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: appWhiteColor,
                  ),
                  onPressed: () {
                    Get.back();
                  }),
              title: Text(
                "appointment".tr,
                style: TextStyle(color: appWhiteColor),
              ),
              appBarColor: appPrimaryColor,
              headerWidget: Center(
                child: Text(
                  'appointment'.tr,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              body: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Padding(
                      padding: hz20,
                      child: Divider(
                        thickness: 0.5,
                        color: appPrimaryColor,
                      ),
                    ),
                    itemCount: users[0].bookappoinment?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Slidable(
                        startActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          // dismissible: DismissiblePane(onDismissed: () {}),
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            SlidableAction(
                              borderRadius: BorderRadius.circular(10),
                              onPressed: (context) {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      title: const Text(
                                        "Deleted Appointment",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      content: Text(
                                        'Are you want to sure delete ?',
                                        style: TextStyle(
                                            color: buttonBorderColor,
                                            fontSize: 14),
                                      ),
                                      actions: [
                                        // ElevatedButton(
                                        //   onPressed: () {
                                        //     setState(() {});
                                        //     Navigator.pop(context);
                                        //   },
                                        //   child: const Text("No"),
                                        // ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'Cancel',
                                            style: TextStyle(
                                                color: appPrimaryColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                        ),

                                        AppButton(
                                            buttonWeight:
                                                alertDialogButtonWidth,
                                            buttonHeight:
                                                alertDialogButtonHeigh,
                                            press: () {
                                              // Navigator.pop(context);
                                              users[0].bookappoinment?.remove(
                                                  users[0]
                                                      .bookappoinment?[index]);
                                            },
                                            title: 'Delete'),
                                        // ElevatedButton(
                                        //   onPressed: () {
                                        //
                                        //   },
                                        //   child: const Text("ok"),
                                        // ),
                                      ],
                                    );
                                  },
                                );
                              },
                              backgroundColor: const Color(0xFFFE4A49),
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'Delete',
                            ),
                          ],
                        ),
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              borderRadius: BorderRadius.circular(10),
                              onPressed: (context) {
                                setState(() {});
                              },
                              backgroundColor: appPrimaryColor,
                              foregroundColor: Colors.white,
                              icon: Icons.save,
                              label: 'Save',
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        child: ListTile(
                          leading: Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: appPrimaryColor,
                            ),
                            child: Center(
                              child: Text(
                                "${index + 1}",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                          title: Text(
                            // '',
                            users[index].bookappoinment![0]["name"] ?? '',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: 40,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () async {
                                appointment_cnt.isAdmin.value = true;
                                Get.to(const AppointmentScreen());
                              },
                              style: OutlinedButton.styleFrom(
                                shape: const StadiumBorder(),
                                minimumSize: const Size(250, 50),
                              ),
                              child: Text(
                                'addAppointment'.tr,
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: OutlinedButton(
                              clipBehavior: Clip.none,
                              onPressed: () async {
                                Get.to(const CloseAppoinmentsList());
                                appointment_cnt.closeAppointmentList.add({
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
                                // Get.back();
                              },
                              style: OutlinedButton.styleFrom(
                                shape: const StadiumBorder(),
                                minimumSize: const Size(250, 50),
                              ),
                              child: Text(
                                'closeAppointment'.tr,
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
