import 'package:eshop/app/data/common_widgets/Text_formField_widget.dart';
import 'package:eshop/app/data/common_widgets/sliver_appbar_widget.dart';
import 'package:eshop/app/utils/colors.dart';
import 'package:eshop/app/utils/constants.dart';
import 'package:eshop/app/utils/spacer_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //For Unfocus TextField when user click outside
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: _buildBody(),
      ),
    );
  }

  //Build Body
  Widget _buildBody() {
    return CustomScrollView(
      slivers: [
        SliverAppBarWidget(
          elevation: 0,
        ),
        _buildBodyContent(),
      ],
    );
  }

//Build Body Content
  Widget _buildBodyContent() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 20.sp),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            SpacerWidget.h20,
            _buildHeaderText(),
            SpacerWidget.h40,
            _buildSignUpForm(),
            SpacerWidget.h15,
            _buildhaveAccount(),
            SpacerWidget.h20,
            _buildSignUpButton(),
            SpacerWidget.h60,
            _buildSignUpWithText(),
            SpacerWidget.h15,
            _buildSocialIconsRow(),
            SpacerWidget.h20,
          ],
        ),
      ),
    );
  }

//Build Icons Row
  Widget _buildSocialIconsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialIcon(ImagePath.google),
        SpacerWidget.w15,
        _buildSocialIcon(ImagePath.facebook),
      ],
    );
  }

//Build Social Icon
  Widget _buildSocialIcon(String iconPath) {
    return Container(
      height: 50.sp,
      width: 70.sp,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20.sp),
        ),
      ),
      child: Center(
        child: Image.asset(
          iconPath,
          height: 22.sp,
          width: 22.sp,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

//Sign Up with text
  Widget _buildSignUpWithText() {
    return Align(
      alignment: Alignment.center,
      child: Text(
        Constants.signUpWithText,
        style: AppTextStyle.nw12,
      ),
    );
  }

//Build already have account text
  Widget _buildhaveAccount() {
    return GestureDetector(
      onTap: () => controller.goSignInPage(),
      child: Container(
        width: 200.sp,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "${Constants.alreadyHaveAccount}?",
              style: AppTextStyle.nw12,
            ),
            SpacerWidget.w5,
            Icon(
              Icons.arrow_forward,
              color: AppColors.red,
              size: 20.sp,
            ),
          ],
        ),
      ),
    );
  }

//Build Sign up Button
  Widget _buildSignUpButton() {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(AppColors.red),
        shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25.sp),
            ),
          ),
        ),
      ),
      onPressed: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0.sp),
        child: Text(
          Constants.signUp.toUpperCase(),
          style: AppTextStyle.bw14,
        ),
      ),
    );
  }

//Build SignUp Form
  Widget _buildSignUpForm() {
    return Obx(() => Column(
          children: [
            _buildNameTextFormField(),
            controller.isNameEmpty.value == true
                ? _buildValidateText(Constants.nameRequired)
                : SizedBox(),
            SpacerWidget.h15,
            _buildEmailTextFormField(),
            controller.isValidEmail.value == false &&
                    controller.validateEmailText.value != ''
                ? _buildValidateText(controller.validateEmailText.value)
                : SizedBox(),
            SpacerWidget.h15,
            _buildPasswordTextFormField(),
            controller.isPassEmpty.value == true
                ? _buildValidateText(Constants.passRequired)
                : SizedBox(),
            SpacerWidget.h15,
            _buildConfirmPasswordTextFormField(),
            controller.isConfirmPassEmpty.value == true
                ? _buildValidateText(controller.validatePassText.value)
                : !controller.isMatchedPass.value
                    ? _buildValidateText(controller.validatePassText.value)
                    : SizedBox(),
          ],
        ));
  }

//Build validate Text
  Widget _buildValidateText(String value) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(top: 8.sp),
        child: Text(
          value,
          style: AppTextStyle.nw10.copyWith(color: AppColors.red),
        ),
      ),
    );
  }

  //Build Password TextFormField
  Widget _buildPasswordTextFormField() {
    return CustomTextFormField(
      controller: controller.passwordTextEditingController.value,
      inputType: TextInputType.visiblePassword,
      inputAction: TextInputAction.next,
      suffixEye: controller.isPassSecure.value
          ? Icons.visibility_off
          : Icons.visibility,
      isPassField: true,
      isPassSecure: controller.isPassSecure.value,
      onchanged: (value) {
        value == ''
            ? controller.isPassEmpty.value = true
            : controller.isPassEmpty.value = false;
      },
      suffixClick: () {
        controller.isPassSecure.value = !controller.isPassSecure.value;
      },
      label: Constants.password,
    );
  }

  //Build confirm Password TextFormField
  Widget _buildConfirmPasswordTextFormField() {
    return CustomTextFormField(
      controller: controller.confirmPasswordTextEditingController.value,
      inputType: TextInputType.visiblePassword,
      inputAction: TextInputAction.done,
      suffixEye: controller.isConfirmPassSecure.value
          ? Icons.visibility_off
          : Icons.visibility,
      isPassField: true,
      isPassSecure: controller.isConfirmPassSecure.value,
      isValid: controller.isMatchedPass.value,
      enabled: controller.passwordTextEditingController.value.text != "",
      onchanged: (value) {
        controller.validateConfirmPassword(value);
      },
      suffixClick: () {
        controller.isConfirmPassSecure.value =
            !controller.isConfirmPassSecure.value;
      },
      label: Constants.confirmPassword,
    );
  }

//Build Email TextFormField
  Widget _buildEmailTextFormField() {
    return CustomTextFormField(
      controller: controller.emailTextEditingController.value,
      inputType: TextInputType.emailAddress,
      inputAction: TextInputAction.next,
      suffixDone: Icons.done,
      suffixClose: Icons.close,
      isPassField: false,
      onchanged: (value) {
        controller.validateEmail(value);
      },
      suffixClick: () {
        if (!controller.isValidEmail.value) {
          FocusManager.instance.primaryFocus?.unfocus();
          controller.emailTextEditingController.value.text = "";
          controller.validateEmailText.value = '';
        }
      },
      isValid: controller.isValidEmail.value,
      label: Constants.email,
    );
  }

  //Build Name TextFormField
  Widget _buildNameTextFormField() {
    return CustomTextFormField(
      controller: controller.nameTextEditingController.value,
      inputType: TextInputType.text,
      inputAction: TextInputAction.next,
      isPassField: false,
      onchanged: (value) {
        value == ''
            ? controller.isNameEmpty.value = true
            : controller.isNameEmpty.value = false;
      },
      label: Constants.name,
    );
  }

//Build Header Text
  Widget _buildHeaderText() {
    return Text(
      Constants.signUp,
      style: AppTextStyle.bw22,
    );
  }
}
