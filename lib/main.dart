import 'package:flutter/material.dart';
import 'package:flutter_web_paystack_popup/page/home.dart';

void main() {
  runApp(const MyApp());
}

const String projectTitle = 'FLUTTER WEB - PAYSTACK POPUP';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: projectTitle,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: projectTitle),
    );
  }
}
