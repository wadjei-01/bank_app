import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template_app/core/helpers/string_utils.dart';
import 'package:template_app/core/helpers/time_utils.dart';
import 'package:template_app/core/res/typography/app_typography.dart';
import 'package:template_app/presentation/widgets/custom_button.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({
    super.key,
    required this.name,
    required this.transactionType,
    required this.amount,
    required this.dateCreated,
  });

  final String name;
  final String transactionType;
  final double amount;
  final String dateCreated;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      width: double.infinity,
      height: 75.h,
      backgroundColor: Colors.white,
      onTap: () {},
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
      radius: BorderRadius.circular(15.r),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30.r,
            child: Icon(
              Icons.person,
              size: 30.r,
            ),
          ),
          SizedBox(
            width: 5.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: AppTypography.headingSix,
              ),
              Text(
                transactionType,
                style: AppTypography.small,
              ),
            ],
          ).paddingSymmetric(vertical: 7.h),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '-\$${StringUtils.getCurrencyFormat(amount)}',
                style: AppTypography.headingFive,
              ),
              Text(
                TimeUtils.formattedDate(dateCreated),
                style: AppTypography.bodyTwo,
              )
            ],
          )
        ],
      ),
    );
  }
}
