import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_app/core/utils/api_keys.dart';
import 'package:payment_app/core/utils/service_locator.dart';
import 'package:payment_app/navigation/navGraph.dart';

void main() {
  Stripe.publishableKey = ApiKeys.publishablekey;
  setupServiceLocator();
  runApp(const NavGraph());
}




