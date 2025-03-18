
import 'package:flutter/material.dart';
import 'package:payment_app/presentation/ui/myCart/widgets/payment_method_item.dart';

class PaymentMethodsListView extends StatefulWidget {
  const PaymentMethodsListView({super.key, required this.activeIndex, required this.onIndexChanged});
  final int activeIndex;
  final Function(int) onIndexChanged; // Callback for index change

  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
  final List<String> paymentMethodsItems = const [
    'assets/images/card.svg',
    'assets/images/paypal.svg',
    'assets/images/paymob.svg'
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
          itemCount: paymentMethodsItems.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GestureDetector(
                onTap: () {
                  widget.onIndexChanged(index);
                },
                child: PaymentMethodItem(
                  isActive: widget.activeIndex == index,
                  image: paymentMethodsItems[index],
                ),
              ),
            );
          }),
    );
  }
}