import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template_app/core/res/typography/app_typography.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.subtitle,
  });

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      titleSpacing: 15.w,
      toolbarHeight: kToolbarHeight + 20.h,
      pinned: true,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTypography.headingThree.copyWith(color: Colors.black),
          ),
          if (subtitle != null) ...[
            SizedBox(
              height: 5.h,
            ),
            Text(
              subtitle ?? '',
              style: AppTypography.bodyOne,
            )
          ]
        ],
      ),
    );
  }
}
