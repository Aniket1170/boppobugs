import 'package:boppo_stream/utils/const.dart';
import 'package:flutter/material.dart';

import 'components/CartListWidget.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Cart',
                  style: TextStyle(
                      color: Color(0xFF0F0F0F),
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500),
                ),
                CartListWidget(),
                const Text(
                  'Promo Code',
                  style: TextStyle(
                      color: Color(0xFF87879D),
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 10),
                _buildPromoCodeField(),
                const SizedBox(height: 40),
                Container(
                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFF707070),
                        ),
                        borderRadius: BorderRadius.circular(16.0)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildPriceRow(),
                        _buildPriceRow(
                            priceName: 'Tax Paid (GST)', priceValue: '399.00'),
                        const Divider(color: Color(0xFF707070)),
                        _buildPriceRow(
                            priceName: 'YOU PAY', priceValue: '399.00'),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 16.0),
                          child: Text(
                            '(Inclusive of all Taxes)',
                            style: TextStyle(
                                color: Color(0xFF000D24),
                                fontSize: 10.0,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    )),
                const SizedBox(height: 10),
                FlatButton(
                  minWidth: double.infinity,
                  height: 50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // <-- Radius
                  ),
                  color: Color(0xFF3257A6),
                  child: const Text("Continue to Pay",
                      style: TextStyle(color: Colors.white, fontSize: 14)),
                  onPressed: () => _onContinueToPay(),
                ),
              ],
            ),
          ),
        ),
      );

  TextField _buildPromoCodeField() => TextField(
        // controller: _textEditingController,
        decoration: InputDecoration(
          filled: false,
          contentPadding: const EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.card_giftcard,
            size: 24.0,
          ),
          suffixIcon: FlatButton(
            // padding: const EdgeInsets.all(0.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12)),
            ),
            onPressed: () {},
            child: Text(
              'APPLY CODE',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500),
            ),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF000D24), width: 2.0),
            borderRadius: BorderRadius.circular(12.0),
          ),
          hintStyle: TextStyle(color: Colors.black),
          hintText: "5x33958",
          // labelText: "Mobile Number",
          counterText: '', // to hide charLimit text
        ),
        maxLength: 10,
        keyboardType: TextInputType.phone,
      );

  Widget _buildPriceRow(
          {String priceName = 'Sub Total', String priceValue = '399.00'}) =>
      Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              priceName,
              style: TextStyle(
                  color: Color(0xFF232527),
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              '$rupeeSymbol $priceValue',
              style: TextStyle(
                  color: Color(0xFF515C6F),
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      );

  _onContinueToPay() {}
}
