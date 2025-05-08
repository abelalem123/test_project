import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
