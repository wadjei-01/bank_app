import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:models/models.dart';
import 'package:template_app/core/res/colors/app_colors.dart';
import 'package:template_app/core/res/typography/app_typography.dart';
import 'package:template_app/presentation/viewmodel/wallet/wallet_viewmodel.dart';
import 'package:template_app/presentation/widgets/credit_card_container.dart';
import 'package:template_app/presentation/widgets/custom_appbar.dart';
import 'package:template_app/presentation/widgets/custom_button.dart';

enum WalletTabsEnum {
  cards('Cards'),
  account('Account');

  final String title;
  const WalletTabsEnum(this.title);
}

class WalletScreen extends HookConsumerWidget {
  const WalletScreen({super.key});
  static const id = '/wallet';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final pageViewController = usePageController();

    final walletViewModel = ref.watch(WalletViewModel.provider);
    final cardList = CardInfo.list;

    return Scaffold(
      body: NestedScrollView(
        controller: scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const CustomAppBar(
            title: 'My Wallet',
            subtitle: 'Select a card for more detailed information',
          ),
        ],
        body: Column(
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                height: 65.h,
                child: Container(
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Row(
                        children:
                            WalletTabsEnum.values.asMap().entries.map((tab) {
                      final index = tab.key;
                      final isSelected = index == walletViewModel.tabsIndex;
                      return Expanded(
                          child: CustomButton(
                        onTap: () {
                          pageViewController.jumpToPage(index);
                        },
                        margin: EdgeInsets.symmetric(
                            vertical: 10.r, horizontal: 10.r),
                        padding: EdgeInsets.all(10.r),
                        backgroundColor: isSelected
                            ? AppColors.secondaryColor
                            : AppColors.secondaryColor.withOpacity(0),
                        radius: BorderRadius.circular(7.r),
                        child: Text(
                          tab.value.title,
                          style: AppTypography.bodyOne.copyWith(
                              color:
                                  isSelected ? Colors.white : AppColors.grey),
                        ),
                      ));
                    }).toList()),
                  ),
                )),
            Expanded(
              child: PageView(
                controller: pageViewController,
                onPageChanged: (value) {
                  walletViewModel.setTabsIndex(value);
                },
                children: [
                  CustomScrollView(
                    shrinkWrap: true,
                    slivers: [
                      AnimationLimiter(
                        child: SliverList(
                            delegate: SliverChildListDelegate(
                                AnimationConfiguration.toStaggeredList(
                                    duration: const Duration(milliseconds: 300),
                                    childAnimationBuilder: (widget) =>
                                        SlideAnimation(
                                            verticalOffset: 50.h,
                                            child:
                                                FadeInAnimation(child: widget)),
                                    children: cardList
                                        .asMap()
                                        .entries
                                        .map((cardEntry) {
                                      final card = cardEntry.value;
                                      final index = cardEntry.key;

                                      return CreditCardContainer(
                                              onTap: () {},
                                              cardNumber: card.cardNumber,
                                              expiryDate: card.expiryDate,
                                              amountTextStyle: AppTypography
                                                  .amountTextMedium
                                                  .copyWith(
                                                      fontSize: 20.sp,
                                                      color: AppColors
                                                          .primaryColor),
                                              topFlex: 2,
                                              amount: card.amount,
                                              height: 205.h,
                                              cardService: card.cardService,
                                              chipRotation: 0,
                                              index: index)
                                          .paddingSymmetric(
                                              horizontal: 15.w, vertical: 10.h);
                                    }).toList()))),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 30.h),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10.r),
                            onTap: () {},
                            child: Container(
                              alignment: Alignment.center,
                              height: 50.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(
                                      color: AppColors.primaryColor)),
                              child: Text(
                                'Add New Card',
                                style: AppTypography.headingFive,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    color: Colors.yellow,
                    child: const Center(
                      child: Text(
                        'Yellow Page',
                        style: TextStyle(
                          fontSize: 45,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
