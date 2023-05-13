import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travo_app/core/constants/color_palatte.dart';

class InputValidator {
  static bool validateField(String title, String value) {
    if (value.trim().isNotEmpty) {
      return true;
    }
    Get.snackbar(
      "Error",
      "$title is empty",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: ColorPalette.primaryColor,
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
    );
    return false;
  }

  static bool validatePassword(String value1, String value2) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    if (!regExp.hasMatch(value1)) {
      Get.snackbar(
        "Error",
        "should contain at least one upper case, one lower case, one digit, one Special character, least 8 characters in length ",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: ColorPalette.primaryColor,
        colorText: Colors.white,
        borderRadius: 10,
        margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      );
      return false;
    } else if (value1.trim() == value2.trim()) {
      return true;
    }
    Get.snackbar(
      "Error",
      "Confirm Password do not match",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: ColorPalette.primaryColor,
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
    );
    return false;
  }
}
