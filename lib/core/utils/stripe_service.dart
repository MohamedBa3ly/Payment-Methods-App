import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_app/core/utils/api_keys.dart';
import 'package:payment_app/core/utils/api_service.dart';
import 'package:payment_app/data/models/stripe_model/customer_id_model.dart';
import 'package:payment_app/data/models/stripe_model/ephemeral_key_model.dart';
import 'package:payment_app/data/models/stripe_model/init_payment_sheet_input_model.dart';
import 'package:payment_app/data/models/stripe_model/payment_intent_input_model.dart';
import 'package:payment_app/data/models/stripe_model/payment_intent_model.dart';


class StripeService{
  final ApiService apiService;
  StripeService({required this.apiService});

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel
      ) async {
    
    var response = await apiService.post(
        body: paymentIntentInputModel.toJson(),
        contentType: Headers.formUrlEncodedContentType,
        url: 'https://api.stripe.com/v1/payment_intents',
        token: ApiKeys.secretKey
    );

    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future initPaymentSheet({required InitPaymentSheetInputModel initPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,
        customerEphemeralKeySecret: initPaymentSheetInputModel.ephemeralKeySecret,
        customerId: initPaymentSheetInputModel.customerId,
        merchantDisplayName: "Mohamed El-Baaly"
    )
    );
  }

  Future displayPaymentSheet() async{
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment({required PaymentIntentInputModel paymentIntentInputModel}) async{
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralKey = await createEphemeralKey(customerId: paymentIntentInputModel.customerId);

    await initPaymentSheet(initPaymentSheetInputModel:InitPaymentSheetInputModel(
        clientSecret: paymentIntentModel.clientSecret,
        customerId: paymentIntentInputModel.customerId,
        ephemeralKeySecret: ephemeralKey.secret
    )
    );
    await displayPaymentSheet();
  }

  //Create Customer:
  Future<CustomerModel> createCustomer() async {

    var response = await apiService.post(
        body: '',
        contentType: Headers.formUrlEncodedContentType,
        url: 'https://api.stripe.com/v1/customers',
        token: ApiKeys.secretKey
    );

    var customerId = CustomerModel.fromJson(response.data);
    return customerId;
  }

  //Create ephemeral key:
  Future<EphemeralKeyModel> createEphemeralKey(
  {required String customerId}
      ) async {

    var response = await apiService.post(
        body: {'customer': customerId},
        contentType: Headers.formUrlEncodedContentType,
        url: 'https://api.stripe.com/v1/ephemeral_keys',
        token: ApiKeys.secretKey,
        headers: {
          'Authorization': "Bearer ${ApiKeys.secretKey}",
          'Stripe-Version' : '2025-02-24.acacia'
        }
    );

    var ephemeralKey = EphemeralKeyModel.fromJson(response.data);
    return ephemeralKey;
  }


}