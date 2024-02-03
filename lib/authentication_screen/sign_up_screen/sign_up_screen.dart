import 'package:doctor_app/authentication_screen/page_flip_animation/page_flip_cnt.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import '../../dashboard/dashboard.dart';
import '../../text_constants.dart';
import '../../widget/app_button.dart';
import '../../widget/app_textfield.dart';
import 'sign_up_cnt.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var signUpCnt = Get.put(SignUpCnt());
    var pageFlipCnt = Get.put(PageFlipCnt());

    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          alignment: Alignment.center,
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: hz30,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Image.asset(
                    'asset/logo.png',
                    scale: 5,
                  )),
                  h50,
                  const Text(
                    'Sign Up Now',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Please fill the details and create account',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  h20,
                  AppTextField(
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    controller: signUpCnt.signUpNameController,
                    hintText: nameHint,
                  ),
                  h20,
                  AppTextField(
                    prefixIcon: const Icon(Icons.email),
                    controller: signUpCnt.signUpEmailController,
                    hintText: emailHint,
                  ),
                  h20,
                  Obx(
                    () => AppTextField(
                      obscureText: signUpCnt.isvisible.value,
                      suffixIcon: InkWell(
                        onTap: () {
                          signUpCnt.isvisible.value =
                              !signUpCnt.isvisible.value;
                        },
                        child: Icon(
                          signUpCnt.isvisible.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                      ),
                      prefixIcon: const Icon(Icons.lock),
                      controller: signUpCnt.signUpPasswordController,
                      hintText: passwordHint,
                    ),
                  ),
                  h30,
                  AppButton(
                    press: () {
                      signUpCnt.signUpWithEmailAndPassWord(
                          signUpCnt.signUpEmailController.text,
                          signUpCnt.signUpPasswordController.text);
                      Get.to(const Dashboard());
                    },
                    title: signIn,
                  ),
                  h20,
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const Divider(
                        thickness: 1,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        color: Colors.white,
                        child: const Text(
                          'Or continue with',
                          style: TextStyle(
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  h20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 60,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(appWhiteColor),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                          color: buttonBorderColor)))),
                          child: Image.asset(
                            'asset/facebook.png',
                            height: 40,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      w20,
                      SizedBox(
                        height: 50,
                        width: 60,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(appWhiteColor),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                          color: buttonBorderColor)))),
                          child: Image.asset(
                            'asset/google_logo.png',
                            height: 40,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      w20,
                      SizedBox(
                        height: 50,
                        width: 60,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(appWhiteColor),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                          color: buttonBorderColor)))),
                          child:
                              Image.asset('asset/apple_logo.png', height: 40),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  h20,
                  RichText(
                    text: TextSpan(
                        text: 'Already have an account ? ',
                        style: const TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                              text: 'Sign In',
                              style: TextStyle(color: appPrimaryColor),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Get.back();
                                  pageFlipCnt.pageFlipKey.currentState?.flip();
                                  // Navigator.pop(context);
                                })
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
