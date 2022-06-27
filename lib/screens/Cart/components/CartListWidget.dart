import 'package:boppo_stream/screens/OrderHistory/order_details_page.dart';
import 'package:flutter/material.dart';

import 'CartListItemWidget.dart';

class CartListWidget extends StatelessWidget {
  final Function()? onDelete;

  const CartListWidget({Key? key, this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: 3,
      shrinkWrap: true,
      itemBuilder: (context, index) => InkWell(
          onTap: () => _showDetailsScreen(context),
          child: CartListItemWidget(
            onDelete: onDelete,
          )));

  _showDetailsScreen(BuildContext context) {
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => OrderDetailsPage()));
  }
}
