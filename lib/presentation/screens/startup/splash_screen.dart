import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:template_app/presentation/screens/startup/landing_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const id = '/splash';

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      context.goNamed(LandingScreen.id);
    });

    return const Scaffold(
      body: Text(""),
    );
  }
}
