import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_web_paystack_popup/main.dart';
import 'package:flutter_web_paystack_popup/services/paystack_integration.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final emailController = TextEditingController();
  final amountController = TextEditingController();

  @override
  void initState() {
    amountController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  String generateRef() {
    final randomCode = Random().nextInt(3234234);
    return 'ref-$randomCode';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 237, 237),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.height * 0.6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  projectTitle,
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                      ),
                ),
              ),
              const SizedBox(height: 48),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: amountController,
                decoration: const InputDecoration(
                  hintText: 'Amount(₦)',
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () async {
                  final ref = generateRef();
                  final amount = int.parse(amountController.text);

                  await PaystackPopup.openPaystackPopup(
                    email: emailController.text,
                    amount: (amount * 100).toString(),
                    ref: ref,
                    onClosed: () {
                      debugPrint('Could\'nt finish payment');
                    },
                    onSuccess: () {
                      debugPrint('successful payment');
                    },
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green[400]),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Pay${amountController.text.isEmpty ? '' : ' ₦${amountController.text}'} with Paystack',
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
