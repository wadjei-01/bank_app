import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template_app/core/res/colors/app_colors.dart';
import 'package:template_app/presentation/base/bottom_navbar/navbar_model.dart';
import 'package:template_app/presentation/viewmodel/base/base_viewmodel.dart';

class BottomNavBar extends HookConsumerWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navBarList = NavBarModel.navList;

    final baseViewModel = ref.watch(BaseViewModel.provider);
    return BottomAppBar(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.r,
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: navBarList.map((navItem) {
              final isCurrentPath =
                  navItem.path == baseViewModel.getCurrentNavPath();
              return Container(
                margin: navItem.margin,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      final path = navItem.path;

                      baseViewModel.currentNavPath = path;
                      context.goNamed(path);
                    },
                    customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r)),
                    child: Column(
                      children: [
                        AnimatedContainer(
                          width: 35.r,
                          height: 35.r,
                          margin: EdgeInsets.only(bottom: 1.h),
                          alignment: Alignment.bottomCenter,
                          duration: const Duration(milliseconds: 250),
                          child: Icon(
                            isCurrentPath
                                ? navItem.iconSelected
                                : navItem.iconUnselected,
                            color: isCurrentPath
                                ? AppColors.tertiaryColor
                                : AppColors.darkGrey,
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          height: 2.h,
                          width: isCurrentPath ? 15.w : 0,
                          decoration: BoxDecoration(
                              color: isCurrentPath
                                  ? AppColors.tertiaryColor
                                  : AppColors.tertiaryColor.withOpacity(0),
                              borderRadius: BorderRadius.circular(1.5.r)),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }).toList()));
  }
}
