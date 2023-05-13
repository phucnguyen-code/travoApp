import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travo_app/core/constants/color_palatte.dart';

import '../representation/screen/home_screen.dart';
import '../representation/screen/login_screen.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  bool isLoging = false;
  User? get user => _user.value;
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.authStateChanges());
    ever(_user, loginRedirect);
  }

  loginRedirect(User? user) {
    if (user == null) {
      isLoging = false;
      update();
      Get.offAll(() => const LoginScreen());
    } else {
      isLoging = true;
      update();
      Get.offAll(() => const HomeScreen());
    }
  }

  void registerUser(email, password) async {
    try {
      isLoging = true;
      update();
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      getSuccessSnackBar("Successfully logged in as ${_user.value!.email}");
    } on FirebaseAuthException catch (e) {
      //define error
      getErrorSnackBar("Account Creating Failed", e);
    }
  }

  void login(email, password) async {
    try {
      isLoging = true;
      update();
      await auth.signInWithEmailAndPassword(email: email, password: password);
      getSuccessSnackBar("Successfully logged in as ${_user.value!.email}");
    } on FirebaseAuthException catch (e) {
      //define error
      getErrorSnackBar("Login Failed", e);
    }
  }

  void forgorPassword(email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      getSuccessSnackBar("Reset mail sent successfully. Check mail!");
    } on FirebaseAuthException catch (e) {
      getErrorSnackBar("Error", e);
    }
  }

  getSuccessSnackBar(String message) {
    Get.snackbar(
      "Success",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: ColorPalette.primaryColor,
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
    );
  }

  getErrorSnackBar(String message, _) {
    Get.snackbar(
      "Error",
      "$message\n${_.message}",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: ColorPalette.primaryColor,
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
    );
  }
}
