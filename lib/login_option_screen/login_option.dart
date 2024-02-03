import 'package:doctor_app/authentication_screen/page_flip_animation/page_flipt_animation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../authentication_screen/sign_in_screen/sign_in_screen.dart';
import '../constant.dart';
import '../widget/app_button.dart';
import '../widget/sign_in_button.dart';

class LoginOptionScreen extends StatelessWidget {
  const LoginOptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          h50,
          SizedBox(
              // color: Colors.black12,r
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.6,
              child: Image.asset(
                'asset/option_vector.png',
              )),
          const Text(
            "Let's you in",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          h40,
          SignInButton(
            image: 'asset/facebook.png',
            title: 'signInWithFacebook'.tr,
            press: () {},
          ),
          h20,
          SignInButton(
              image: 'asset/google_logo.png',
              title: 'signInWithGoogle'.tr,
              press: () async {
                try {
                  final GoogleSignIn googleSignIn = GoogleSignIn();
                  final googleUser = await googleSignIn.signIn();
                  if (googleUser == null) return;
                  final googleAuth = await googleUser.authentication;
                  final credential = GoogleAuthProvider.credential(
                    accessToken: googleAuth.accessToken,
                    idToken: googleAuth.idToken,
                  );
                  await FirebaseAuth.instance.signInWithCredential(credential);
                } catch (e) {
                  debugPrint(e.toString());
                }
              }),
          h20,
          SignInButton(
            image: 'asset/apple_logo.png',
            title: 'signInWithGoogle'.tr,
            press: () {},
          ),
          h20,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Divider(
                thickness: 1,
                color: Colors.black,
              ),
              Text("OR"),
              Divider(
                thickness: 1,
                color: Colors.black,
              )
            ],
          ),
          h20,
          AppButton(
            press: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => const SignInScreen(),
              //     ));
              Get.to(const PageFlipAnimation());
            },
            title: 'signInWithPassword'.tr,
          ),
        ]),
      ),
    );
  }
}
