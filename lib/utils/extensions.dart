import 'package:intl/intl.dart';

import 'const.dart';

extension toHumanDate on String {
  String convertToDateWithTime() {
    try {
      if (this.isNotEmpty) {
        DateTime parseDt = DateTime.parse(this);
        final dateShort = DateFormat.MMMd().format(parseDt);

        final timeShort = DateFormat.jm().format(parseDt);
        print('$dateShort at $timeShort');
        return '$dateShort at $timeShort';
      } else {
        return " ";
      }
    } catch (e) {
      print(e);
      return " ";
    }
  }

  String convertToReadableDate() {
    try {
      if (this.isNotEmpty) {
        DateTime parseDt = DateTime.parse(this);
        // final dateShort = DateFormat.yMMMMd().format(parseDt);
        DateTime now = DateTime.parse(this);
        final dateShort = DateFormat('dd MMMM yyyy').format(now);
        final timeShort = DateFormat.jm().format(parseDt);
        print('$dateShort at $timeShort');
        // return '$dateShort at $timeShort';
        return '$dateShort';
      } else {
        return " ";
      }
    } catch (e) {
      print(e);
      return " ";
    }
  }

  String convertToNormalDate() {
    try {
      if (this.isNotEmpty) {
        DateTime parseDt = DateTime.parse(this);
        final DateFormat inputFormat = DateFormat('dd MMMM yyyy');

        var dateShort = inputFormat.format(parseDt);

        return '$dateShort';
      } else {
        return " ";
      }
    } catch (e) {
      print(e);
      return " ";
    }
  }

  String convertToServerDate() {
    try {
      if (this.isNotEmpty) {
        DateTime parseDt = DateTime.parse(this);
        // final DateFormat inputFormat = DateFormat('dd/MM/yyyy');
        final DateFormat inputFormat = DateFormat('yyyy-MM-dd');

        var dateShort = inputFormat.format(parseDt);

        return '$dateShort';
      } else {
        return " ";
      }
    } catch (e) {
      print(e);
      return " ";
    }
  }
}

extension profileImage on String {
  String getProfileImage() {
    if (this.isNotEmpty) {
      return "$kImageBaseUrl$this";
    } else {
      return '${kImageBaseUrl}cmp_logo.png';
    }
  }
}

extension string on int {
  ///for getting string from  int
  String getString() {
    // if (this == null) return "";
    return this.toString();
  }
}
