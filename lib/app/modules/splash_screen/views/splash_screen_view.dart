import 'package:eshop/app/utils/colors.dart';
import 'package:eshop/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: _buildBody(),
      ),
    );
  }

//Build Body with TweenAnimationBuilder
  Widget _buildBody() {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        TweenAnimationBuilder(
            child: const Text(''),
            tween: Tween<double>(begin: 0, end: 1),
            duration: const Duration(milliseconds: 1500),
            builder: (BuildContext context, double val, Widget? child) {
              return Opacity(
                opacity: val,
                child: Container(
                  margin: EdgeInsets.only(top: val * 260.h),
                  child: Image.asset(
                    ImagePath.launcherImg,
                    height: val * 120.h,
                    width: val * 120.h,
                    fit: BoxFit.fill,
                  ),
                ),
              );
            }),
        Obx(() => Container(
              width: Get.width,
              margin: EdgeInsets.only(top: 350.h),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 1500),
                opacity: controller.opacity.value,
                child: SpinKitThreeInOut(
                  color: AppColors.grey,
                  size: 30.h,
                ),
              ),
            )),
      ],
    );
  }
//Build Body WITH AnimatedContainer
  // Widget _buildBody() {
  //   return Obx(() => Stack(
  //         alignment: Alignment.center,
  //         children: [
  //           AnimatedContainer(
  //             duration: const Duration(seconds: 2),
  //             height: controller.size.value,
  //             width: controller.size.value,
  //             child: Image.asset(
  //               ImagePath.launcherImg,
  //               fit: BoxFit.fill,
  //             ),
  //           ),
  //           Container(
  //             margin: EdgeInsets.only(top: 400.h),
  //             child: AnimatedOpacity(
  //               duration: const Duration(seconds: 3),
  //               opacity: controller.opacity.value,
  //               child: SpinKitThreeInOut(
  //                 color: AppColors.grey,
  //                 size: 25.sp,
  //               ),
  //             ),
  //           ),
  //         ],
  //       ));
  // }

  //dummy
  // SizedBox(
  //             width: Get.width,
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Container(
  //                   margin: EdgeInsets.only(top: 40.h),
  //                   height: 280.h,
  //                   width: Get.width,
  //                   child: Column(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: [
  //                       AnimatedContainer(
  //                         duration: const Duration(seconds: 1),
  //                         height: controller.size.value,
  //                         width: controller.size.value,
  //                         child: Image.asset(
  //                           ImagePath.launcherImg,
  //                           fit: BoxFit.fill,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //                 AnimatedOpacity(
  //                   duration: const Duration(seconds: 3),
  //                   opacity: controller.opacity.value,
  //                   child: SpinKitThreeInOut(
  //                     color: AppColors.grey,
  //                     size: 25.sp,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           )
}
