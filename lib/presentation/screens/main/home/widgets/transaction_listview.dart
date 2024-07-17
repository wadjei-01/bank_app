import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:template_app/core/helpers/extensions/transaction_extensions.dart';
import 'package:template_app/presentation/widgets/transaction_tile.dart';

class HomeTransactionListView extends StatelessWidget {
  const HomeTransactionListView({
    super.key,
    required this.groupedTransactions,
  });

  final OrderedTransactions groupedTransactions;

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
            childCount: groupedTransactions.keys.length, (context, index) {
      final key = groupedTransactions.keys.elementAt(index);
      final children = groupedTransactions[key];
      return AnimationLimiter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 350),
              childAnimationBuilder: (widget) => SlideAnimation(
                  verticalOffset: 30.h, child: FadeInAnimation(child: widget)),
              children: [
                Text(key ?? 'N/A'),
                SizedBox(
                  height: 10.h,
                ),
                if (children != null)
                  ...children
                      .map((transaction) => TransactionTile(
                            name: transaction.name,
                            transactionType: transaction.transactionType.text,
                            amount: transaction.amount,
                            dateCreated: transaction.dateCreated,
                          ).paddingOnly(bottom: 10.h))
                      .toList(),
              ]),
        ).marginSymmetric(horizontal: 15.w, vertical: 5.h),
      );
    }));
  }
}
