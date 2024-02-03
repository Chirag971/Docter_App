import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotCnt {
  // Forgot Password Controller
  TextEditingController forgotEmailController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  void getForgotMail({String? email}) {
    auth
        .sendPasswordResetEmail(email: email ?? '')
        .then((value) => debugPrint('send email succesfully'));
  }
}
