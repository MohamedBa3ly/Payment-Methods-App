
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_app/core/widgets/custom_app_bar.dart';
import 'package:payment_app/presentation/ui/thankYou/widgets/thank_you_view_body.dart';

class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(onTap: () {GoRouter.of(context).pop();}),
      body: Transform.translate(
          offset: const Offset(0, -16), child: const ThankYouViewBody()),
    );
  }
}