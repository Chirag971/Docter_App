import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class SignInCnt extends GetxController {
  // sign in controller
  TextEditingController signInEmailController =
      TextEditingController(text: './admin@gmail.com');
  TextEditingController signInPasswordController =
      TextEditingController(text: '123456');

  RxBool isRemember = false.obs;
  RxBool isvisible = true.obs;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signInWithEmailAndPassWord(String email, String password) async {
    try {
      final user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
