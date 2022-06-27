import 'package:boppo_stream/utils/const.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({
    Key? key,
  }) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int _value = 0;
  int _totalAmount = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          child: Column(
            children: [
              const Text(
                'Checkout',
                style: TextStyle(
                    // color: Color(0xFF656565),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500),
              ),
              const Text(
                'Billing Address',
                style: TextStyle(
                    // color: Color(0xFF8B8B8B),
                    fontSize: 13.0,
                    fontWeight: FontWeight.w500),
              ),
              ListView.builder(
                itemBuilder: (context, index) {
                  return RadioListTile(
                    value: index,
                    groupValue: _value,
                    onChanged: (_i) => setState(() => _value = _i as int),
                    title: Text("Number $index"),
                  );
                },
                itemCount: 2,
              ),
              const Text(
                'As a security measure, please enter the security Code (CVV) of your card 2009',
                style: TextStyle(
                    color: Color(0xFF8B8B8B),
                    fontSize: 13.0,
                    fontWeight: FontWeight.w500),
              ),
              const Text(
                'Purchase Details',
                style: TextStyle(
                    // color: Color(0xFF656565),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500),
              ),
              const Text(
                'Summary',
                style: TextStyle(
                    // color: Color(0xFF656565),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500),
              ),
              const Text(
                'By completing your purchase you agree to these Terms of Services',
                style: TextStyle(
                    // color: Color(0xFF8B8B8B),
                    fontSize: 13.0,
                    fontWeight: FontWeight.w500),
              ),
              TextButton(
                // minWidth: double.infinity,
                // height: 50,
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(8.0), // <-- Radius
                // ),
                // color: Color(0xFF3257A6),
                child: Text("Pay $rupeeSymbol $_totalAmount",
                    style:
                        const TextStyle(color: Colors.white, fontSize: 14.0)),
                onPressed: () => _onContinueToPay(),
              ),
            ],
          ),
        ),
      );

  void _onContinueToPay() {}
}
