//String constants
import 'package:eshop/app/utils/colors.dart';
import 'package:eshop/app/utils/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  static const String appName = "E-Shop";
  static const String envPath = "assets/.env";

  //
  ////
  static const String login = "Login";
  static const String name = "Name";
  static const String email = "Email";
  static const String password = "Password";
  static const String confirmPassword = "Confirm password";
  static const String emailRequired = "Email is required!";
  static const String nameRequired = "Name is required!";
  static const String passRequired = "Password is required!";
  static const String passNotmatched = "Password didn't match!";
  static const String enterpassFirst = "Enter above passowrd first";
  static const String pleaseRetypePass = "Please re-type the password";
  static const String emailInvalid =
      "Not a valid email address. Should be your@email.com";
  static const String forgotPass = "Forgot Password";
  static const String donthaveAcc = "Don't have account?";
  static const String alreadyHaveAccount = "Already have an account";
  static const String signUp = "Sign Up";
  static const String loginWithText = "Or login with social account";
  static const String signUpWithText = "Or sign up with social account";
  static const String send = "Send";
  static const String forgotDescriptionText =
      "Please, enter your email address. You will receive a link to create a new password via email.";
}

class ImagePath {
  static const String launcherImg = "assets/applauncher.png";
  static const String google = "assets/icons/google.png";
  static const String facebook = "assets/icons/facebook.png";
  static const String home = "assets/icons/home.png";
  static const String cart = "assets/icons/cart.png";
  static const String bag = "assets/icons/bag.png";
  static const String heart = "assets/icons/heart.png";
  static const String profile = "assets/icons/profile.png";
}

//////
//TextStyle
class AppTextStyle {
  //Bold Black
  static var bb30 = boldBlackTextStyle(30.sp);
  static var bb28 = boldBlackTextStyle(28.sp);
  static var bb24 = boldBlackTextStyle(24.sp);
  static var bb22 = boldBlackTextStyle(22.sp);
  static var bb20 = boldBlackTextStyle(20.sp);
  static var bb18 = boldBlackTextStyle(18.sp);
  static var bb16 = boldBlackTextStyle(16.sp);
  static var bb14 = boldBlackTextStyle(14.sp);
  static var bb12 = boldBlackTextStyle(12.sp);
  static var bb10 = boldBlackTextStyle(10.sp);
  //Normal black
  static var nb30 = normalBlackTextStyle(30.sp);
  static var nb28 = normalBlackTextStyle(28.sp);
  static var nb24 = normalBlackTextStyle(24.sp);
  static var nb22 = normalBlackTextStyle(22.sp);
  static var nb20 = normalBlackTextStyle(20.sp);
  static var nb18 = normalBlackTextStyle(18.sp);
  static var nb16 = normalBlackTextStyle(16.sp);
  static var nb14 = normalBlackTextStyle(14.sp);
  static var nb12 = normalBlackTextStyle(12.sp);
  static var nb10 = normalBlackTextStyle(10.sp);
  //Bold White
  static var bw30 = boldWhiteTextStyle(30.sp);
  static var bw28 = boldWhiteTextStyle(28.sp);
  static var bw24 = boldWhiteTextStyle(24.sp);
  static var bw22 = boldWhiteTextStyle(22.sp);
  static var bw20 = boldWhiteTextStyle(20.sp);
  static var bw18 = boldWhiteTextStyle(18.sp);
  static var bw16 = boldWhiteTextStyle(16.sp);
  static var bw14 = boldWhiteTextStyle(14.sp);
  static var bw12 = boldWhiteTextStyle(12.sp);
  static var bw10 = boldWhiteTextStyle(10.sp);
  //Normal White
  static var nw30 = normalWhiteTextStyle(30.sp);
  static var nw28 = normalWhiteTextStyle(28.sp);
  static var nw24 = normalWhiteTextStyle(24.sp);
  static var nw22 = normalWhiteTextStyle(22.sp);
  static var nw20 = normalWhiteTextStyle(20.sp);
  static var nw18 = normalWhiteTextStyle(18.sp);
  static var nw16 = normalWhiteTextStyle(16.sp);
  static var nw14 = normalWhiteTextStyle(14.sp);
  static var nw12 = normalWhiteTextStyle(12.sp);
  static var nw10 = normalWhiteTextStyle(10.sp);
}

/////
//Custom textStyle => Bold Black
TextStyle boldBlackTextStyle(double fontSize) {
  return TextStyle(
    fontSize: fontSize,
    color: AppColors.black,
    fontWeight: FontWeight.w600,
    fontFamily: Fonts.libreBaskerville,
  );
}

//Custom textStyle => Normal black
TextStyle normalBlackTextStyle(double fontSize) {
  return TextStyle(
    fontSize: fontSize,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
    fontFamily: Fonts.libreBaskerville,
  );
}

//Custom textStyle => Bold White
TextStyle boldWhiteTextStyle(double fontSize) {
  return TextStyle(
    fontSize: fontSize,
    color: AppColors.white,
    fontWeight: FontWeight.w600,
    fontFamily: Fonts.libreBaskerville,
  );
}

//Custom textStyle => Normal White
TextStyle normalWhiteTextStyle(double fontSize) {
  return TextStyle(
    fontSize: fontSize,
    color: AppColors.white,
    fontWeight: FontWeight.w400,
    fontFamily: Fonts.libreBaskerville,
  );
}
