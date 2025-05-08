import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';

DateTime? weeklyBack(DateTime? chooseDate) {
  // 1 week of cchoosed date
  if (chooseDate == null) return null; // Check for null input
  return chooseDate
      .subtract(Duration(days: 7)); // Subtract 7 days for 1 week back
}

DateTime? fourDayback(String? choosedDate) {
  // Four Days Back of choosed Date
  if (choosedDate == null) return null;
  DateTime date = DateTime.parse(choosedDate);
  return date.subtract(Duration(days: 4));
}

DateTime? weeklyNext(DateTime? choosedDate) {
  // Weekly next of choosed date
  if (choosedDate == null) return null; // Check if the date is null
  return choosedDate.add(Duration(days: 7)); // Add 7 days to the chosen date
}

DateTime? fourDaysNext(DateTime? choosedDate) {
  // four Days of next
  if (choosedDate == null) return null; // Check for null input
  return choosedDate.add(Duration(days: 4)); // Add four days to the chosen date
}
