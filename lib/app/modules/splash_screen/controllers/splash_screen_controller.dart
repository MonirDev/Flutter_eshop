import 'dart:async';

import 'package:eshop/app/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  var opacity = 0.0.sp.obs;
  var size = 0.sp.obs;

  @override
  void onInit() {
    super.onInit();
    logoAnimation();
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAllNamed(Routes.bottomBar);
    });
  }

//Build animationFn
  Future<void> logoAnimation() async {
    Future.delayed(const Duration(milliseconds: 10), () {
      opacity.value = 1.0;
      // size.value = 100.0.sp;
    });
  }
}
