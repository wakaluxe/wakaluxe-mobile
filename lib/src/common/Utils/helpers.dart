// days of the week formatter from datetime
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String daysOfWeekFormatter(DateTime date, {bool short = false}) {
  final formatter = DateFormat(short ? 'E' : 'EEEE');
  return formatter.format(date);
}