import 'package:external_dependencies/external_dependencies.dart';

extension DateTimeExtensions on DateTime {
  String get yyyyMMdd => DateFormat('yyyy-MM-dd').format(this);
}
