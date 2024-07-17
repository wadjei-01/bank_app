import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:template_app/core/helpers/extensions/card_info_extension.dart';
import 'package:template_app/core/helpers/string_utils.dart';
import 'package:template_app/core/res/colors/app_colors.dart';
import 'package:template_app/core/res/gen/assets.gen.dart';
import 'package:template_app/core/res/typography/app_typography.dart';
import 'package:models/models.dart';

class CreditCardContainer extends StatelessWidget {
  const CreditCardContainer(
      {super.key,
      this.height,
      this.width,
      this.constraints,
      required this.cardNumber,
      required this.expiryDate,
      required this.amount,
      required this.cardService,
      required this.index,
      this.chipRotation = 1,
      this.topFlex = 2,
      this.bottomFlex = 1,
      this.amountTextStyle,
      this.onTap});

  final double? width;
  final double? height;
  final BoxConstraints? constraints;
  final TextStyle? amountTextStyle;
  final int topFlex;
  final int bottomFlex;
  final String cardNumber;
  final String expiryDate;
  final double amount;
  final CardService cardService;
  final int chipRotation;
  final int index;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final cardColor =
        index % 2 == 0 ? AppColors.primaryColor : AppColors.secondaryColor;

    return Container(
      height: height ?? 250.h,
      width: width ?? 200.w,
      clipBehavior: Clip.antiAlias,
      constraints: constraints,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkGrey.withOpacity(0.2),
            offset: const Offset(
              5.0,
              0,
            ),
            blurRadius: 5,
            spreadRadius: 0.1,
          )
        ],
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  flex: topFlex,
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: RadialGradient(
                      center: Alignment.center,
                      colors: [cardColor.shade400, cardColor.shade800],
                      radius: 1.0,
                    )),
                    child: Stack(children: [
                      SvgPicture.asset(
                        Assets.images.linePattern,
                        fit: BoxFit.fitWidth,
                        color: Colors.white.withOpacity(0.2),
                      ),
                      Positioned(
                          left: 15.r,
                          top: 15.r,
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                Assets.images.logo,
                                width: 17.r,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                'Wank',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.sp),
                              )
                            ],
                          )),
                      Positioned(
                          right: 15.r,
                          top: 15.r,
                          child: RotatedBox(
                            quarterTurns: chipRotation,
                            child: SvgPicture.asset(
                              Assets.images.chipDesign,
                              width: 30.w,
                            ),
                          )),
                      Positioned(
                          bottom: 15.r,
                          left: 15.r,
                          child: Text(
                            'Exp $expiryDate',
                            style: AppTypography.creditCardTextSmall
                                .copyWith(color: Colors.white),
                          ))
                    ]),
                  )),
              Expanded(
                flex: bottomFlex,
                child: Container(
                  padding: EdgeInsets.all(10.r),
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\$${StringUtils.getCurrencyFormat(amount)}',
                          style: amountTextStyle ??
                              AppTypography.amountTextMedium
                                  .copyWith(color: AppColors.primaryColor),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              cardNumber,
                              style: AppTypography.creditCardTextSmall,
                            ),
                            cardService.getLogo(25.w)
                          ],
                        ),
                      ]),
                ),
              ),
            ],
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: cardColor.withOpacity(0.1),
              onTap: onTap,
            ),
          )
        ],
      ),
    );
  }
}
