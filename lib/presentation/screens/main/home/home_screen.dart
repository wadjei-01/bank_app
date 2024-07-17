import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:models/models.dart';
import 'package:template_app/core/helpers/extensions/transaction_extensions.dart';
import 'package:template_app/core/helpers/time_utils.dart';
import 'package:template_app/core/res/colors/app_colors.dart';
import 'package:template_app/core/res/typography/app_typography.dart';
import 'package:template_app/presentation/screens/main/home/widgets/transaction_listview.dart';
import 'package:template_app/presentation/screens/main/notifications/notifications.dart';
import 'package:template_app/presentation/viewmodel/auth/auth_viewmodel.dart';
import 'package:template_app/presentation/viewmodel/overview/overview_viewmodel.dart';
import 'package:template_app/presentation/widgets/credit_card_container.dart';
import 'package:get/get.dart';
import 'package:template_app/presentation/widgets/labelled_button.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  static const id = '/home';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardList = CardInfo.list;

    final transactionList = ref.watch(transactionListProvider);

    final authViewModel = ref.watch(AuthViewModel.provider);

    final username =
        '${authViewModel.authUser?.firstName} ${authViewModel.authUser?.lastName}';

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: kToolbarHeight + 20.h,
            pinned: true,
            title: Row(
              children: [
                CircleAvatar(
                  radius: 27.r,
                  child: CircleAvatar(
                    radius: 25.r,
                    backgroundColor: AppColors.bgColor,
                    child: Icon(
                      Icons.person,
                      color: AppColors.darkGrey,
                      size: 40.r,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      TimeUtils.getTimeOfDay(),
                      style: AppTypography.small,
                    ),
                    Text(
                      username,
                      style: AppTypography.headingSix,
                    ),
                  ],
                )
              ],
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    context.pushNamed(NotificationScreen.id);
                  },
                  icon: Icon(
                    EvaIcons.bell_outline,
                    color: AppColors.primaryColor,
                  ))
            ],
          ),
          SliverToBoxAdapter(
              child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: AnimationLimiter(
              child: Row(
                  children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 350),
                childAnimationBuilder: (widget) => SlideAnimation(
                    horizontalOffset: 50.w,
                    child: FadeInAnimation(
                      child: widget,
                    )),
                children: cardList.asMap().entries.map((cardMap) {
                  final index = cardMap.key;
                  final cardItem = cardMap.value;
                  return CreditCardContainer(
                          cardNumber: cardItem.cardNumber,
                          expiryDate: cardItem.expiryDate,
                          amount: cardItem.amount,
                          index: index,
                          onTap: () {},
                          cardService: cardItem.cardService)
                      .paddingOnly(
                          left: index == 0 ? 15.w : 5.w,
                          right: index == 0 ? 5.w : 10.w,
                          top: 10.h,
                          bottom: 10.h);
                }).toList(),
              )),
            ),
          )),
          SliverToBoxAdapter(
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LabelledButton(title: 'Send', icon: EvaIcons.corner_right_up),
                LabelledButton(
                    title: 'Request', icon: EvaIcons.corner_right_down),
                LabelledButton(title: 'Top Up', icon: EvaIcons.arrowhead_up),
                LabelledButton(title: 'More', icon: EvaIcons.grid_outline),
              ],
            ).marginOnly(
              left: 35.w,
              right: 35.w,
              top: 10.h,
              bottom: 40.h,
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Last Transaction',
                      style: AppTypography.headingFive,
                    ),
                    Text(
                      'See More',
                      style:
                          AppTypography.bodyTwo.copyWith(color: AppColors.grey),
                    )
                  ],
                ),
              ],
            ).marginSymmetric(horizontal: 15.w, vertical: 5.h),
          ),
          transactionList.when(
              data: (data) => HomeTransactionListView(
                  groupedTransactions: data.orderedTransactions),
              error: (e, s) => const SliverFillRemaining(
                    child: Center(
                        child:
                            Text('You may not be connected to the internet')),
                  ),
              loading: () => const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  )),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 170.h,
            ),
          )
        ],
      ),
    );
  }
}
