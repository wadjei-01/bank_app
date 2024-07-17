import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:template_app/core/res/colors/app_colors.dart';

enum CustomDialogType { success }

typedef Extras = Map<String, dynamic>;

class CustomDialog {
  static AlertDialog _showDialog(
      {required Widget title, Widget? body, required List<Widget> actions}) {
    return AlertDialog(
      icon: title,
      content: body,
      actions: actions,
      insetPadding: EdgeInsets.all(0.r),
      actionsPadding: EdgeInsets.all(5.r),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.r)),
    );
  }

  static dynamic successDialog(BuildContext context, Extras extras) {
    return _showDialog(
        title: Icon(
          EvaIcons.checkmark_circle,
          color: AppColors.tertiaryColor,
          size: 50.r,
        ),
        body: Text(extras['title']),
        actions: [
          PlatformDialogAction(
            onPressed: () => context.pop('Cancel'),
            child: const Text('Cancel'),
          ),
          PlatformDialogAction(
            onPressed: () => context.pop('Agree'),
            child: const Text('Accept'),
          )
        ]);
  }

  static dynamic failureDialog(BuildContext context, Extras extras) {
    return _showDialog(
        title: Icon(
          EvaIcons.close_circle,
          color: AppColors.secondaryColor,
          size: 50.r,
        ),
        body: Text(extras['title']),
        actions: [
          PlatformDialogAction(
            onPressed: () => context.pop('Cancel'),
            child: const Text('Cancel'),
          ),
          PlatformDialogAction(
            onPressed: () => context.pop('Agree'),
            child: const Text('Accept'),
          )
        ]);
  }
}
