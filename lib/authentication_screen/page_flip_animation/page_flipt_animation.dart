import 'package:doctor_app/authentication_screen/page_flip_animation/page_flip_cnt.dart';
import 'package:doctor_app/authentication_screen/sign_in_screen/sign_in_screen.dart';
import 'package:doctor_app/authentication_screen/sign_up_screen/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_flip_builder/page_flip_builder.dart';

class PageFlipAnimation extends StatelessWidget {
  const PageFlipAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cnt = Get.put(PageFlipCnt());

    return Scaffold(
      body: Container(
        key: cnt.pageFlipKey,
        child: PageFlipBuilder(
          backBuilder: (context) => const SignUpScreen(),
          frontBuilder: (context) => const SignInScreen(),
          flipAxis: Axis.horizontal,
        ),
      ),
    );
  }
}
