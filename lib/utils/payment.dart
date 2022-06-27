import 'dart:convert';

import 'package:boppo_stream/Implementation/base_dispose.dart';
import 'package:boppo_stream/Implementation/base_init.dart';
import 'package:boppo_stream/screens/Details/model/payment_error.dart';
import 'package:boppo_stream/utils/flushbar/flushbar_loader.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Payment implements BaseInit, BaseDispose {
  final Function() addRefreshEvent;
  final BuildContext context;
  Payment({required this.context, required this.addRefreshEvent});
  late Razorpay _razorpay;

//rzp_test_oDw757e5auoleh
  void openCheckout({
    required int amount,
    required String orderId,
    required String receipt,
    required String movieName,
  }) async {
    var options = {
      'key': 'rzp_test_kBLZ32zhyK9XNm',
      'amount': amount,
      'name': 'Boppo Technologies',
      'description': movieName,
      'order_id': orderId,
      "receipt": receipt,
      "notes": {"receipt": receipt},
      'theme.color': '#03be03',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
    };
    // 'external': {
    //     'wallets': ['paytm', 'amazonpay'],
    //   }
    print('options: $options');
    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    showSuccessFlushbar(context, message: 'Your payment is successful');
    addRefreshEvent();
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('errors: ${response.message}');
    var errorObj = PaymentError.fromJson(json.decode(response.message!));
    final errorMessage = errorObj.error?.description;
    showErrorFlushbar(context, message: errorMessage ?? 'Payment unsuccessful');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    showErrorFlushbar(context, message: response.walletName!);
    addRefreshEvent();
  }

  @override
  void init() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    _razorpay.clear();
  }
}
