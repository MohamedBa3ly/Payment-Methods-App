
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/data/models/paymob_model/details_input_model.dart';
import 'package:payment_app/data/repository/check_out_repository.dart';
import 'package:payment_app/presentation/manager/cubits/paymob_payment_state.dart';

class PaymobCubit extends Cubit<PaymobState> {
  final CheckOutRepository checkOutRepository;

  PaymobCubit(this.checkOutRepository) : super(PaymobPaymentInitial());

  Future<void> makePayMobPayment({required String apiKey,required DetailsInputModel detailsInputModel,required List<String>ordersList}) async {
    emit(PaymobLoading());

    var data = await checkOutRepository.makePayMobPayment(apiKey:apiKey, detailsInputModel: detailsInputModel,ordersList: ordersList);

    data.fold(
            (l) {
          emit(PaymobFailure(l.errMessage));
        },
          (paymentKey) => emit(PaymobSuccess(paymentKey)),
    );
  }
}


