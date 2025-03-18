class PaymentIntentInputModel {
  final int amount;
  final String currency;
  final String customerId;

  PaymentIntentInputModel({required int amount, required this.currency,required this.customerId,})
      : amount = amount * 100;

  toJson() {
    return {
      'amount': amount,
      'currency': currency,
      'customer': customerId

    };
  }
}
