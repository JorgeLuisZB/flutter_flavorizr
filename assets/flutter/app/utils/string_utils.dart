import 'constants.dart';

class StringUtils {
  static String enumName(String enumToString) {
    List<String> paths = enumToString.split('.');
    return paths[paths.length - 1];
  }
}

extension DateTimeFormatting on DateTime {
  String prettify() {
    return dateTimeFormat.format(this).toString();
  }
}
