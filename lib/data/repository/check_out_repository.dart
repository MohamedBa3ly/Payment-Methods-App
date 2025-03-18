import 'package:dartz/dartz.dart';
import 'package:payment_app/core/errors/failures.dart';
import 'package:payment_app/data/models/paymob_model/details_input_model.dart';
import 'package:payment_app/data/models/stripe_model/payment_intent_input_model.dart';


abstract class CheckOutRepository{
  Future<Either<Failure,void>> makePayment({required PaymentIntentInputModel paymentIntentInputModel});
  Future<Either<Failure,String>> makePayMobPayment({required String apiKey,required DetailsInputModel detailsInputModel,required List<String>ordersList});
}