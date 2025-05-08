// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HolidaysStruct extends BaseStruct {
  HolidaysStruct({
    String? fromDate,
    String? toDate,
    String? fromTime,
    String? toTime,
  })  : _fromDate = fromDate,
        _toDate = toDate,
        _fromTime = fromTime,
        _toTime = toTime;

  // "fromDate" field.
  String? _fromDate;
  String get fromDate => _fromDate ?? '';
  set fromDate(String? val) => _fromDate = val;

  bool hasFromDate() => _fromDate != null;

  // "toDate" field.
  String? _toDate;
  String get toDate => _toDate ?? '';
  set toDate(String? val) => _toDate = val;

  bool hasToDate() => _toDate != null;

  // "fromTime" field.
  String? _fromTime;
  String get fromTime => _fromTime ?? '';
  set fromTime(String? val) => _fromTime = val;

  bool hasFromTime() => _fromTime != null;

  // "toTime" field.
  String? _toTime;
  String get toTime => _toTime ?? '';
  set toTime(String? val) => _toTime = val;

  bool hasToTime() => _toTime != null;

  static HolidaysStruct fromMap(Map<String, dynamic> data) => HolidaysStruct(
        fromDate: data['fromDate'] as String?,
        toDate: data['toDate'] as String?,
        fromTime: data['fromTime'] as String?,
        toTime: data['toTime'] as String?,
      );

  static HolidaysStruct? maybeFromMap(dynamic data) =>
      data is Map ? HolidaysStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'fromDate': _fromDate,
        'toDate': _toDate,
        'fromTime': _fromTime,
        'toTime': _toTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'fromDate': serializeParam(
          _fromDate,
          ParamType.String,
        ),
        'toDate': serializeParam(
          _toDate,
          ParamType.String,
        ),
        'fromTime': serializeParam(
          _fromTime,
          ParamType.String,
        ),
        'toTime': serializeParam(
          _toTime,
          ParamType.String,
        ),
      }.withoutNulls;

  static HolidaysStruct fromSerializableMap(Map<String, dynamic> data) =>
      HolidaysStruct(
        fromDate: deserializeParam(
          data['fromDate'],
          ParamType.String,
          false,
        ),
        toDate: deserializeParam(
          data['toDate'],
          ParamType.String,
          false,
        ),
        fromTime: deserializeParam(
          data['fromTime'],
          ParamType.String,
          false,
        ),
        toTime: deserializeParam(
          data['toTime'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'HolidaysStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is HolidaysStruct &&
        fromDate == other.fromDate &&
        toDate == other.toDate &&
        fromTime == other.fromTime &&
        toTime == other.toTime;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([fromDate, toDate, fromTime, toTime]);
}

HolidaysStruct createHolidaysStruct({
  String? fromDate,
  String? toDate,
  String? fromTime,
  String? toTime,
}) =>
    HolidaysStruct(
      fromDate: fromDate,
      toDate: toDate,
      fromTime: fromTime,
      toTime: toTime,
    );
