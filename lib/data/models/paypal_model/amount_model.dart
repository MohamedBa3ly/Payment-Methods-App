class AmountModel {
  final int total;
  final String currency;
  final AmountDetailsModel details;

  AmountModel({
    required this.total,
    required this.currency,
    required this.details,
  });

  factory AmountModel.fromJson(Map<String, dynamic> json) {
    return AmountModel(
      total: int.parse(json['total']),
      currency: json['currency'],
      details: AmountDetailsModel.fromJson(json['details']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "total": total.toString(),
      "currency": currency,
      "details": details.toJson(),
    };
  }
}

class AmountDetailsModel {
  final int subtotal;
  final int shipping;
  final int shippingDiscount;

  AmountDetailsModel({
    required this.subtotal,
    required this.shipping,
    required this.shippingDiscount,
  });

  factory AmountDetailsModel.fromJson(Map<String, dynamic> json) {
    return AmountDetailsModel(
      subtotal: int.parse(json['subtotal']),
      shipping: int.parse(json['shipping']),
      shippingDiscount: json['shipping_discount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "subtotal": subtotal.toString(),
      "shipping": shipping.toString(),
      "shipping_discount": shippingDiscount,
    };
  }
}
