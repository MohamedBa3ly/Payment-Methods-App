class CustomerModel {
  final String id;
  final String object;
  final int balance;
  final int created;
  final String? currency;
  final String? defaultSource;
  final bool delinquent;
  final String? description;
  final String? discount;
  final String? email;
  final String invoicePrefix;
  final InvoiceSettingsModel invoiceSettings;
  final bool livemode;
  final Map<String, dynamic> metadata;
  final String? name;
  final int nextInvoiceSequence;
  final String? phone;
  final List<String> preferredLocales;
  final String taxExempt;
  final String? testClock;

  CustomerModel({
    required this.id,
    required this.object,
    required this.balance,
    required this.created,
    required this.currency,
    required this.defaultSource,
    required this.delinquent,
    required this.description,
    required this.discount,
    required this.email,
    required this.invoicePrefix,
    required this.invoiceSettings,
    required this.livemode,
    required this.metadata,
    required this.name,
    required this.nextInvoiceSequence,
    required this.phone,
    required this.preferredLocales,
    required this.taxExempt,
    required this.testClock,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['id'],
      object: json['object'],
      balance: json['balance'],
      created: json['created'],
      currency: json['currency'],
      defaultSource: json['default_source'],
      delinquent: json['delinquent'],
      description: json['description'],
      discount: json['discount'],
      email: json['email'],
      invoicePrefix: json['invoice_prefix'],
      invoiceSettings: InvoiceSettingsModel.fromJson(json['invoice_settings']),
      livemode: json['livemode'],
      metadata: json['metadata'],
      name: json['name'],
      nextInvoiceSequence: json['next_invoice_sequence'],
      phone: json['phone'],
      preferredLocales: List<String>.from(json['preferred_locales']),
      taxExempt: json['tax_exempt'],
      testClock: json['test_clock'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'object': object,
      'balance': balance,
      'created': created,
      'currency': currency,
      'default_source': defaultSource,
      'delinquent': delinquent,
      'description': description,
      'discount': discount,
      'email': email,
      'invoice_prefix': invoicePrefix,
      'invoice_settings': invoiceSettings.toJson(),
      'livemode': livemode,
      'metadata': metadata,
      'name': name,
      'next_invoice_sequence': nextInvoiceSequence,
      'phone': phone,
      'preferred_locales': preferredLocales,
      'tax_exempt': taxExempt,
      'test_clock': testClock,
    };
  }
}

class InvoiceSettingsModel {
  final String? customFields;
  final String? defaultPaymentMethod;
  final String? footer;
  final String? renderingOptions;

  InvoiceSettingsModel({
    required this.customFields,
    required this.defaultPaymentMethod,
    required this.footer,
    required this.renderingOptions,
  });

  factory InvoiceSettingsModel.fromJson(Map<String, dynamic> json) {
    return InvoiceSettingsModel(
      customFields: json['custom_fields'],
      defaultPaymentMethod: json['default_payment_method'],
      footer: json['footer'],
      renderingOptions: json['rendering_options'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'custom_fields': customFields,
      'default_payment_method': defaultPaymentMethod,
      'footer': footer,
      'rendering_options': renderingOptions,
    };
  }
}
