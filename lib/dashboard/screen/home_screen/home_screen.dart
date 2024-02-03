import 'package:doctor_app/admin/advice_flow/advice_List_screen.dart';
import 'package:doctor_app/admin/notes_flow/notes_list.dart';
import 'package:doctor_app/dashboard/screen/home_screen/home_cnt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../admin/appointment_flow/appointment_cnt.dart';
import '../../../admin/doctor_profile/doctor_profile_list.dart';
import '../../../constant.dart';
import '../../../widget/home_details_comtainer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appointmentCnt = Get.put(AppointmentCnt());
    final homeCnt = Get.put(HomeCnt());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Image.asset(
          'asset/logo.png',
          height: 20,
          width: 20,
        ),
        automaticallyImplyLeading: false,
        title: Text(
          'MEDIT',
          style: TextStyle(
              color: appPrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Column(children: [
        Center(
          child: Stack(
            children: [
              Container(
                // color: Colors.amber,
                child: Image.asset(
                  'asset/book_no.png',
                  // scale: 3,
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: double.infinity,
                ),
              ),
              Positioned(
                  right: 135,
                  top: 35,
                  child: Text(
                    appointmentCnt.appointmentList.length.toString(),
                    style: TextStyle(
                        color: appWhiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ))
            ],
          ),
        ),
        h20,
        Text(
          'countAppointmentNumber'.tr,
          style: TextStyle(
              color: appPrimaryColor,
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
        h10,
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: hz10,
                  child: HomeDetailsContainer(
                    image: 'asset/doctor.png',
                    fontSize: 18,
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoctorProfileList(
                              isUser: true,
                            ),
                          ));
                    },
                    title: 'doctor'.tr,
                  ),
                ),
                h10,
                Padding(
                  padding: hz10,
                  child: HomeDetailsContainer(
                    fontSize: 18,
                    image: 'asset/doctoradvice.png',
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                AdviceListScreen(isUser: true),
                          ));
                    },
                    title: 'advice'.tr,
                  ),
                ),
                h10,
                Padding(
                  padding: hz10,
                  child: HomeDetailsContainer(
                    fontSize: 18,
                    image: 'asset/payment.png',
                    press: () async {
                      await homeCnt.sendPayment(context);
                      // Get.to(const PaymentScreen());
                    },
                    title: 'payment'.tr,
                  ),
                ),
                h10,
                Padding(
                  padding: hz10,
                  child: HomeDetailsContainer(
                    fontSize: 18,
                    image: 'asset/note.png',
                    press: () {
                      Get.to(NotesListScreen(
                        isUser: true,
                      ));
                    },
                    title: 'notes'.tr,
                  ),
                ),
                h10,
                Padding(
                  padding: hz10,
                  child: HomeDetailsContainer(
                    fontSize: 18,
                    image: 'asset/note.png',
                    press: () {
                      Get.to(NotesListScreen(
                        isUser: true,
                      ));
                    },
                    title: 'prescription'.tr,
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
