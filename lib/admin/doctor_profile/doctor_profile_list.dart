import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/admin/doctor_profile/model/doctor.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import '../../data/user_model.dart';
import 'add_doctor_profile.dart';
import 'doctor_profile.dart';
import 'doctor_profile_cnt.dart';

class DoctorProfileList extends StatefulWidget {
  bool isUser;
  DoctorProfileList({Key? key, this.isUser = false}) : super(key: key);

  @override
  State<DoctorProfileList> createState() => _DoctorProfileListState();
}

class _DoctorProfileListState extends State<DoctorProfileList> {
  final doctorProfileCnt = Get.put(DoctorProfileCnt());

  @override
  void initState() {
    super.initState();
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
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     widget.isUser ? 'doctorProfile'.tr : 'addDoctorProfile'.tr,
      //     style: TextStyle(color: appBlackColor, fontWeight: FontWeight.bold),
      //   ),
      //   backgroundColor: appWhiteColor,
      //   elevation: 0,
      //   iconTheme: IconThemeData(color: appBlackColor),
      // ),
      body: DraggableHome(
          appBarColor: appPrimaryColor,
          title: Text(
            widget.isUser ? 'doctorProfile'.tr : 'addDoctorProfile'.tr,
            style: TextStyle(color: appWhiteColor),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Get.back(),
            color: appWhiteColor,
          ),
          headerWidget: Center(
            child: Text(
              widget.isUser ? 'doctorProfile'.tr : 'addDoctorProfile'.tr,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          centerTitle: true,
          body: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: StreamBuilder<List<User>>(
                stream: responce(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final users = snapshot.data!;

                    return ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => h10,
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DoctorProfile(
                                  isUser: true,
                                  doctorDetails: DoctorData(
                                      image: users[index].image.toString(),
                                      address: users[index].address.toString(),
                                      name: users[index].name.toString(),
                                      time: users[index].time.toString(),
                                      type: users[index].type.toString()),
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: hz10,
                            child: Container(
                              alignment: Alignment.center,
                              height: Get.height * 0.07,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: appSecondaryColor),
                              child: ListTile(
                                leading: users[index].image == null
                                    ? const Icon(Icons.person)
                                    : CircleAvatar(
                                        backgroundImage: FileImage(
                                          File(
                                            users[index].image.toString(),
                                          ),
                                        ),
                                      ),
                                title: Text(
                                  users[index].name.toString(),
                                ),
                                trailing: widget.isUser
                                    ? null
                                    : IconButton(
                                        onPressed: () async {
                                          setState(() {});
                                          await store
                                              .collection('doctor')
                                              .doc(users[index].id)
                                              .delete();
                                        },
                                        icon: const Icon(Icons.cancel),
                                      ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return Container();
                },
              ),
            ),
            if (!widget.isUser)
              Align(
                alignment: Alignment.bottomCenter,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddDoctorProfile(),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    shape: const StadiumBorder(),
                    side: BorderSide(color: appBlackColor),
                  ),
                  child: Text(
                    'addDoctorProfile'.tr,
                    style: TextStyle(color: appBlackColor),
                  ),
                ),
              )
          ]),
    );
  }
}
