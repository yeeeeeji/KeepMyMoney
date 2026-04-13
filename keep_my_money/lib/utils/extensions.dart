import 'package:intl/intl.dart';

extension IntFormatter on int {
  String get toWon => "${NumberFormat("#,###").format(this)}원";
}