import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:template_app/presentation/screens/main/home/home_screen.dart';
import 'package:template_app/presentation/screens/main/notifications/notifications.dart';
import 'package:template_app/presentation/screens/main/overview/overview_screen.dart';
import 'package:template_app/presentation/screens/main/settings/settings_screen.dart';
import 'package:template_app/presentation/screens/main/wallet/wallet_screen.dart';

class NavBarModel {
  NavBarModel(
      {required this.path,
      required this.iconSelected,
      required this.iconUnselected,
      this.margin});
  String path;
  IconData iconUnselected;
  IconData iconSelected;
  EdgeInsets? margin = EdgeInsets.only(bottom: 2.h);

  static final List<NavBarModel> navList = [
    NavBarModel(
      path: HomeScreen.id,
      iconSelected: EvaIcons.home,
      iconUnselected: EvaIcons.home_outline,
    ),
    NavBarModel(
        path: OverViewScreen.id,
        iconSelected: EvaIcons.bar_chart,
        iconUnselected: EvaIcons.bar_chart_outline,
        margin: EdgeInsets.only(right: 30.w, bottom: 2.h)),
    NavBarModel(
        path: WalletScreen.id,
        iconSelected: EvaIcons.credit_card,
        iconUnselected: EvaIcons.credit_card_outline,
        margin: EdgeInsets.only(left: 30.w, bottom: 2.h)),
    NavBarModel(
        path: SettingsScreen.id,
        iconSelected: EvaIcons.person,
        iconUnselected: EvaIcons.person_outline),
  ];
}
