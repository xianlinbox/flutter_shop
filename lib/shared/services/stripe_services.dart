import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  static init() {
    Stripe.publishableKey =
        'pk_test_51KkH1QJAb7q1jP0hFd7voHwQm1rBx7djcfR8TeyNC8EuxRoWe22YIVhbKKwYorv5e5VQMaqgHLwzc9XWId29u49j00T2Nqbrsg';
    Stripe.merchantIdentifier = 'xianlinbox.com';
    Stripe.urlScheme = 'flutterstripe';
  }

  static Future<void> _createCreditCard(
      String customerId, String paymentIntentClientSecret) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      applePay: true,
      googlePay: true,
      style: ThemeMode.dark,
      testEnv: true,
      merchantCountryCode: 'JP',
      merchantDisplayName: 'Flutter Stripe Store Demo',
      customerId: customerId,
      paymentIntentClientSecret: paymentIntentClientSecret,
    ));

    await Stripe.instance.presentPaymentSheet();
  }

  static Future<void> payment() async {
    await _createCreditCard('id', 'client_secret');
  }
}
