
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/core/utils/paymob_api_service.dart';
import 'package:payment_app/core/utils/service_locator.dart';
import 'package:payment_app/core/widgets/custom_button.dart';
import 'package:payment_app/data/repository/check_out_repository_impl.dart';
import 'package:payment_app/presentation/manager/cubits/paymob_payment_cubit.dart';
import 'package:payment_app/presentation/manager/cubits/stripe_payment_cubit.dart';
import 'package:payment_app/presentation/ui/myCart/widgets/payment_bottom_sheet.dart';
import 'package:payment_app/presentation/ui/myCart/widgets/total_price.dart';
import 'order_info_item.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          Expanded(child: Image.asset('assets/images/basket_image.png')),
          const SizedBox(
            height: 25,
          ),
          const OrderInfoItem(
            title: 'Order Subtotal',
            value: r'42.97$',
          ),
          const SizedBox(
            height: 3,
          ),
          const OrderInfoItem(
            title: 'Discount',
            value: r'0$',
          ),
          const SizedBox(
            height: 3,
          ),
          const OrderInfoItem(
            title: 'Shipping',
            value: r'8$',
          ),
          const Divider(
            thickness: 2,
            height: 34,
            color: Color(0xffC7C7C7),
          ),
          const TotalPrice(title: 'Total', value: r'$50.97'),
          const SizedBox(
            height: 16,
          ),
          CustomButton(
            text: 'Complete Payment',
            onTap: () {

              // GoRouter.of(context).push(InitialScreens.paymentDetails);

              showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                builder: (context) {
                  return MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) => StripePaymentCubit(getIt.get<CheckOutRepositoryImpl>()),
                      ),
                      BlocProvider(
                        create: (context) => PaymobCubit(getIt.get<CheckOutRepositoryImpl>()), // Add PayMobCubit
                      ),
                    ],
                    child: const PaymentMethodsBottomSheet(),
                  );
                },
              );

            },
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}

