import 'package:doctor_app/authentication_screen/sign_in_screen/sign_in_screen.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant.dart';
import '../dashboard/screen/profile_screen/profile_cnt.dart';
import '../dashboard/screen/profile_screen/widget/storage.dart';
import '../forgot_password/forgot_password_screen.dart';
import '../widget/app_button.dart';
import '../widget/home_details_comtainer.dart';
import 'advice_flow/advice_List_screen.dart';
import 'appointment_flow/book_appointment_list.dart';
import 'doctor_profile/doctor_profile_list.dart';
import 'notes_flow/notes_list.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cnt = Get.put(ProfileCnt());
    return Scaffold(
      body: DraggableHome(
          appBarColor: appPrimaryColor,
          title: Text(
            "Admin Home",
            style: TextStyle(
              color: appWhiteColor,
            ),
          ),
          leading: Icon(
            Icons.favorite,
            color: appWhiteColor,
          ),
          centerTitle: true,
          headerWidget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Title(
                  color: appWhiteColor,
                  child: Text(
                    'Admin Home',
                    style: TextStyle(color: appBlackColor, fontSize: 30),
                  )),
            ],
          ),
          body: [
            Padding(
              padding: hz10,
              child: HomeDetailsContainer(
                fontSize: 18,
                image: 'asset/doctoradvice.png',
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DoctorProfileList(),
                      ));
                },
                title: 'Doctors'.tr,
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
                        builder: (context) => const BookAppointmentList(),
                      ));
                },
                title: 'Apointment'.tr,
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
                        builder: (context) => AdviceListScreen(),
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
                image: 'asset/doctoradvice.png',
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotesListScreen(),
                    ),
                  );
                },
                title: 'Notes'.tr,
              ),
            ),
            h20,
            const Padding(
              padding: hz20,
              child: Text(
                'Change Language',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            h14,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                    borderRadius: cr20,
                    onTap: () {
                      cnt.isHindi.value = true;
                      cnt.isGujarati.value = false;
                      cnt.isEnglish.value = false;
                      myController.changeLanguage(param1: 'hi', param2: 'IN');
                    },
                    child: Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: cnt.isHindi.value
                              ? appPrimaryColor
                              : appWhiteColor,
                          borderRadius: cr20,
                          border: Border.all(
                            color: appPrimaryColor,
                          ),
                        ),
                        height: 60,
                        width: 100,
                        child: Center(
                            child: Text(
                          'Hindi',
                          style: TextStyle(
                              color: cnt.isHindi.value
                                  ? appWhiteColor
                                  : appPrimaryColor),
                        )),
                      ),
                    )),
                InkWell(
                    borderRadius: cr20,
                    onTap: () {
                      cnt.isHindi.value = false;
                      cnt.isGujarati.value = true;
                      cnt.isEnglish.value = false;
                      myController.changeLanguage(param1: 'gu', param2: 'IN');
                    },
                    child: Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: cnt.isGujarati.value
                              ? appPrimaryColor
                              : appWhiteColor,
                          borderRadius: cr20,
                          border: Border.all(color: appPrimaryColor),
                        ),
                        height: 60,
                        width: 100,
                        child: Center(
                            child: Text(
                          'Gujarati',
                          style: TextStyle(
                              color: cnt.isGujarati.value
                                  ? appWhiteColor
                                  : appPrimaryColor),
                        )),
                      ),
                    )),
                InkWell(
                    borderRadius: cr20,
                    onTap: () {
                      cnt.isHindi.value = false;
                      cnt.isGujarati.value = false;
                      cnt.isEnglish.value = true;
                      myController.changeLanguage(param1: 'en', param2: 'US');
                    },
                    child: Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: cnt.isEnglish.value
                              ? appPrimaryColor
                              : appWhiteColor,
                          borderRadius: cr20,
                          border: Border.all(color: appPrimaryColor),
                        ),
                        height: 60,
                        width: 100,
                        // color: ,
                        child: Center(
                            child: Text(
                          'English',
                          style: TextStyle(
                              color: cnt.isEnglish.value
                                  ? appWhiteColor
                                  : appPrimaryColor),
                        )),
                      ),
                    )),
              ],
            ),
            h20,
            Padding(
              padding: hz20,
              child: AppButton(
                press: () {
                  Get.to(ForgotPasswordScreen(
                    isChangePassword: true,
                  ));
                },
                title: 'Change Password',
              ),
            ),
            h20,
            Padding(
              padding: hz20,
              child: AppButton(
                press: () {
                  Get.to(const SignInScreen());
                },
                title: 'Logout',
              ),
            )
          ]),
    );
  }
}
