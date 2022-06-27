import 'package:boppo_stream/AutoSizeText/auto_size_text.dart';
import 'package:boppo_stream/CommomWidgets/custom_button.dart';
import 'package:boppo_stream/Sizer/sizer.dart';
import 'package:boppo_stream/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:boppo_stream/utils/extensions.dart';

class PaymentInfoWidget extends StatelessWidget {
  const PaymentInfoWidget({
    Key? key,
    this.purchaseDate,
    this.totalAmount,
    this.orderId,
    this.subTotal,
    this.taxAmount,
    this.discount,
    this.onWatchClick,
  }) : super(key: key);

  final String? purchaseDate;
  final String? totalAmount;
  final String? orderId;
  final String? subTotal;
  final String? taxAmount;
  final String? discount;
  final Function()? onWatchClick;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            )),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  'Payment Info',
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
                ),
                AutoSizeText(
                  purchaseDate?.convertToReadableDate() ?? '',
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(16.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildOrderIdRow(
                        tagName: 'Order ID: ', value: orderId ?? ''),
                    PriceTile(
                        priceName: 'Sub Total ',
                        priceValue: subTotal ?? '0.00'),
                    _buildPromoCodeRow(
                      tagName: 'Promo Code ',
                      value: discount ?? '0.00',
                    ),
                    PriceTile(
                        priceName: 'Tax Paid (GST) ',
                        priceValue: taxAmount ?? '0.00'),
                    const Divider(
                      color: Colors.white,
                      thickness: 2,
                    ),
                    const SizedBox(height: 12),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xFF636A7A),
                          borderRadius:
                              BorderRadius.all(Radius.circular(16.0))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PriceTile(
                              priceName: 'You Paid ',
                              priceValue: totalAmount ?? '0.00'),
                          // Padding(
                          //   padding: const EdgeInsets.fromLTRB(
                          //       16.0, 0.0, 20.0, 12.0),
                          //   child: AutoSizeText(
                          //     '(Inclusive of all Taxes)',
                          //     style: TextStyle(
                          //         // color: Color(0xFF000D24),
                          //         fontSize: 5.0.sp,
                          //         fontWeight: FontWeight.w400),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ],
                )),
            const SizedBox(height: 20),
            CustomButton(onPressed: onWatchClick, label: 'WATCH'),
            const SizedBox(height: 20),
          ],
        ),
      );

  Widget _buildPromoCodeRow({required String tagName, required String value}) =>
      Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText(
              tagName,
              style: TextStyle(fontSize: 6.sp, fontWeight: FontWeight.w500),
            ),
            PriceText(
                priceValue: value, fontSize: 6.sp, fontColor: Color(0xFF00A41A))
          ],
        ),
      );

  Widget _buildOrderIdRow({required String tagName, required String value}) =>
      Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              tagName,
              style: TextStyle(fontSize: 10.sp),
            ),
            const SizedBox(width: 5.0),
            Expanded(
              child: AutoSizeText(
                '$value',
                // textAlign: TextAlign.end,
                style: TextStyle(fontSize: 10.sp),
              ),
            ),
          ],
        ),
      );
}

class PriceTile extends StatelessWidget {
  const PriceTile({Key? key, required this.priceName, required this.priceValue})
      : super(key: key);
  final String priceName;
  final String priceValue;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText(
              priceName,
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
            ),
            PriceText(priceValue: priceValue)
          ],
        ),
      );
}

class PriceText extends StatelessWidget {
  const PriceText(
      {Key? key, required this.priceValue, this.fontSize, this.fontColor})
      : super(key: key);
  final String priceValue;
  final double? fontSize;
  final Color? fontColor;

  @override
  Widget build(BuildContext context) => AutoSizeText(
        '$priceValue $rupeeSymbol',
        style: TextStyle(
            fontSize: fontSize ?? 16.sp,
            color: fontColor ?? Colors.white,
            fontWeight: FontWeight.w600),
      );
}
