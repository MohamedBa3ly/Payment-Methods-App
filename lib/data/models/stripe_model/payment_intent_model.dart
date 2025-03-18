class PaymentIntentModel {
  final String id;
  final String object;
  final int amount;
  final int amountCapturable;
  final AmountDetailsModel amountDetails;
  final int amountReceived;
  final String? application;
  final int? applicationFeeAmount;
  final AutomaticPaymentMethodsModel automaticPaymentMethods;
  final int? canceledAt;
  final String? cancellationReason;
  final String captureMethod;
  final String clientSecret;
  final String confirmationMethod;
  final int created;
  final String currency;
  final String? customer;
  final String? description;
  final String? invoice;
  final String? lastPaymentError;
  final String? latestCharge;
  final bool livemode;
  final Map<String, dynamic> metadata;
  final String? nextAction;
  final String? onBehalfOf;
  final String? paymentMethod;
  final PaymentMethodOptionsModel paymentMethodOptions;
  final List<String> paymentMethodTypes;
  final String? processing;
  final String? receiptEmail;
  final String? review;
  final String? setupFutureUsage;
  final String? shipping;
  final String? source;
  final String? statementDescriptor;
  final String? statementDescriptorSuffix;
  final String status;
  final String? transferData;
  final String? transferGroup;

  PaymentIntentModel({
    required this.id,
    required this.object,
    required this.amount,
    required this.amountCapturable,
    required this.amountDetails,
    required this.amountReceived,
    required this.application,
    required this.applicationFeeAmount,
    required this.automaticPaymentMethods,
    required this.canceledAt,
    required this.cancellationReason,
    required this.captureMethod,
    required this.clientSecret,
    required this.confirmationMethod,
    required this.created,
    required this.currency,
    required this.customer,
    required this.description,
    required this.invoice,
    required this.lastPaymentError,
    required this.latestCharge,
    required this.livemode,
    required this.metadata,
    required this.nextAction,
    required this.onBehalfOf,
    required this.paymentMethod,
    required this.paymentMethodOptions,
    required this.paymentMethodTypes,
    required this.processing,
    required this.receiptEmail,
    required this.review,
    required this.setupFutureUsage,
    required this.shipping,
    required this.source,
    required this.statementDescriptor,
    required this.statementDescriptorSuffix,
    required this.status,
    required this.transferData,
    required this.transferGroup,
  });

  factory PaymentIntentModel.fromJson(Map<String, dynamic> json) {
    return PaymentIntentModel(
      id: json['id'],
      object: json['object'],
      amount: json['amount'],
      amountCapturable: json['amount_capturable'],
      amountDetails: AmountDetailsModel.fromJson(json['amount_details']),
      amountReceived: json['amount_received'],
      application: json['application'],
      applicationFeeAmount: json['application_fee_amount'],
      automaticPaymentMethods: AutomaticPaymentMethodsModel.fromJson(json['automatic_payment_methods']),
      canceledAt: json['canceled_at'],
      cancellationReason: json['cancellation_reason'],
      captureMethod: json['capture_method'],
      clientSecret: json['client_secret'],
      confirmationMethod: json['confirmation_method'],
      created: json['created'],
      currency: json['currency'],
      customer: json['customer'],
      description: json['description'],
      invoice: json['invoice'],
      lastPaymentError: json['last_payment_error'],
      latestCharge: json['latest_charge'],
      livemode: json['livemode'],
      metadata: json['metadata'],
      nextAction: json['next_action'],
      onBehalfOf: json['on_behalf_of'],
      paymentMethod: json['payment_method'],
      paymentMethodOptions: PaymentMethodOptionsModel.fromJson(json['payment_method_options']),
      paymentMethodTypes: List<String>.from(json['payment_method_types']),
      processing: json['processing'],
      receiptEmail: json['receipt_email'],
      review: json['review'],
      setupFutureUsage: json['setup_future_usage'],
      shipping: json['shipping'],
      source: json['source'],
      statementDescriptor: json['statement_descriptor'],
      statementDescriptorSuffix: json['statement_descriptor_suffix'],
      status: json['status'],
      transferData: json['transfer_data'],
      transferGroup: json['transfer_group'],
    );
  }
}

class AmountDetailsModel {
  AmountDetailsModel();

  factory AmountDetailsModel.fromJson(Map<String, dynamic> json) {
    return AmountDetailsModel();
  }
}

class AutomaticPaymentMethodsModel {
  final bool enabled;

  AutomaticPaymentMethodsModel({required this.enabled});

  factory AutomaticPaymentMethodsModel.fromJson(Map<String, dynamic> json) {
    return AutomaticPaymentMethodsModel(
      enabled: json['enabled'],
    );
  }
}

class PaymentMethodOptionsModel {
  final CardModel card;
  final LinkModel link;

  PaymentMethodOptionsModel({required this.card, required this.link});

  factory PaymentMethodOptionsModel.fromJson(Map<String, dynamic> json) {
    return PaymentMethodOptionsModel(
      card: CardModel.fromJson(json['card']),
      link: LinkModel.fromJson(json['link']),
    );
  }
}

class CardModel {
  final String? requestThreeDSecure;

  CardModel({required this.requestThreeDSecure});

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      requestThreeDSecure: json['request_three_d_secure'],
    );
  }
}

class LinkModel {
  final String? persistentToken;

  LinkModel({required this.persistentToken});

  factory LinkModel.fromJson(Map<String, dynamic> json) {
    return LinkModel(
      persistentToken: json['persistent_token'],
    );
  }
}