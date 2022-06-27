import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'input_field.dart';
import 'showCupertinoDatePicker.dart';

class DOBTextWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final DateTime? selectedDate;
  final Function(DateTime) onDateTimeChanged;

  DOBTextWidget({
    Key? key,
    required this.textEditingController,
    required this.onDateTimeChanged,
    this.selectedDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InputField(
          enabled: false,
          labelText: 'Date of Birth',
          hintText: 'DD/MM/YY',
          // textColor: Color(0xFF747474),
          // hintColor: Color(0xFFcacaca),
          borderColor: Color(0xFFe7e7e7),
          focusedBorderColor: Color(0xFFe7e7e7),
          fontSize: 18.0,
          // suffixIcon: IconButton(
          //   // onPressed: () => _selectDate(context),
          //   onPressed: () {
          //     _showDatePicker(context);
          //   },
          //   icon: Image.asset('assets/icons/calendar_red.png'),
          //   iconSize: 26,
          // ),
          textEditingController: this.textEditingController,
        ),
        Row(
          children: [
            Spacer(),
            InkWell(
              onTap: () {
                hideKeyboard(context);
                _showDatePicker(context);
              },
              child: Container(
                  margin: const EdgeInsets.only(top: 16),
                  padding: const EdgeInsets.only(top: 8, left: 16),
                  // onPressed: () => _selectDate(context),
                  // onPressed: () {
                  //   _showDatePicker(context);
                  // },
                  child: Icon(Icons.calendar_today)
                  // iconSize: 26,,
                  ),
            ),
          ],
        ),
      ],
    );

    // return TextField(
    //   decoration: InputDecoration(
    //       contentPadding: EdgeInsets.all(0),
    //       focusColor: Constants.primaryColor,
    //       fillColor: Constants.primaryColor,
    //       enabledBorder: UnderlineInputBorder(
    //         borderSide: BorderSide(color: Constants.primaryColor),
    //       ),
    //       focusedBorder: UnderlineInputBorder(
    //         borderSide: BorderSide(color: Constants.primaryColor),
    //       ),
    //       border: UnderlineInputBorder(
    //         borderSide: BorderSide(color: Constants.primaryColor),
    //       ),
    //       labelText: "Date of Birth",
    //       labelStyle: TextStyle(
    //           color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w600),
    //       hintText: 'DD/MM/YY',
    //       suffixIcon: IconButton(
    //         // onPressed: () => _selectDate(context),
    //         onPressed: () {
    //           _showDatePicker(context);
    //         },
    //         icon: Image.asset('assets/icons/calendar_red.png'),
    //         iconSize: 26,
    //       ),
    //       hoverColor: Constants.primaryColor),
    //   controller: textEditingController,
    // );
  }

  void hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  void _showDatePicker(context) {
    // DateTime range = DateTime.now();
    // range.subtract(duration)
    // final minDate = range.subtract(Duration(days: 13 * 365));
    // final maxDate = range.subtract(Duration(days: 4 * 365));

    showCupertinoDatePicker(
      context,
      useText: true,
      mode: CupertinoDatePickerMode.date,
      initialDateTime: selectedDate ?? DateTime.now(),
      // minimumYear: range.year - 13,
      // maximumYear: range.year - 4,
      // minimumDate: DateTime(range.year - 13),
      // maximumDate: DateTime(range.year - 4),
      // minimumDate: minDate,
      // maximumDate: maxDate,
      leftHanded: false,
      onDateTimeChanged: (DateTime date) {
        print(date);
        DateTime result = DateTime.now();
        if (date.year > 0) {
          result = DateTime(date.year, date.month, date.day);
        }
        // else {
        //   // The user has hit the cancel button.
        //   result = DateTime.now();
        //   print(date);
        // }
        print(result);
        final DateFormat inputFormat = DateFormat('dd/MM/yyyy');
        var formattedOutputDate = inputFormat.format(result);
        // var formattedInputDate = inputFormat.parse(formattedOutputDate);
        print('formatted date $formattedOutputDate');
        textEditingController.text = '$formattedOutputDate';
        onDateTimeChanged(date);
      },
    );
  }

// Future<void> _selectDate(BuildContext context) async {
//   final DateTime picked = await showDatePicker(
//     context: context,
//     initialDate: selectedDate,
//     firstDate: DateTime(2015, 8),
//     lastDate: DateTime.now(),
//   );
//   if (picked != null && picked != selectedDate) {
//     setState(() {
//       selectedDate = picked;
//       dobTFController.text = '${picked.day}/${picked.month}/${picked.year}';
//     });
//   }
// }
  // }
}
