import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class StripeService {
  final client = http.Client();
  static Map<String, String> headers = {
    'Authorization':
        'Bearer sk_test_51KkH1QJAb7q1jP0hP88iyztqpLIRy0xuim3GZrEeWXc3lj16VSc3APFGUs99DQAwPZgq2mC4mQfrLv7cN8cqMrSU00XUHkG7QL',
    'Content-Type': 'application/x-www-form-urlencoded'
  };

  void init() {
    Stripe.publishableKey =
        'pk_test_51KkH1QJAb7q1jP0hFd7voHwQm1rBx7djcfR8TeyNC8EuxRoWe22YIVhbKKwYorv5e5VQMaqgHLwzc9XWId29u49j00T2Nqbrsg';
    Stripe.merchantIdentifier = 'xianlinbox.com';
    Stripe.urlScheme = 'flutterstripe';
  }

  Future<Map<String, dynamic>> _createCustomer() async {
    const String url = 'https://api.stripe.com/v1/customers';

    var response = await client.post(
      Uri.parse(url),
      headers: headers,
      body: {'description': 'new customer'},
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print(json.decode(response.body));
      throw 'Failed to register as a customer.';
    }
  }

  Future<Map<String, dynamic>> _createPaymentIntents(
      int amount, String currency) async {
    const String url = 'https://api.stripe.com/v1/payment_intents';

    Map<String, dynamic> body = {
      'amount': '$amount',
      'currency': currency,
      'payment_method_types[]': 'card'
    };

    var response =
        await client.post(Uri.parse(url), headers: headers, body: body);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print(json.decode(response.body));
      throw 'Failed to create PaymentIntents.';
    }
  }

  Future<void> _createCreditCard(
      String customerId, String paymentIntentClientSecret) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      applePay: true,
      googlePay: true,
      style: ThemeMode.dark,
      testEnv: true,
      merchantCountryCode: 'US',
      merchantDisplayName: 'Awssome Shop',
      customerId: customerId,
      paymentIntentClientSecret: paymentIntentClientSecret,
    ));

    await Stripe.instance.presentPaymentSheet();
  }

  Future<void> payment(double amount, String currency) async {
    init();
    int amountInCent = (amount * 100).round();
    final _customer = await _createCustomer();
    final _paymentIntent = await _createPaymentIntents(amountInCent, currency);
    await _createCreditCard(_customer['id'], _paymentIntent['client_secret']);
  }
}
