import 'package:eshop/app/utils/colors.dart';
import 'package:eshop/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String? titleText;
  final double? elevation;
  final Color? bgColor;
  AppbarWidget({super.key, this.titleText, this.elevation, this.bgColor});
  var appbar = AppBar();
  @override
  Size get preferredSize => appbar.preferredSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor ?? AppColors.primaryColor,
      leading: Icon(
        Icons.arrow_back_ios,
        size: 25.sp,
        color: AppColors.white,
      ),
      title: Text(
        titleText ?? '',
        style: AppTextStyle.nw18,
      ),
      elevation: elevation,
    );
  }
}
