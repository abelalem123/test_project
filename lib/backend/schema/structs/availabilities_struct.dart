// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AvailabilitiesStruct extends BaseStruct {
  AvailabilitiesStruct({
    DaysStruct? days,
  }) : _days = days;

  // "days" field.
  DaysStruct? _days;
  DaysStruct get days => _days ?? DaysStruct();
  set days(DaysStruct? val) => _days = val;

  void updateDays(Function(DaysStruct) updateFn) {
    updateFn(_days ??= DaysStruct());
  }

  bool hasDays() => _days != null;

  static AvailabilitiesStruct fromMap(Map<String, dynamic> data) =>
      AvailabilitiesStruct(
        days: data['days'] is DaysStruct
            ? data['days']
            : DaysStruct.maybeFromMap(data['days']),
      );

  static AvailabilitiesStruct? maybeFromMap(dynamic data) => data is Map
      ? AvailabilitiesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'days': _days?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'days': serializeParam(
          _days,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static AvailabilitiesStruct fromSerializableMap(Map<String, dynamic> data) =>
      AvailabilitiesStruct(
        days: deserializeStructParam(
          data['days'],
          ParamType.DataStruct,
          false,
          structBuilder: DaysStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'AvailabilitiesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AvailabilitiesStruct && days == other.days;
  }

  @override
  int get hashCode => const ListEquality().hash([days]);
}

AvailabilitiesStruct createAvailabilitiesStruct({
  DaysStruct? days,
}) =>
    AvailabilitiesStruct(
      days: days ?? DaysStruct(),
    );
