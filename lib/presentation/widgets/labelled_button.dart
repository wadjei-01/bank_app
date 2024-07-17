import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template_app/core/res/colors/app_colors.dart';
import 'package:template_app/core/res/typography/app_typography.dart';

class LabelledButton extends StatelessWidget {
  const LabelledButton({super.key, required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25.r,
          backgroundColor: AppColors.tertiaryColor,
          child: Icon(icon),
        ).paddingSymmetric(vertical: 5.h),
        Text(
          title,
          style: AppTypography.small.copyWith(
            color: AppColors.darkGrey,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
