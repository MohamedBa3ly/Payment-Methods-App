
import 'package:flutter/material.dart';
import 'package:payment_app/core/widgets/custom_app_bar.dart';
import 'package:payment_app/presentation/ui/myCart/widgets/my_cart_view_body.dart';


class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'My Cart'),
      body: const MyCartViewBody(),
    );
  }
}