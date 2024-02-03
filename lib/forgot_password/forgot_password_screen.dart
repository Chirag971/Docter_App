import 'package:doctor_app/forgot_password/email_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant.dart';
import '../widget/app_button.dart';
import '../widget/app_textfield.dart';
import 'forgot_password_cnt.dart';

class ForgotPasswordScreen extends StatelessWidget {
  bool isChangePassword;
  ForgotPasswordScreen({Key? key, this.isChangePassword = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var forgotCnt = Get.put(ForgotCnt());
    return Scaffold(
      body: Padding(
        padding: hz20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                isChangePassword
                    ? 'Change Your Password?'
                    : 'kForgotYourPassword'.tr,
                style: TextStyle(fontSize: 30, color: appPrimaryColor),
              ),
            ),
            h24,
            AppTextField(
              controller: forgotCnt.forgotEmailController,
              hintText: 'emailHint'.tr,
            ),
            h20,
            AppButton(
              press: () {
                forgotCnt.getForgotMail(
                    email: forgotCnt.forgotEmailController.text);
                Get.to(EmailVerificationScreen());
              },
              title: isChangePassword ? 'Change Password' : 'forgotPassword'.tr,
            ),
            h40,
          ],
        ),
      ),
    );
  }
}
