import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template_app/presentation/viewmodel/auth/auth_viewmodel.dart';
import 'package:template_app/presentation/widgets/custom_button.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  static const id = '/settings';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authViewModel = ref.watch(AuthViewModel.provider);

    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          CustomTextButton(
            text: 'Logout',
            onTap: () {
              authViewModel.logoutUser();
            },
          )
        ],
      ).paddingSymmetric(vertical: 200.h, horizontal: 15.w),
    );
  }
}
