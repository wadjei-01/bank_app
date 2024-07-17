import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:template_app/core/app_router.dart';
import 'package:template_app/core/core_provider.dart';
import 'package:template_app/core/helpers/image_utils.dart';
import 'package:template_app/core/res/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPrefs = await SharedPreferences.getInstance();
  ImageUtils.svgPrecacheImage();
  runApp(ProviderScope(
      overrides: [sharedPreferencesProvider.overrideWithValue(sharedPrefs)],
      child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return ScreenUtilInit(
      designSize: const Size(393, 852),
      fontSizeResolver: (fontSize, instance) {
        return FontSizeResolvers.diameter(fontSize, instance);
      },
      ensureScreenSize: true,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          theme: AppTheme.lightTheme,
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        );
      },
    );
  }
}
