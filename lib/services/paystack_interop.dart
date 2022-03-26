import 'package:js/js.dart';

@JS()
external paystackPopUp(
  String pkTest,
  String email,
  String amount,
  String ref,
  void Function() onClosed,
  void Function() callback,
);



















// @JS('PaystackPop')
// library facebook_integration.js;

// import 'package:js/js.dart';

// typedef PaystackCallback = void Function(dynamic response);

// @JS('setup')
// external setup(SetUpOptions options);

// @JS('openIframe')
// external openIframe();

// @JS()
// @anonymous
// class SetUpOptions {
//   external factory SetUpOptions({
//     String key,
//     String email,
//     int amount,
//     String ref,
//     PaystackCallback onClosed,
//     PaystackCallback callback,
//   });
//   external String key;
//   external String email;
//   external int amount;
//   external String ref;
//   external PaystackCallback onClosed;
//   external PaystackCallback callback;
// }
