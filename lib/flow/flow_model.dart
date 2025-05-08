import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/service_widget_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'flow_widget.dart' show FlowWidget;
import 'package:flutter/material.dart';

class FlowModel extends FlutterFlowModel<FlowWidget> {
  ///  Local state fields for this page.

  int? slider = 1;

  List<ServiceModelStruct> servicelist = [];
  void addToServicelist(ServiceModelStruct item) => servicelist.add(item);
  void removeFromServicelist(ServiceModelStruct item) =>
      servicelist.remove(item);
  void removeAtIndexFromServicelist(int index) => servicelist.removeAt(index);
  void insertAtIndexInServicelist(int index, ServiceModelStruct item) =>
      servicelist.insert(index, item);
  void updateServicelistAtIndex(
          int index, Function(ServiceModelStruct) updateFn) =>
      servicelist[index] = updateFn(servicelist[index]);

  DateTime? selecteddate;

  List<String> slotlist = [];
  void addToSlotlist(String item) => slotlist.add(item);
  void removeFromSlotlist(String item) => slotlist.remove(item);
  void removeAtIndexFromSlotlist(int index) => slotlist.removeAt(index);
  void insertAtIndexInSlotlist(int index, String item) =>
      slotlist.insert(index, item);
  void updateSlotlistAtIndex(int index, Function(String) updateFn) =>
      slotlist[index] = updateFn(slotlist[index]);

  bool loader = true;

  String? bookedSlot;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Slider widget.
  double? sliderValue;
  // Stores action output result for [Backend Call - API (availabilitybookingdate)] action in Button widget.
  ApiCallResponse? apiResultff4;
  // Stores action output result for [Custom Action - jsonMapToList] action in Button widget.
  List<String>? rsultfirst;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Models for Service_widget dynamic component.
  late FlutterFlowDynamicModels<ServiceWidgetModel> serviceWidgetModels1;
  // State field(s) for Checkbox widget.
  Map<ServiceModelStruct, bool> checkboxValueMap1 = {};
  List<ServiceModelStruct> get checkboxCheckedItems1 =>
      checkboxValueMap1.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // Models for Service_widget dynamic component.
  late FlutterFlowDynamicModels<ServiceWidgetModel> serviceWidgetModels2;
  // State field(s) for Checkbox widget.
  Map<ServiceModelStruct, bool> checkboxValueMap2 = {};
  List<ServiceModelStruct> get checkboxCheckedItems2 =>
      checkboxValueMap2.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for Checkbox widget.
  Map<AssistantsStruct, bool> checkboxValueMap3 = {};
  List<AssistantsStruct> get checkboxCheckedItems3 => checkboxValueMap3.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay1;
  // Stores action output result for [Backend Call - API (availabilitybookingdate)] action in Calendar widget.
  ApiCallResponse? apiResultef5;
  // Stores action output result for [Custom Action - jsonMapToList] action in Calendar widget.
  List<String>? slotloist;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay2;
  // Stores action output result for [Backend Call - API (availabilitybookingdate)] action in Calendar widget.
  ApiCallResponse? apiResultefweb;
  // Stores action output result for [Custom Action - jsonMapToList] action in Calendar widget.
  List<String>? slotweb;

  @override
  void initState(BuildContext context) {
    serviceWidgetModels1 = FlutterFlowDynamicModels(() => ServiceWidgetModel());
    serviceWidgetModels2 = FlutterFlowDynamicModels(() => ServiceWidgetModel());
    calendarSelectedDay1 = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    calendarSelectedDay2 = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    serviceWidgetModels1.dispose();
    serviceWidgetModels2.dispose();
  }
}
