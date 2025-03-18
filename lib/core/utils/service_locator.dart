import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:payment_app/core/utils/api_service.dart';
import 'package:payment_app/core/utils/paymob_api_service.dart';
import 'package:payment_app/core/utils/stripe_service.dart';
import 'package:payment_app/data/repository/check_out_repository_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator(){
  getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));
  getIt.registerSingleton<PaymobService>(PaymobService(dio: Dio()));
  getIt.registerSingleton<StripeService>(StripeService(apiService: getIt.get<ApiService>()));
  getIt.registerSingleton<CheckOutRepositoryImpl>(CheckOutRepositoryImpl(stripeService: getIt.get<StripeService>(), paymobService: getIt.get<PaymobService>()));
}