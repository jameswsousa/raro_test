import 'package:intl/intl.dart';

class DateParser {
  static const String dateFormat = 'yyyy-MM-dd';
  static const String brFormat = 'dd/MM/yyyy';
  static const String timeFormat = 'HH:mm';
  static const String ddMMFormat = 'dd/MM';

  static String getDateString(DateTime? date) {
    return date != null ? DateFormat(brFormat).format(date) : '';
  }

  static String getddMMString(DateTime? date) {
    return date != null ? DateFormat(ddMMFormat).format(date) : '';
  }

  static String getDateWithTimeString(DateTime? date) {
    return date != null ? DateFormat('$brFormat $timeFormat').format(date) : '';
  }

  static String getDateStringEn(DateTime? date) {
    return date != null ? DateFormat(dateFormat).format(date) : '';
  }

  static DateTime getDateTime(String? date) {
    return date != null
        ? DateFormat(dateFormat, 'pt_BR').parse(date)
        : DateTime(0, 0, 0);
  }

  static String lastMessageString(DateTime? date) {
    return date != null
        ? DateParser.getDateString(date) ==
                DateParser.getDateString(DateTime.now())
            ? DateFormat(timeFormat).format(date)
            : getDateString(date)
        : '';
  }

  static String getMonthWithZero(DateTime date) {
    final month = date.month;
    String monthWithZero = '';
    if (month < 10) {
      monthWithZero = '0$month';
    } else {
      monthWithZero = month.toString();
    }
    return monthWithZero;
  }

  static String getNameDaySubString(DateTime date) {
    var nameDay = DateFormat('EEEE', 'pt').format(date);
    nameDay = nameDay.substring(0, 1).toUpperCase() + nameDay.substring(1);
    return nameDay.substring(0, 3);
  }

  static String getNameDayString(DateTime date) {
    var nameDay = DateFormat('EEEE', 'pt').format(date);
    nameDay = nameDay.substring(0, 1).toUpperCase() + nameDay.substring(1);
    return nameDay;
  }

  static String getNameMonthString(DateTime date) {
    var nameMonth = DateFormat('MMMM', 'pt').format(date);
    nameMonth =
        nameMonth.substring(0, 1).toUpperCase() + nameMonth.substring(1);
    return nameMonth.substring(0, 3);
  }

  static String getHourString(DateTime date) {
    final hour = DateFormat('HH:mm').format(date);
    return hour;
  }

  static String getInfoString(DateTime? date) {
    if (date == null) {
      return '';
    }
    return '${getNameDayString(date)}, ${date.day} ${getNameMonthString(date)} (${getHourString(date)})';
  }

  static int ageFromDate(DateTime? dateTime) {
    int age;
    bool birthdayDone = false;
    if (dateTime == null)
      return 0;
    else if (DateTime.now().month > dateTime.month) {
      birthdayDone = true;
    } else if (DateTime.now().month == dateTime.month) {
      if (DateTime.now().day <= dateTime.day) {
        birthdayDone = true;
      }
    }
    if (birthdayDone) {
      age = DateTime.now().year - dateTime.year;
    } else {
      age = (DateTime.now().year - dateTime.year) - 1;
    }
    return age;
  }
}
