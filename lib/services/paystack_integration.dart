// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:js' as js;
import 'package:flutter_web_paystack_popup/constant/payment_key.dart';

import '../services/paystack_interop.dart' as paystack;

class PaystackPopup {
  static Future<void> openPaystackPopup({
    required String email,
    required String amount,
    required String ref,
    required void Function() onClosed,
    required void Function() onSuccess,
  }) async {
    js.context.callMethod(
      paystack.paystackPopUp(
        publicKey,
        email,
        amount,
        ref,
        js.allowInterop(
          onClosed,
        ),
        js.allowInterop(
          onSuccess,
        ),
      ),
      [],
    );
  }
}
