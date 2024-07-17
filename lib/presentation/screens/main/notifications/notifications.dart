import 'package:flutter/material.dart';
import 'package:template_app/presentation/widgets/custom_appbar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  static const id = '/notifications';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: CustomScrollView(slivers: [CustomAppBar(title: 'Notifications')]),
      ),
    );
  }
}
