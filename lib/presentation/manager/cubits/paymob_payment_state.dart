
import 'package:flutter/cupertino.dart';

@immutable
sealed class PaymobState {}

final class PaymobPaymentInitial extends PaymobState {}

class PaymobLoading extends PaymobState {}

class PaymobSuccess extends PaymobState {
  final String paymentKey;
  PaymobSuccess(this.paymentKey);
}
class PaymobFailure extends PaymobState {
  final String error;
  PaymobFailure(this.error);
}


