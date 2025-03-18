
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_app/core/utils/api_keys.dart';
import 'package:payment_app/core/utils/paymob_web_view_screen.dart';
import 'package:payment_app/core/widgets/custom_button.dart';
import 'package:payment_app/data/models/paymob_model/details_input_model.dart';
import 'package:payment_app/data/models/paypal_model/amount_model.dart';
import 'package:payment_app/data/models/paypal_model/item_list_model.dart';
import 'package:payment_app/data/models/stripe_model/payment_intent_input_model.dart';
import 'package:payment_app/navigation/screens.dart';
import 'package:payment_app/presentation/manager/cubits/paymob_payment_cubit.dart';
import 'package:payment_app/presentation/manager/cubits/paymob_payment_state.dart';
import 'package:payment_app/presentation/manager/cubits/stripe_payment_cubit.dart';
import 'package:payment_app/presentation/ui/myCart/widgets/payment_list_view.dart';

class PaymentMethodsBottomSheet extends StatefulWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  State<PaymentMethodsBottomSheet> createState() => _PaymentMethodsBottomSheetState();
}

class _PaymentMethodsBottomSheetState extends State<PaymentMethodsBottomSheet> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 16,
          ),
          PaymentMethodsListView(
            activeIndex: activeIndex,
            onIndexChanged: (index){
              setState(() {
                activeIndex = index;
              });
          },),
          const SizedBox(
            height: 32,
          ),
          BlocConsumer<StripePaymentCubit, StripePaymentState>(
            listener: (context, state) {
              if (state is StripePaymentSuccess) {
                GoRouter.of(context).push(InitialScreens.thankYou);
              } else if (state is StripePaymentCanceled) {
                GoRouter.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Stripe Payment was canceled.")),
                );
              } else if (state is StripePaymentFailure) {
                GoRouter.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.errorMessage)),
                );
              }
            },
            builder: (context, stripeState) {
              return BlocConsumer<PaymobCubit, PaymobState>(
                listener: (context, paymobState) async{
                  if (paymobState is PaymobSuccess) {
                    final result = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PaymobWebViewScreen(paymentKey: paymobState.paymentKey),
                      ),
                    );

                    if (result.toLowerCase().contains("success")) {
                      if(context.mounted){
                        GoRouter.of(context).push(InitialScreens.thankYou);
                      }

                    } else {
                      if(context.mounted){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Payment Failed")),
                        );
                      }

                    }
                  } else if (paymobState is PaymobFailure) {
                    GoRouter.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(paymobState.error)),
                    );
                  }
                },
                builder: (context, paymobState) {
                  return CustomButton(
                    onTap: () {
                      switch (activeIndex) {
                        case 0: // Stripe Payment
                          final paymentIntentInputModel = PaymentIntentInputModel(
                            amount: 100,
                            currency: "USD",
                            customerId: ApiKeys.customerId,
                          );
                          BlocProvider.of<StripePaymentCubit>(context)
                              .makePayment(paymentIntentInputModel: paymentIntentInputModel);
                          break;

                        case 1: // PayPal Payment
                          var amountModel = AmountModel(
                            total: 100,
                            currency: "USD",
                            details: AmountDetailsModel(
                                subtotal: 100, shipping: 0, shippingDiscount: 0),
                          );

                          List<ItemModel> items = [
                            ItemModel(name: "Apple", quantity: 4, price: 10, currency: "USD"),
                            ItemModel(name: "Orange", quantity: 12, price: 5, currency: "USD"),
                          ];
                          var itemListModel = ItemListModel(items: items);

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PaypalCheckoutView(
                                sandboxMode: true,
                                clientId: ApiKeys.clientIdPayPal,
                                secretKey: ApiKeys.secretPayPal,
                                transactions: [
                                  {
                                    "amount": amountModel.toJson(),
                                    "description": "The payment transaction description.",
                                    "item_list": itemListModel.toJson()
                                  }
                                ],
                                note: "Contact us for any questions on your order.",
                                onSuccess: (params) async {
                                  log("PayPal Success: $params");
                                  GoRouter.of(context).push(InitialScreens.thankYou);
                                },
                                onError: (error) {
                                  log("PayPal Error: $error");
                                  Navigator.pop(context);
                                },
                                onCancel: () {
                                  log("PayPal Cancelled");
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          );
                          break;

                        case 2: // PayMob Payment

                          BlocProvider.of<PaymobCubit>(context)
                              .makePayMobPayment(
                              apiKey: ApiKeys.payMobApiKey,
                              detailsInputModel: DetailsInputModel(
                                  amount: 100,
                                  expiration: 3600,
                                  currency: "EGP",
                                  integrationId: ApiKeys.integrationId,
                                  billingData: BillingData(
                                      apartment: "NA",
                                      email: "test@example.com",
                                      floor: "NA",
                                      firstName: "John",
                                      street: "Test Street",
                                      building: "NA",
                                      phoneNumber: "+201234567890",
                                      shippingMethod: "NA",
                                      postalCode: "12345",
                                      city: "Cairo",
                                      country: "EG",
                                      lastName: "Doe",
                                      state: "Cairo"
                                  )
                              ),
                              ordersList: []
                          );
                          break;
                      }
                    },
                    text: 'Continue',
                    isLoading: stripeState is StripePaymentLoading || paymobState is PaymobLoading,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}