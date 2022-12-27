import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String formatTo(String pattern) {
    final format = DateFormat(pattern, 'th');
    return format.format(this);
  }

  String parseDDMMYYHm() {
    final date = DateFormat.yMMMd('th').format(DateTime.now());
    final time = DateFormat.Hm('th').format(DateTime.now());
    return 'วันที่ $date เวลา $time';
  }
}

extension UserExtension on String {
  String agenow() {
    final birthday0 = this;
    final birthday2 = birthday0.split("-");
    final newbirthday2 = '${birthday2[2]}-${birthday2[1]}-${birthday2[0]}';
    final birthday = DateTime.parse(newbirthday2);
    final daynow = DateTime.now();
    final age = daynow.difference(birthday);
    final agenow = (age.inDays / 365);
    return agenow.toInt().toString();
  }
}
// extension AppDateTime on TemporalDateTime {
//   String parseHm() {
//     return DateFormat.Hm('th').format(getDateTimeInUtc().add(Duration(hours: 7)));
//   }

//   String parseDDMMYYHm() {
//     final date = DateFormat.yMMMd('th').format(getDateTimeInUtc().add(Duration(hours: 7)));
//     final time = DateFormat.Hm('th').format(getDateTimeInUtc().add(Duration(hours: 7)));
//     return 'วันที่ $date เวลา $time';
//   }
// }
