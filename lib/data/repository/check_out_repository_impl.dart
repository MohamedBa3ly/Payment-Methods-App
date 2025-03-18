import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:payment_app/core/errors/failures.dart';
import 'package:payment_app/core/utils/paymob_api_service.dart';
import 'package:payment_app/core/utils/stripe_service.dart';
import 'package:payment_app/data/models/paymob_model/details_input_model.dart';
import 'package:payment_app/data/models/stripe_model/payment_intent_input_model.dart';
import 'package:payment_app/data/repository/check_out_repository.dart';

class CheckOutRepositoryImpl extends CheckOutRepository{

  final StripeService stripeService;
  final PaymobService paymobService;
  CheckOutRepositoryImpl({required this.stripeService, required this.paymobService});

  @override
  Future<Either<Failure, void>> makePayment({required PaymentIntentInputModel paymentIntentInputModel}) async {

    try{
      await stripeService.makePayment(paymentIntentInputModel: paymentIntentInputModel);
      return right(null);
    }catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }

  }

  @override
  Future<Either<Failure, String>> makePayMobPayment({required String apiKey,required DetailsInputModel detailsInputModel,required List<String>ordersList}) async {

    try{
      final paymentKey =await paymobService.makePayMobPayment(apiKey: apiKey, detailsInputModel: detailsInputModel, ordersList: ordersList);
      return right(paymentKey);
    }catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }



}