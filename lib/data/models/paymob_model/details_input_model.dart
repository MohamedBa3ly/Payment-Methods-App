class DetailsInputModel {
  final int finalAmount;
  final int expiration;
  final String currency;
  final String integrationId;
  final BillingData billingData;

  DetailsInputModel({
    required int amount,
    required this.expiration,
    required this.currency,
    required this.integrationId,
    required this.billingData,
  }) : finalAmount = amount * 100;

  Map<String, dynamic> toJson() {
    return {
      'amount_cents': finalAmount,
      'expiration': expiration,
      'currency': currency,
      'integration_id': integrationId,
      'billing_data': billingData.toJson(),
    };
  }
}

class BillingData {
  final String apartment;
  final String email;
  final String floor;
  final String firstName;
  final String street;
  final String building;
  final String phoneNumber;
  final String shippingMethod;
  final String postalCode;
  final String city;
  final String country;
  final String lastName;
  final String state;

  BillingData({
    required this.apartment,
    required this.email,
    required this.floor,
    required this.firstName,
    required this.street,
    required this.building,
    required this.phoneNumber,
    required this.shippingMethod,
    required this.postalCode,
    required this.city,
    required this.country,
    required this.lastName,
    required this.state,
  });

  Map<String, dynamic> toJson() {
    return {
      'apartment': apartment,
      'email': email,
      'floor': floor,
      'first_name': firstName,
      'street': street,
      'building': building,
      'phone_number': phoneNumber,
      'shipping_method': shippingMethod,
      'postal_code': postalCode,
      'city': city,
      'country': country,
      'last_name': lastName,
      'state': state,
    };
  }
}
