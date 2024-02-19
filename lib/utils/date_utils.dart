import 'package:intl/intl.dart';

class DatesUtils {
  static String timesAndMinutesAgo(String timestamp) {
    var now = DateTime.now();
    // var format = DateFormat('HH:mm a');
    var date = DateTime.fromMicrosecondsSinceEpoch(int.parse(timestamp));
    var diff = now.difference(date);
    var time = '';

    // print(diff.inMinutes);

    if (diff.inHours <= 1) {
      time = "${diff.inMinutes} minutes ago";
    } else if (diff.inHours <= 24) {
      time = "${diff.inHours} hour ago";
    } else if (diff.inDays > 0 && diff.inDays < 7) {
      if (diff.inDays == 1) {
        time = '${diff.inDays} day ago';
      } else {
        time = '${diff.inDays} days ago';
      }
    } else {
      if (diff.inDays == 7) {
        // time = '${(diff.inDays / 7).floor()} week ago';
        time = DateFormat("dd MMM yyyy").format(date);
      } else {
        // time = '${(diff.inDays / 7).floor()} weeks ago';
        time = DateFormat("dd MMM yyyy").format(date);
      }
    }

    return time;
  }
}
