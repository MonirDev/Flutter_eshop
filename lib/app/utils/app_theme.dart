import 'package:eshop/app/utils/colors.dart';
import 'package:eshop/app/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppThemeData {
  static ThemeData themeData = ThemeData(
    primaryColor: AppColors.primaryColor,
    colorScheme: const ColorScheme(
      primary: AppColors.accentColor,
      secondary: AppColors.accentColor,
      surface: AppColors.accentColor,
      background: AppColors.accentColor,
      error: AppColors.red,
      onPrimary: AppColors.white,
      onSecondary: AppColors.accentColor,
      onSurface: AppColors.accentColor,
      onBackground: AppColors.white,
      onError: AppColors.red,
      brightness: Brightness.light,
    ),
    splashColor: AppColors.splashColor,
    highlightColor: AppColors.highlightColor,
    fontFamily: Fonts.libreBaskerville,
    dividerColor: AppColors.grey,
    indicatorColor: AppColors.primaryColor,

//TextTheme
    textTheme: TextTheme(
      caption: TextStyle(
        fontSize: 9.0.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headline1: TextStyle(
        fontSize: 20.0.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headline2: TextStyle(
        fontSize: 19.0.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headline3: TextStyle(
        fontSize: 18.5.sp,
        fontWeight: FontWeight.w700,
        color: Color(0xFF28a745),
      ),
      headline4: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: Color(
          0xff555555,
        ),
      ),
      headline5: TextStyle(
        fontSize: 18.sp,
        color: Color(0xff1a1919),
        fontWeight: FontWeight.w700,
      ),
      headline6: TextStyle(
        fontSize: 16.sp,
        color: Color(0xff777777),
        fontWeight: FontWeight.w600,
      ),
      bodyText1: TextStyle(
        fontSize: 16.0.sp,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      bodyText2: TextStyle(
        fontSize: 14.0.sp,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    ),
//ElevatedButtonThemeData
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
      ),
    ),
//IconThemeData
    iconTheme: IconThemeData(
      color: Colors.grey,
      size: 25.0.sp,
    ),
// textButtonTheme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        padding: EdgeInsets.symmetric(
          vertical: 10.sp,
          horizontal: 20.sp,
        ),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(
        AppColors.white,
      ),
      fillColor: MaterialStateProperty.all(
        AppColors.accentColor,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          3,
        ),
      ),
    ),
//InputDecorationTheme
    inputDecorationTheme: InputDecorationTheme(
      // constraints: BoxConstraints(maxHeight: 44.sp, minHeight: 44.sp),
      contentPadding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 16.sp),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: AppColors.grey.withOpacity(0.75)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: AppColors.primaryColor.withOpacity(0.75)),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: AppColors.red.withOpacity(0.75)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: AppColors.red.withOpacity(0.75)),
      ),
      errorStyle: Get.textTheme.bodyText2!.copyWith(
          fontSize: 12.sp,
          color: const Color(
            0xffdc3545,
          ),
          fontWeight: FontWeight.normal),
      hintStyle: Get.textTheme.headline1!.copyWith(
          color: AppColors.primaryColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400),
    ),
  );
}
