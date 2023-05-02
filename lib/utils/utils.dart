import 'package:intl/intl.dart';

String dateTimeToTimeString(DateTime dateTime) {
  return DateFormat('HH:mm').format(dateTime);
}

String dateTimeToDateString(DateTime dateTime) {
  // Format it like this: 30th Jan 2021

  return DateFormat("d'${getDaySuffix(dateTime.day)}' MMM yyyy")
      .format(dateTime);
}

String durationToString(Duration duration) {
  int totalHours = duration.inHours; // Total hours
  int totalMinutes = duration.inMinutes %
      60; // Total minutes (mod 60 to get the remaining minutes after accounting for total hours)
  return '${totalHours}h ${totalMinutes}m';
}

String getDaySuffix(int day) {
  if (day >= 11 && day <= 13) {
    return 'th';
  }
  switch (day % 10) {
    case 1:
      return 'st';
    case 2:
      return 'nd';
    case 3:
      return 'rd';
    default:
      return 'th';
  }
}
