
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/data/models/stripe_model/payment_intent_input_model.dart';
import 'package:payment_app/data/repository/check_out_repository.dart';

part 'stripe_payment_state.dart';

class StripePaymentCubit extends Cubit<StripePaymentState> {
  StripePaymentCubit(this.checkOutRepository) : super(StripePaymentInitial());
  final CheckOutRepository checkOutRepository;

  Future makePayment({required PaymentIntentInputModel paymentIntentInputModel}) async{
    emit(StripePaymentLoading());

    var data = await checkOutRepository.makePayment(paymentIntentInputModel: paymentIntentInputModel);

    data.fold(
            (l) {
          if (l.errMessage.contains("canceled")) {
            emit(StripePaymentCanceled()); // Emit cancellation state
          } else {
            emit(StripePaymentFailure(l.errMessage)); // Emit error state
          }
        },
        (r)=> emit(StripePaymentSuccess())
    );
  }
}
