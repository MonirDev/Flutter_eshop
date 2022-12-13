import 'package:eshop/app/utils/colors.dart';
import 'package:eshop/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final IconData? suffixDone;
  final IconData? suffixClose;
  final IconData? suffixEye;
  final bool? isValid;
  final bool? isPassField;
  final bool? isPassSecure;
  final bool? enabled;
  final String? validateText;
  final String label;
  final Function(String) onchanged;
  final Function()? suffixClick;
  const CustomTextFormField({
    super.key,
    this.controller,
    this.inputType,
    this.inputAction,
    this.suffixDone,
    this.suffixClose,
    this.suffixEye,
    this.isValid,
    this.isPassField,
    this.isPassSecure,
    this.validateText,
    this.suffixClick,
    required this.onchanged,
    required this.label,
    this.enabled,
  });
  static const InputBorder transparentBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.transparent,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.sp,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColors.grey.withOpacity(0.1),
          border: Border.all(
              color: isValid == false && controller!.text != ''
                  ? AppColors.red
                  : AppColors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(5.sp))),
      child: Padding(
        padding: EdgeInsets.only(top: 8.sp),
        child: TextFormField(
          controller: controller,
          keyboardType: inputType,
          textInputAction: inputAction,
          maxLines: 1,
          enabled: enabled ?? true,
          style: AppTextStyle.nw16,
          cursorColor: AppColors.white,
          obscureText: isPassSecure ?? false,
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: suffixClick ?? () {},
              child: Padding(
                padding: EdgeInsets.only(bottom: 8.sp),
                child: isValid == true &&
                        controller!.text != '' &&
                        isPassField == false
                    ? Icon(
                        suffixDone,
                        color: AppColors.green,
                      )
                    : isValid == false &&
                            controller!.text != '' &&
                            isPassField == false
                        ? Icon(
                            suffixClose,
                            color: AppColors.red,
                          )
                        : isPassField == true
                            ? Icon(
                                suffixEye,
                                color: AppColors.grey,
                              )
                            : null,
              ),
            ),
            label: Padding(
              padding: EdgeInsets.only(bottom: 8.sp),
              child: Text(
                label,
                style: AppTextStyle.nw14.copyWith(
                    color: isValid == false && controller!.text != ''
                        ? AppColors.red
                        : AppColors.grey),
              ),
            ),
            border: transparentBorder,
            focusedBorder: transparentBorder,
            errorBorder: transparentBorder,
            focusedErrorBorder: transparentBorder,
            disabledBorder: transparentBorder,
            enabledBorder: transparentBorder,
          ),
          onChanged: onchanged,
        ),
      ),
    );
  }
}
