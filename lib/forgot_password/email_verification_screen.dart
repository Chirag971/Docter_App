import 'package:doctor_app/forgot_password/forgot_password_cnt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant.dart';
import '../text_constants.dart';
import '../widget/app_button.dart';

class EmailVerificationScreen extends StatelessWidget {
  EmailVerificationScreen({
    Key? key,
  }) : super(key: key);

  final cnt = Get.put(ForgotCnt());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: hz30,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            h50,
            Text(
              kCheckEmail,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: buttonBorderColor),
            ),
            h24,
            Text(
              "Please check the email address ${cnt.forgotEmailController.text} for instruction to reset your password",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: buttonBorderColor),
            ),
            h24,
            Padding(
              padding: hz60,
              child: AppButton(
                  title: kResendEmail,
                  press: () =>
                      cnt.getForgotMail(email: cnt.forgotEmailController.text)),
            )
          ],
        ),
      ),
    );
  }
}
