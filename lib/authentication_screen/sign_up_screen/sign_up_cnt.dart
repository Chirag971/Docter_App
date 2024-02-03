import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpCnt extends GetxController {
  // sign up controller
  TextEditingController signUpNameController = TextEditingController();
  TextEditingController signUpEmailController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();

  RxBool isvisible = true.obs;

  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> signUpWithEmailAndPassWord(String email, String password) async {
    try {
      final user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
