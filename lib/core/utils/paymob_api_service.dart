import 'package:dio/dio.dart';
import 'package:payment_app/data/models/paymob_model/details_input_model.dart';

class PaymobService {

  final Dio dio;
  PaymobService({required this.dio});

  // 1. Get Authentication Token
  Future<String?> getAuthToken(String apiKey) async {
    try {
      final response = await dio.post(
        "https://accept.paymob.com/api/auth/tokens",
        data: {"api_key": apiKey},
        options: Options(
          headers: {"Content-Type": "application/json"},
        ),
      );
      return response.data["token"];
    } catch (e) {
      print("Auth Token Error: $e");
      return null;
    }
  }

  // 2. Register an Order
  Future<int?> registerOrder(String authToken, DetailsInputModel detailsInputModel, List<String>orderList) async {
    try {
      final response = await dio.post(
        "https://accept.paymob.com/api/ecommerce/orders",
        data: {
          "auth_token": authToken,
          "delivery_needed": "false",
          "amount_cents": detailsInputModel.finalAmount,
          "currency": "EGP",
          "items": orderList
        },
      );
      return response.data["id"];
    } catch (e) {
      print("Order Registration Error: $e");
      return null;
    }
  }


  // 3. Get Payment Key
  Future<String?> getPaymentKey(String authToken, int orderId,DetailsInputModel detailsInputModel) async {
    try {
      final response = await dio.post(
        "https://accept.paymob.com/api/acceptance/payment_keys",
        data: {
          "auth_token": authToken,
          "amount_cents": detailsInputModel.finalAmount,
          "expiration": detailsInputModel.expiration,
          "order_id": orderId,
          "currency": detailsInputModel.currency,
          "integration_id": detailsInputModel.integrationId, // Replace with your integration ID
          "billing_data": {
            "apartment": detailsInputModel.billingData.apartment,
            "email": detailsInputModel.billingData.email,
            "floor": detailsInputModel.billingData.floor,
            "first_name": detailsInputModel.billingData.firstName,
            "street": detailsInputModel.billingData.street,
            "building": detailsInputModel.billingData.building,
            "phone_number": detailsInputModel.billingData.phoneNumber,
            "shipping_method": detailsInputModel.billingData.shippingMethod,
            "postal_code": detailsInputModel.billingData.postalCode,
            "city": detailsInputModel.billingData.city,
            "country": detailsInputModel.billingData.country,
            "last_name": detailsInputModel.billingData.lastName,
            "state": detailsInputModel.billingData.state
          }

        },
      );
      return response.data["token"];
    } catch (e) {
      print("Payment Key Error: $e");
      return null;
    }
  }

  Future <String> makePayMobPayment({required String apiKey,required DetailsInputModel detailsInputModel,required List<String>ordersList}) async{
    final authToken = await getAuthToken(apiKey);
    if (authToken == null) throw Exception("Auth token retrieval failed");

    final orderId = await registerOrder(authToken, detailsInputModel, ordersList);
    if (orderId == null) throw Exception("Order registration failed");

    final paymentKey = await getPaymentKey(authToken, orderId, detailsInputModel);
    if (paymentKey == null) throw Exception("Payment key retrieval failed");

    return paymentKey;
  }
}

