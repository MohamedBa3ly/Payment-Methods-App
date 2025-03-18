
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_app/navigation/screens.dart';
import 'package:payment_app/presentation/ui/myCart/my_cart_screen.dart';
import 'package:payment_app/presentation/ui/paymentDetails/payment_details_screen.dart';
import 'package:payment_app/presentation/ui/thankYou/thank_you_screen.dart';

class NavGraph extends StatelessWidget {
  const NavGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: InitialScreens.myCart,
  routes: [
    GoRoute(
      path: InitialScreens.myCart,
      builder: (context, state) => MyCartScreen(),
    ),
    GoRoute(
      path: InitialScreens.paymentDetails,
      builder: (context, state) => const PaymentDetailsScreen(),
    ),
    GoRoute(
      path: InitialScreens.thankYou,
      builder: (context, state) => const ThankYouScreen(),
    ),
  ],
);




