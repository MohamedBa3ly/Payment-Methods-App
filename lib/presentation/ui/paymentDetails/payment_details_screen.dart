
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_app/core/widgets/custom_app_bar.dart';
import 'package:payment_app/presentation/ui/paymentDetails/widgets/payment_details_view_body.dart';

class PaymentDetailsScreen extends StatelessWidget {
  const PaymentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Payment Details', onTap: () {GoRouter.of(context).pop();
      }),
      body: const PaymentDetailsViewBody(),
    );
  }
}