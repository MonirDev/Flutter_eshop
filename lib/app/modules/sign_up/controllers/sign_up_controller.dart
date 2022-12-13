import 'package:eshop/app/routes/app_pages.dart';
import 'package:eshop/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final formkey = GlobalKey<FormState>();

  var nameTextEditingController = TextEditingController().obs;
  var emailTextEditingController = TextEditingController().obs;
  var passwordTextEditingController = TextEditingController().obs;
  var confirmPasswordTextEditingController = TextEditingController().obs;

  var validateEmailText = ''.obs;
  var validatePassText = ''.obs;
  var isValidEmail = true.obs;
  var isMatchedPass = true.obs;
  var isNameEmpty = false.obs;
  var isPassEmpty = false.obs;
  var isPassSecure = true.obs;
  var isConfirmPassEmpty = false.obs;
  var isConfirmPassSecure = true.obs;

//go Sign in page
  goSignInPage() {
    Get.offNamed(Routes.signIn);
  }

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

//Confirm Password validation
  void validateConfirmPassword(String value) {
    if (value == "") {
      validatePassText.value = Constants.pleaseRetypePass;
      isConfirmPassEmpty.value = true;
      isMatchedPass.value = false;
    } else if (passwordTextEditingController.value.text !=
        confirmPasswordTextEditingController.value.text) {
      validatePassText.value = Constants.passNotmatched;
      isConfirmPassEmpty.value = false;
      isMatchedPass.value = false;
    } else {
      validatePassText.value = "";
      isConfirmPassEmpty.value = false;
      isMatchedPass.value = true;
    }
  }
}
