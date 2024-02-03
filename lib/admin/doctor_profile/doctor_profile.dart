import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import 'model/doctor.dart';

class DoctorProfile extends StatefulWidget {
  bool isUser;
  DoctorProfile({Key? key, required this.doctorDetails, this.isUser = false})
      : super(key: key);
  final DoctorData doctorDetails;

  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.isUser ? 'doctorProfile'.tr : 'addDoctorProfile'.tr,
            style: TextStyle(color: appBlackColor, fontWeight: FontWeight.bold),
          ),
          backgroundColor: appWhiteColor,
          elevation: 0,
          iconTheme: IconThemeData(color: appBlackColor),
        ),
        body: Center(
          child: Column(
            children: [
              widget.doctorDetails.image == '' ||
                      widget.doctorDetails.image.isEmpty
                  ? const Icon(
                      Icons.person,
                      size: 160,
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.file(
                          File(widget.doctorDetails.image.toString()),
                          height: 200,
                          width: Get.width,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
              Text(
                widget.doctorDetails.name,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              h10,
              Text("Address: ${widget.doctorDetails.address}"),
              h4,
              Text("Time: ${widget.doctorDetails.time}"),
              h4,
              Text('Doctor Type : ${widget.doctorDetails.type}')
            ],
          ),
        ));
  }
}
