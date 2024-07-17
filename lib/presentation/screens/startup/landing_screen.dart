import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:models/models.dart';
import 'package:template_app/core/helpers/string_utils.dart';
import 'package:template_app/core/res/colors/app_colors.dart';
import 'package:template_app/core/res/typography/app_typography.dart';
import 'package:template_app/presentation/screens/auth/login_screen.dart';
import 'package:template_app/presentation/screens/main/home/home_screen.dart';
import 'package:template_app/presentation/viewmodel/auth/auth_viewmodel.dart';
import 'package:template_app/presentation/widgets/credit_card_container.dart';
import 'package:template_app/presentation/widgets/custom_button.dart';

class LandingScreen extends ConsumerWidget {
  const LandingScreen({super.key});

  static const id = '/landing';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authViewModel = ref.watch(AuthViewModel.provider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              clipBehavior: Clip.antiAlias,
              height: 0.5.sh,
              width: 1.sw,
              decoration: BoxDecoration(color: AppColors.bgColor, boxShadow: [
                BoxShadow(
                    blurStyle: BlurStyle.inner,
                    offset: const Offset(0, -150),
                    spreadRadius: 30.r,
                    blurRadius: 3.r)
              ]),
              child: Stack(children: [
                Positioned(
                  left: -10.w,
                  top: 160.h,
                  child: RotatedCreditCardContainer(
                    cardNumber: StringUtils.getRandomizedCardNumber(),
                    amount: StringUtils.generateRandomAmount(),
                    index: 1,
                  ),
                ),
              ]),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 50.h),
              height: 0.5.sh,
              color: Colors.white,
              child: Column(children: [
                Text(
                  'Get Your Finances Under Control',
                  style: AppTypography.headingTwo
                      .copyWith(fontSize: 45.sp, height: 1),
                ),
                SizedBox(
                  height: 30.h,
                ),
                const Text(
                    'Simple finance-personal assistant with an easy to use app to help you maintain your finances'),
                const Spacer(),
                CustomButton(
                  child: Text(
                    'Get Started',
                    style: AppTypography.bodyOne.copyWith(color: Colors.white),
                  ),
                  onTap: () {
                    authViewModel.setLandingPageState();
                  },
                )
              ]),
            ),
          ),
          Positioned(
              top: 120.h,
              right: 0,
              child: RotatedCreditCardContainer(
                cardNumber: StringUtils.getRandomizedCardNumber(),
                amount: StringUtils.generateRandomAmount(),
                index: 0,
              ))
        ],
      ),
    );
  }
}

class RotatedCreditCardContainer extends StatelessWidget {
  const RotatedCreditCardContainer({
    super.key,
    required this.amount,
    required this.cardNumber,
    required this.index,
  });

  final double amount;
  final String cardNumber;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 0.3,
      child: CreditCardContainer(
        amount: amount,
        height: 330.h,
        width: 300.w,
        topFlex: 2,
        bottomFlex: 1,
        amountTextStyle: AppTypography.amountTextLarge,
        constraints: BoxConstraints(maxHeight: 350.h, maxWidth: 250.w),
        cardNumber: cardNumber,
        cardService: CardService.visa,
        expiryDate: '03/25',
        index: index,
      ),
    );
  }
}
