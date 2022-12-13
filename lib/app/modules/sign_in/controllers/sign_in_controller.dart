import 'package:eshop/app/routes/app_pages.dart';
import 'package:eshop/app/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  var emailTextEditingController = TextEditingController().obs;
  var passwordTextEditingController = TextEditingController().obs;

  var validateEmailText = ''.obs;
  var validatePassText = ''.obs;
  var isValidEmail = true.obs;
  var isPassEmpty = false.obs;
  var isPassSecure = true.obs;

//go Sign Up page
  goSignupPage() {
    Get.offNamed(Routes.signUp);
  }

//go Forget password page
  goForgetPasswordPage() {
    Get.toNamed(Routes.forgotPassword);
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
}
