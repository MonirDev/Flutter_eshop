import 'package:eshop/app/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, _) => GetMaterialApp(
        title: "Application",
        initialRoute: AppPages.initial,
        getPages: AppPages.routes,
        theme: AppThemeData.themeData,
      ),
    ),
  );
}
