import 'package:boppo_stream/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartListItemWidget extends StatelessWidget {
  final Function()? onDelete;
  const CartListItemWidget({Key? key, this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(16.0),
        height: 150,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: FadeInImage(
                image: NetworkImage(kPlaceHolderImageUrl),
                placeholder: NetworkImage(kPlaceHolderImageUrl),
                // fit: BoxFit.fill,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(16.0, 4.0, 0.0, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Laxmmi Bomb',
                        style: const TextStyle(
                            color: Color(0xFF515C6F),
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0),
                      ),
                      Text(
                        'Akshay Kumar, Kiara Advani Sharad Kelkar',
                        style: const TextStyle(
                            color: Color(0xFF515C6F),
                            fontWeight: FontWeight.w300,
                            fontSize: 15.0),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text(
                            '$rupeeSymbol 189.00',
                            style: const TextStyle(
                                color: Color(0xFFFF6969),
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0),
                          ),
                          const Spacer(),
                          TextButton.icon(
                            // shape: RoundedRectangleBorder(
                            //   borderRadius:
                            //       BorderRadius.circular(8.0), // <-- Radius
                            // ),
                            icon: Icon(
                              CupertinoIcons.delete,
                              color: Color(0xFF515C6F),
                              size: 18.0,
                            ),
                            label: const Text("Remove",
                                style: TextStyle(
                                    color: Color(0xFF515C6F), fontSize: 14)),
                            onPressed: onDelete,
                          ),
                        ],
                      ),
                    ],
                  ),
                ))
          ],
        ),
      );
}
