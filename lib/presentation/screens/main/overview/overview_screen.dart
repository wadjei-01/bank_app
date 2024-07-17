import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:models/models.dart';
import 'package:template_app/core/res/colors/app_colors.dart';
import 'package:template_app/core/res/typography/app_typography.dart';
import 'package:template_app/presentation/viewmodel/overview/overview_viewmodel.dart';
import 'package:template_app/presentation/widgets/custom_appbar.dart';
import 'package:template_app/presentation/widgets/transaction_tile.dart';

class OverViewScreen extends ConsumerWidget {
  const OverViewScreen({super.key});
  static const id = '/overview';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final transactionList = Transaction.list;

    final overViewViewModel = ref.watch(OverviewViewModel.provider);

    final AsyncValue<List<Transaction>> transactionList =
        ref.watch(transactionListProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CustomAppBar(
            title: 'Overview',
            subtitle: 'Transaction and bank details',
          ),
          const ChartSection(),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MonthlyTransactionInfo(
                  icon: EvaIcons.arrow_downward,
                  color: AppColors.tertiaryColor,
                  amount: '200.00',
                  text: 'Monthly Income',
                ),
                SizedBox(
                  width: 20.w,
                ),
                MonthlyTransactionInfo(
                  icon: EvaIcons.arrow_upward,
                  color: AppColors.secondaryColor,
                  amount: '200.00',
                  text: 'Monthly Spending',
                ),
              ],
            ).paddingSymmetric(horizontal: 15.w, vertical: 30.h),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Details',
                  style: AppTypography.headingFour,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: overViewViewModel.timeFilter.map((e) {
                    final isSelectedTime = overViewViewModel.selectedTime == e;
                    return InkWell(
                      onTap: () {
                        overViewViewModel.setSelectedTime(e);
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: isSelectedTime
                                ? AppColors.tertiaryColor
                                : AppColors.tertiaryColor.withOpacity(0)),
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 5.h),
                        child: Text(
                          e,
                          style: AppTypography.caption.copyWith(
                              color: isSelectedTime
                                  ? Colors.white
                                  : AppColors.grey),
                        ),
                      ),
                    );
                  }).toList(),
                ).marginSymmetric(horizontal: 10.w),
                SizedBox(
                  height: 20.h,
                ),
                transactionList.when(
                    data: (data) {
                      return AnimationLimiter(
                          child: Column(
                        children: AnimationConfiguration.toStaggeredList(
                            childAnimationBuilder: (child) => SlideAnimation(
                                verticalOffset: 50.h,
                                child: FadeInAnimation(
                                  child: child,
                                )),
                            children: data
                                .map((transaction) => TransactionTile(
                                        name: transaction.name,
                                        transactionType:
                                            transaction.transactionType.text,
                                        amount: transaction.amount,
                                        dateCreated: transaction.dateCreated)
                                    .marginSymmetric(vertical: 5.h))
                                .toList()),
                      ));
                    },
                    error: (w, e) {
                      return Text('There was an error!');
                    },
                    loading: () =>
                        const Center(child: CircularProgressIndicator())),
                SizedBox(
                  height: 170.h,
                )
              ],
            ).marginSymmetric(horizontal: 15.w),
          )
        ],
      ),
    );
  }
}

class MonthlyTransactionInfo extends StatelessWidget {
  const MonthlyTransactionInfo({
    super.key,
    required this.icon,
    required this.amount,
    required this.text,
    required this.color,
  });
  final IconData icon;
  final String amount;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25.r,
          backgroundColor: color.withOpacity(0.3),
          child: Icon(
            icon,
            color: color,
            size: 30.r,
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '\$ $amount',
              style: AppTypography.amountTextMedium
                  .copyWith(color: AppColors.primaryColor),
            ),
            Text(
              text,
              style: AppTypography.caption,
            ),
          ],
        )
      ],
    );
  }
}

class ChartSection extends StatelessWidget {
  const ChartSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AspectRatio(
        aspectRatio: 1,
        child: Stack(
          children: [
            PieChart(PieChartData(
                pieTouchData: PieTouchData(),
                startDegreeOffset: -20,
                sections: List.generate(
                    3,
                    (i) => switch (i) {
                          0 => PieChartSectionData(
                              value: 40,
                              radius: 60.r,
                              showTitle: false,
                              color: AppColors.secondaryColor,
                            ),
                          2 => PieChartSectionData(
                              value: 20,
                              radius: 50.r,
                              color: AppColors.primaryColor,
                              showTitle: false,
                            ),
                          1 => PieChartSectionData(
                              value: 40,
                              showTitle: false,
                              radius: 20.r,
                              color: AppColors.bgColor.shade600),
                          _ => throw Error()
                        }))),
            Center(
              child: Container(
                height: 180.r,
                width: 180.r,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100.r)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Total Expense'),
                    Text(
                      '\$ 82.98',
                      style: AppTypography.amountTextLarge,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ).marginSymmetric(horizontal: 30.w),
    );
  }
}
