import 'package:template_app/core/res/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTypography {
  // Headline
  static TextStyle get headline => TextStyle(
      fontWeight: FontWeight.normal, fontSize: 36.sp, color: Colors.white);

  // Heading
  static TextStyle get headingOne => TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 32.sp,
      fontFamily: 'SupriaSans',
      color: AppColors.primaryColor);
  static TextStyle get headingTwo => TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 28.sp,
      fontFamily: 'SupriaSans',
      color: AppColors.primaryColor);
  static TextStyle get headingThree => TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 22.sp,
      fontFamily: 'SupriaSans',
      color: AppColors.primaryColor);
  static TextStyle get headingFour => TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 20.sp,
      fontFamily: 'SupriaSans',
      color: AppColors.primaryColor);
  static TextStyle get headingFive => TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 18.sp,
      fontFamily: 'SupriaSans',
      color: AppColors.primaryColor);
  static TextStyle get headingSix => TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16.sp,
      fontFamily: 'SupriaSans',
      color: AppColors.primaryColor);

  // Body
  static TextStyle get bodyOne =>
      TextStyle(fontSize: 16.sp, color: AppColors.grey);
  static TextStyle get bodyTwo =>
      TextStyle(fontSize: 14.sp, color: AppColors.grey);
  static TextStyle get caption =>
      TextStyle(fontSize: 12.sp, color: AppColors.grey);
  static TextStyle get small =>
      TextStyle(fontSize: 11.sp, color: AppColors.grey);
  static TextStyle get xSmall =>
      TextStyle(fontSize: 10.sp, color: AppColors.grey);
  static TextStyle get mutedCaption =>
      TextStyle(color: Colors.grey, fontSize: 12.sp);
  static TextStyle get resendButton =>
      TextStyle(color: AppColors.greyLighter, fontSize: 14.sp);

  // Currency Text
  static TextStyle get amountTextLarge => TextStyle(
        fontFamily: 'Gunar-Regular',
        fontWeight: FontWeight.w500,
        color: AppColors.primaryColor,
        fontSize: 35.sp,
      );
  static TextStyle get amountTextMedium => TextStyle(
        fontFamily: 'Gunar-Regular',
        fontWeight: FontWeight.w500,
        fontSize: 25.sp,
      );

  //Credit Card font
  static TextStyle get creditCardTextSmall => TextStyle(
        fontFamily: 'OCR-A',
        fontWeight: FontWeight.w500,
        fontSize: 10.sp,
      );

  // OTP
  static TextStyle get otpField => TextStyle(
      fontSize: 60.0.sp, fontWeight: FontWeight.w600, letterSpacing: 15.74);

  // Amount
  static TextStyle get moneyField =>
      TextStyle(fontSize: 52.0.sp, fontWeight: FontWeight.w600);
}
