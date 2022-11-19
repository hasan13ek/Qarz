import 'package:intl/intl.dart';

class TimeUtils {
  static String formatToMyTime(DateTime dateTime) {
    final format = DateFormat("hh:mm,  dd-MM-yyyy");
    return format.format(dateTime);
  }
}
//nima boldi
// portlab ketdi hechnima ko'rsatmay qoldi /
//projectni gitga qoshib public qilib linkni tashlab qoying manga
// hop 