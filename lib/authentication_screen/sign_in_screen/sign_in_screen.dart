import 'package:doctor_app/authentication_screen/sign_up_screen/sign_up_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../admin/admin_home_screen.dart';
import '../../constant.dart';
import '../../dashboard/dashboard.dart';
import '../../forgot_password/forgot_password_screen.dart';
import '../../text_constants.dart';
import '../../widget/app_button.dart';
import '../../widget/app_textfield.dart';
import '../page_flip_animation/page_flip_cnt.dart';
import 'sign_in_cnt.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  var signInCnt = Get.put(SignInCnt());
  var pageFlipCnt = Get.put(PageFlipCnt());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: hz30,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                      child: Image.asset(
                    'asset/logo.png',
                    scale: 5,
                  )),
                  h50,
                  const Center(
                    child: Text(
                      'Log In Now',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Please login to continue using our app',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ),
                  h40,
                  AppTextField(
                    inputType: TextInputType.emailAddress,
                    prefixIcon: const Icon(
                      Icons.email_rounded,
                    ),
                    validator: (value) {
                      final bool emailValid = RegExp(
                              r"^[a-z0-9.a-z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-z0-9]+\.[a-z]+")
                          .hasMatch(value ?? '');
                      if (value == null || value.isEmpty) {
                        return "Please Enter a email address";
                      } else if (!emailValid) {
                        return "Enter a valid email address";
                      }
                      return null;
                    },
                    controller: signInCnt.signInEmailController,
                    hintText: emailHint,
                  ),
                  h20,
                  Obx(
                    () => AppTextField(
                      obscureText: signInCnt.isvisible.value,
                      prefixIcon: const Icon(
                        Icons.lock,
                      ),
                      suffixIcon: InkWell(
                          onTap: () {
                            signInCnt.isvisible.value =
                                !signInCnt.isvisible.value;
                          },
                          child: Icon(
                            signInCnt.isvisible.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          )),
                      inputType: TextInputType.text,
                      validator: (value) {
                        bool hasCapital =
                            RegExp(r"[A-Z]").hasMatch(value ?? '');
                        bool hasSmall = RegExp(r"[a-z]").hasMatch(value ?? '');
                        bool hasNamber = RegExp(r"[0-9]").hasMatch(value ?? '');
                        if (value == null || value.isEmpty) {
                          return "Please enter a Storng password";
                        } else if (!hasCapital) {
                          return "contain at least one upper case";
                        } else if (!hasNamber) {
                          return "contain at least one digit";
                        } else if (!hasSmall) {
                          return "contain at least one lower case";
                        } else if (value.length < 8) {
                          return "Must be at least 8 characters in length";
                        }

                        return null;
                      },
                      controller: signInCnt.signInPasswordController,
                      hintText: passwordHint,
                    ),
                  ),
                  h10,
                  Row(
                    children: [
                      Obx(() => Checkbox(
                            splashRadius: 10,
                            checkColor: appWhiteColor,
                            fillColor:
                                MaterialStateProperty.all(appPrimaryColor),
                            visualDensity: VisualDensity.comfortable,
                            onChanged: (value) {
                              debugPrint(value.toString());
                              signInCnt.isRemember.value = value!;
                            },
                            value: signInCnt.isRemember.value,
                          )),
                      const Text(rememberMe),
                      const Spacer(),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgotPasswordScreen(),
                                ));
                          },
                          child: Text(
                            'forgot Password?',
                            style: TextStyle(color: appPrimaryColor),
                          )),
                    ],
                  ),
                  h10,
                  AppButton(
                    press: () {
                      if (signInCnt.signInEmailController.text ==
                              './admin@gmail.com' &&
                          signInCnt.signInPasswordController.text == '123456') {
                        Get.to(const AdminHomeScreen());
                      } else {
                        signInCnt.signInWithEmailAndPassWord(
                            signInCnt.signInEmailController.text,
                            signInCnt.signInPasswordController.text);
                        Get.to(const Dashboard());
                      }

                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => const Dashboard(),
                      //     ));
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
                  Center(
                    child: RichText(
                      text: TextSpan(
                          text: 'Already have an account ? ',
                          style: const TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                                text: 'Sign Up',
                                style: TextStyle(color: appPrimaryColor),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.to(const SignUpScreen());
                                    // Navigator.of(context).push(
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           const SignUpScreen()),
                                    // );
                                    // Get.to(const SignUpScreen());
                                    pageFlipCnt.pageFlipKey.currentState
                                        ?.flip();
                                  })
                          ]),
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
