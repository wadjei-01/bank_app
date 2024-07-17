import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:template_app/core/helpers/custom_dialogs.dart';
import 'package:template_app/core/res/colors/app_colors.dart';
import 'package:template_app/presentation/base/bottom_navbar/bottom_navbar.dart';
import 'package:template_app/presentation/widgets/custom_button.dart';
// import 'package:template_app/presentation/viewmodel/auth/auth_viewmodel.dart';

class BaseScreen extends ConsumerWidget {
  const BaseScreen({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final baseViewModel = ref.watch(BaseViewModel.provider);
    // final authViewModel = ref.watch(AuthViewModel.provider);
    return Scaffold(
      body: child,
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomButton(
          backgroundColor: AppColors.secondaryColor,
          height: 55.r,
          width: 55.r,
          radius: BorderRadius.circular(30.r),
          onTap: () async {
            final val = await context.push('/success', extra: {
              'title': 'Hello this is a public service announcement',
              'icon': EvaIcons.checkmark_circle_2
            });

            print('Value:>> $val');
          },
          boxShadow: [
            BoxShadow(
              color: AppColors.secondaryColor.shade100.withOpacity(0.5),
              offset: Offset(0, 3.h),
              blurRadius: 3.r,
              spreadRadius: 1.r,
            )
          ],
          gradient: RadialGradient(
              radius: 0.6.r,
              center: Alignment.center,
              colors: [
                AppColors.secondaryColor.shade200,
                AppColors.secondaryColor
              ]),
          child: Icon(
            EvaIcons.browser_outline,
            color: Colors.white,
            size: 30.r,
          )),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
