import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_app/core/widgets/custom_button.dart';
import 'package:payment_app/navigation/screens.dart';
import '../../myCart/widgets/payment_list_view.dart';
import 'custom_credit_card.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: PaymentMethodsListView(activeIndex: activeIndex,onIndexChanged: (index){
            setState(() {
              activeIndex = index;
            });
          },),
        ),
        SliverToBoxAdapter(
          child: CustomCreditCard(
            autoValidateMode: autoValidateMode,
            formKey: formKey,
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
                child: CustomButton(
                  onTap: () {

                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      GoRouter.of(context).push(InitialScreens.thankYou);
                      log('payment');
                    } else {

                      autoValidateMode = AutovalidateMode.always;
                      setState(() {});
                    }

                  },
                  text: 'Payment',
                ),
              )),
        ),
      ],
    );
  }
}