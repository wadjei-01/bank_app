import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:template_app/core/res/colors/app_colors.dart';
import 'package:template_app/core/res/gen/assets.gen.dart';
import 'package:template_app/core/res/typography/app_typography.dart';
import 'package:template_app/presentation/viewmodel/auth/auth_viewmodel.dart';
import 'package:template_app/presentation/viewmodel/auth/login/login_viewmodel.dart';
import 'package:template_app/presentation/widgets/custom_button.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});
  static const id = '/login';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    final loginViewModel = ref.watch(LoginViewModel.provider);

    final authViewModel = ref.watch(AuthViewModel.provider);

    final bool obsecureText = loginViewModel.obsecureText;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    Assets.images.logoText,
                    width: 70.w,
                  ),
                ),
                Text(
                  'Login',
                  style: AppTypography.headingFour,
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextField(
                  controller: emailController,
                  hintText: 'email',
                  prefixIcon: EvaIcons.email,
                ),
                SizedBox(
                  height: 30.h,
                ),
                CustomTextField(
                  controller: passwordController,
                  hintText: 'password',
                  prefixIcon: EvaIcons.lock,
                  isObscure: loginViewModel.obsecureText,
                  iconButton: IconButton(
                      onPressed: () {
                        loginViewModel.switchObsecure();
                      },
                      icon: Icon(
                        obsecureText ? EvaIcons.eye_off : EvaIcons.eye,
                        color: obsecureText
                            ? AppColors.grey
                            : AppColors.primaryColor,
                      )),
                ),
                SizedBox(
                  height: 50.h,
                ),
                CustomButton(
                  onTap: () {
                    //TODO: fix login
                    if (emailController.text.isNotEmpty) {
                      authViewModel.loginUser(emailController.text);
                    }
                  },
                  child: Text(
                    'Log In',
                    style:
                        AppTypography.headingFive.copyWith(color: Colors.white),
                  ),
                )
              ],
            ).paddingSymmetric(horizontal: 15.w),
          )
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.textInputType,
    this.isObscure = false,
    this.iconButton,
  });

  final TextEditingController controller;
  final String hintText;
  final IconData? prefixIcon;
  final TextInputType? textInputType;
  final bool isObscure;
  final IconButton? iconButton;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autofocus: true,
      keyboardType: textInputType ?? TextInputType.text,
      obscureText: isObscure,
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefixIcon,
          color: AppColors.darkGrey.darken(),
        ),
        suffixIcon: iconButton,
        focusColor: AppColors.secondaryColor,
        labelText: hintText,
        labelStyle: AppTypography.headingSix.copyWith(color: AppColors.grey),
        hintText: 'Enter your $hintText',
        fillColor: AppColors.bgColor,
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: AppColors.grey)),
        contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
      ),
    );
  }
}
