import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class PaymobWebViewScreen extends StatelessWidget {
  final String paymentKey;

  PaymobWebViewScreen({required this.paymentKey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Complete Payment")),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri("https://accept.paymob.com/api/acceptance/iframes/908681?payment_token=$paymentKey"),
        ),
        onLoadStop: (controller, url) {
          if (url != null) {
            if (url.queryParameters.containsKey("success") && url.queryParameters["success"] == 'true') {
              Navigator.pop(context, "Payment Successful");

            } else if (url.queryParameters.containsKey("success") && url.queryParameters["success"] == 'false') {
              Navigator.pop(context, "Payment Failed");

            }
          }
        },
      ),
    );
  }
}
