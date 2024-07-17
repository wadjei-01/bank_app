import 'package:timeago/timeago.dart' as timeAgo;
import 'package:intl/intl.dart';

class TimeUtils {
  static String timeAgoHeader(DateTime? dateTime) {
    if (dateTime != null) return timeAgo.format(dateTime);
    return 'N/A';
  }

  static String formattedDate(String date) {
    final dateTime = DateTime.parse(date);
    return DateFormat('yMMMMd').format(dateTime);
  }

  static String getTimeOfDay() {
    String timeOfDay = '';
    final date = DateTime.now();
    final hour = date.hour;

    if (hour <= 11) {
      timeOfDay = 'Good Morning';
    } else if (hour >= 12 && hour < 18) {
      timeOfDay = 'Good Afternoon';
    } else {
      timeOfDay = 'Good Evening';
    }
    return timeOfDay;
  }
}
