import 'package:eshop/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  var emailTextEditingController = TextEditingController().obs;

  var validateEmailText = ''.obs;
  var isValidEmail = true.obs;

//Email validation
  void validateEmail(String value) {
    if (value == "") {
      validateEmailText.value = Constants.emailRequired;
      isValidEmail.value = false;
    } else if (!GetUtils.isEmail(value)) {
      validateEmailText.value = Constants.emailInvalid;
      isValidEmail.value = false;
    } else {
      validateEmailText.value = "";
      isValidEmail.value = true;
    }
  }
}
