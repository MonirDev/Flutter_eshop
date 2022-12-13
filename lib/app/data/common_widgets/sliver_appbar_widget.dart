import 'package:eshop/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SliverAppBarWidget extends StatelessWidget {
  final String? titleText;
  final double? elevation;
  final Color? bgColor;
  const SliverAppBarWidget(
      {super.key, this.titleText, this.elevation, this.bgColor});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: elevation,
      leading: GestureDetector(
        onTap: () => Get.back(),
        child: Icon(
          Icons.arrow_back_ios,
          size: 20.sp,
          color: AppColors.white,
        ),
      ),
      backgroundColor: bgColor ?? AppColors.primaryColor,
      floating: true,
    );
  }
}
