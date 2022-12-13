import 'package:eshop/app/data/common_widgets/Text_formField_widget.dart';
import 'package:eshop/app/data/common_widgets/sliver_appbar_widget.dart';
import 'package:eshop/app/utils/colors.dart';
import 'package:eshop/app/utils/constants.dart';
import 'package:eshop/app/utils/spacer_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
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
            _buildLoginForm(),
            SpacerWidget.h15,
            _buildForgotPass(),
            SpacerWidget.h20,
            _buildLoginButton(),
            SpacerWidget.h15,
            _buildSignUpText(),
            SpacerWidget.h60,
            _buildLoginWithText(),
            SpacerWidget.h15,
            _buildSocialIconsRow(),
            SpacerWidget.h20,
          ],
        ),
      ),
    );
  }

//Build Create account
  Widget _buildSignUpText() {
    return GestureDetector(
      onTap: () => controller.goSignupPage(),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: AppTextStyle.nw12,
          children: [
            TextSpan(text: "${Constants.donthaveAcc} "),
            TextSpan(
              text: Constants.signUp,
              style: AppTextStyle.bw12.copyWith(color: AppColors.red),
            ),
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

//Login with text
  Widget _buildLoginWithText() {
    return Align(
      alignment: Alignment.center,
      child: Text(
        Constants.loginWithText,
        style: AppTextStyle.nw12,
      ),
    );
  }

//Build Forgot Pass
  Widget _buildForgotPass() {
    return GestureDetector(
      onTap: () => controller.goForgetPasswordPage(),
      child: Container(
        width: 200.sp,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "${Constants.forgotPass}?",
              style: AppTextStyle.nw14,
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

//Build Login Button
  Widget _buildLoginButton() {
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
          Constants.login.toUpperCase(),
          style: AppTextStyle.bw14,
        ),
      ),
    );
  }

//Build Login Form
  Widget _buildLoginForm() {
    return Obx(() => Column(
          children: [
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
      inputAction: TextInputAction.go,
      suffixEye: controller.isPassSecure.value
          ? Icons.visibility_off
          : Icons.visibility,
      isPassField: true,
      isPassSecure: controller.isPassSecure.value,
      onchanged: (value) {
        controller.passwordTextEditingController.value.text == ''
            ? controller.isPassEmpty.value = true
            : controller.isPassEmpty.value = false;
      },
      suffixClick: () {
        controller.isPassSecure.value = !controller.isPassSecure.value;
      },
      label: Constants.password,
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

//Build Header Text
  Widget _buildHeaderText() {
    return Text(
      Constants.login,
      style: AppTextStyle.bw22,
    );
  }
}
