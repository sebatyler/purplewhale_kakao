import 'dart:developer';

import 'package:get/get.dart';
// import 'package:url_launcher/url_launcher_string.dart';

// Future<void> launchURL(String url) async {
//   if (await canLaunchUrlString(url)) {
//     await launchUrlString(url);
//   } else {
//     log('Could not launch $url');
//   }
// }

String getWeekdayString(int index) {
  switch (index) {
    case 0:
      return '일';
    case 1:
      return '월';
    case 2:
      return '화';
    case 3:
      return '수';
    case 4:
      return '목';
    case 5:
      return '금';
    case 6:
      return '토';
    default:
      return '';
  }
}

String filterNonAscii(String input) {
  StringBuffer filteredBuffer = StringBuffer();

  for (int i = 0; i < input.length; i++) {
    int codePoint = input.codeUnitAt(i);
    if (codePoint <= 127) {
      filteredBuffer.writeCharCode(codePoint);
    }
  }

  return filteredBuffer.toString();
}

double get paddingBottom {
  double bottom = Get.mediaQuery.padding.bottom;
  return bottom > 0 ? bottom : 30.0;
}

String quote(String? text) => (text?.isNotEmpty == true) ? "“$text”" : "";
