import 'package:template_app/core/res/colors/app_colors.dart';
import 'package:template_app/core/res/typography/app_typography.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        fontFamily: 'SupriaSans',
        colorScheme: ColorScheme.light(primary: AppColors.primaryColor),
        scaffoldBackgroundColor: AppColors.bgColor,
        primarySwatch: AppColors.primaryColor,
        primaryColor: AppColors.primaryColor,
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: AppColors.bgColor,
          foregroundColor: AppColors.darkGrey,
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.secondaryColor,
        ),
        tabBarTheme: TabBarTheme(
          indicatorColor: AppColors.primaryColor,
          labelColor: AppColors.secondaryColor,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.grey,
          contentPadding: const EdgeInsets.fromLTRB(20, 25, 20, 25),
          labelStyle: AppTypography.bodyOne.copyWith(
            color: AppColors.secondaryColor,
          ),
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.secondaryColor, width: 2),
          ),
          disabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
        ),
        cardTheme: CardTheme(color: AppColors.grey, elevation: 0),
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.all(AppColors.secondaryColor),
          trackColor: MaterialStateProperty.all(AppColors.secondaryColor),
        ),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.all(AppColors.secondaryColor),
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.all(AppColors.summaryGrey),
          checkColor: MaterialStateProperty.all(AppColors.secondaryColor),
          side: BorderSide(color: AppColors.summaryGrey),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          showUnselectedLabels: true,
          selectedItemColor: Colors.black,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            height: 1.8,
            fontSize: 10,
          ),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            height: 1.8,
            fontSize: 10,
          ),
          unselectedItemColor: Colors.grey,
        ),
        useMaterial3: true,
      );

  static ThemeData get darkTheme => ThemeData(
        fontFamily: 'Lato',
        colorScheme: ColorScheme.dark(primary: AppColors.primaryColor),
        brightness: Brightness.dark,
        primarySwatch: AppColors.primaryColor,
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: AppColors.secondaryColor,
          foregroundColor: Colors.white,
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.grey,
        ),
        tabBarTheme: TabBarTheme(
          indicatorColor: AppColors.primaryColor,
          labelColor: AppColors.grey,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.secondaryColor,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 25,
            horizontal: 20,
          ),
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.secondaryColor),
          ),
          disabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
        ),
        cardTheme: CardTheme(
          color: AppColors.secondaryColor,
          elevation: 0,
        ),
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.all(Colors.grey),
          trackColor: MaterialStateProperty.all(Colors.grey),
        ),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.all(Colors.grey),
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.all(Colors.grey),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          showUnselectedLabels: true,
          selectedItemColor: Colors.white,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            height: 1.8,
            fontSize: 10,
          ),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            height: 1.8,
            fontSize: 10,
          ),
          unselectedItemColor: Colors.grey,
        ),
        useMaterial3: true,
      );
}
