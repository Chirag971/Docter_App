import 'package:doctor_app/forgot_password/forgot_password_cnt.dart';
import 'package:doctor_app/forgot_password/forgot_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant.dart';
import '../../../widget/app_button.dart';
import 'profile_cnt.dart';
import 'widget/storage.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cnt = Get.put(ProfileCnt());
    final forgotCnt = Get.put(ForgotCnt());

    return Scaffold(
        backgroundColor: appWhiteColor,
        appBar: AppBar(
          backgroundColor: appWhiteColor,
          elevation: 0,
          title: Text(
            'profile'.tr,
            style: TextStyle(color: appBlackColor),
          ),
          iconTheme: IconThemeData(color: appBlackColor),
          automaticallyImplyLeading: false,
        ),
        body: Obx(
          () => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const ListTile(
                //   leading: CircleAvatar(radius: 80, child: Icon(Icons.person)),
                //   title: Text('Person'),
                //   subtitle: Text('xyz@gmail.com'),
                // ),
                Padding(
                  padding: hz20,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey[300],
                        child: Icon(
                          Icons.person,
                          color: appBlackColor,
                        ),
                      ),
                      w20,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Person',
                          ),
                          Text('xyz@gmail.com')
                        ],
                      )
                    ],
                  ),
                ),
                h20,
                const Padding(
                  padding: hz30,
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
                          myController.changeLanguage(
                              param1: 'hi', param2: 'IN');
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
                          myController.changeLanguage(
                              param1: 'gu', param2: 'IN');
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
                          myController.changeLanguage(
                              param1: 'en', param2: 'US');
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
                  padding: hz30,
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
                  padding: hz30,
                  child: AppButton(
                    press: () {},
                    title: 'Logout',
                  ),
                )
              ]),
        ));
  }
}
