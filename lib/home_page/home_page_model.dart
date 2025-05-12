// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  List<BookingItemStruct> items = [];
  void addToItems(BookingItemStruct item) => items.add(item);
  void removeFromItems(BookingItemStruct item) => items.remove(item);
  void removeAtIndexFromItems(int index) => items.removeAt(index);
  void insertAtIndexInItems(int index, BookingItemStruct item) =>
      items.insert(index, item);
  void updateItemsAtIndex(int index, Function(BookingItemStruct) updateFn) =>
      items[index] = updateFn(items[index]);

  DateTime? startdate;

  DateTime? endDate;

  bool loader = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (BookingsMobileSalonBookingAPI )] action in HomePage widget.
  ApiCallResponse? apiResultiw2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

class BookingItemModel {
  final int id;
  final DateTime date;
  final TimeOfDay time;
  final String customer_first_name;
  final String customer_last_name;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'date': date.millisecondsSinceEpoch,
      'time': time.toString(),
      'customer_first_name': customer_first_name,
      'customer_last_name': customer_last_name,
    };
  }

  factory BookingItemModel.fromMap(Map<String, dynamic> map) {
    final times = (map['time'] as String).split(':');
    return BookingItemModel(
      customer_first_name: map['customer_first_name'] as String,
      customer_last_name: map['customer_last_name'] as String,
      id: map['id'] as int,
      date: DateTime.parse(map['date']),
      time: TimeOfDay(
        hour: int.parse(times[0]),
        minute: int.parse(times[1]),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory BookingItemModel.fromJson(String source) =>
      BookingItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  BookingItemModel(
      {required this.id,
      required this.date,
      required this.time,
      required this.customer_first_name,
      required this.customer_last_name});
}
