import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template_app/core/res/colors/app_colors.dart';
import 'package:template_app/core/res/typography/app_typography.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.child,
    this.onTap,
    this.height,
    this.width,
    this.backgroundColor,
    this.boxShadow,
    this.gradient,
    this.radius,
    this.padding,
    this.constraints,
    this.margin,
  });

  final Widget? child;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Function()? onTap;
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient;
  final BorderRadius? radius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      clipBehavior: Clip.antiAlias,
      height: height ?? 60.h,
      width: width ?? double.infinity,
      constraints: constraints,
      margin: margin,
      decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.tertiaryColor,
          gradient: gradient,
          boxShadow: boxShadow,
          borderRadius: radius ?? BorderRadius.circular(10.r)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          splashColor: backgroundColor?.darken() ?? AppColors.tertiaryColor,
          child: Container(
            padding: padding,
            alignment: Alignment.center,
            child: child,
          ),
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    this.text,
    this.onTap,
    this.backgroundColor,
    this.height,
    this.width,
  });
  final String? text;
  final Function()? onTap;
  final Color? backgroundColor;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: onTap,
      backgroundColor: backgroundColor,
      height: height,
      width: width,
      child: Text(
        text ?? '',
        style: AppTypography.bodyOne.copyWith(color: Colors.white),
      ),
    );
  }
}
