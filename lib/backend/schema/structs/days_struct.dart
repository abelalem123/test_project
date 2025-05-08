// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DaysStruct extends BaseStruct {
  DaysStruct({
    int? i1,
    int? i2,
    int? i3,
    int? i4,
    int? i5,
    int? i6,
    int? i7,
  })  : _i1 = i1,
        _i2 = i2,
        _i3 = i3,
        _i4 = i4,
        _i5 = i5,
        _i6 = i6,
        _i7 = i7;

  // "i1" field.
  int? _i1;
  int get i1 => _i1 ?? 0;
  set i1(int? val) => _i1 = val;

  void incrementI1(int amount) => i1 = i1 + amount;

  bool hasI1() => _i1 != null;

  // "i2" field.
  int? _i2;
  int get i2 => _i2 ?? 0;
  set i2(int? val) => _i2 = val;

  void incrementI2(int amount) => i2 = i2 + amount;

  bool hasI2() => _i2 != null;

  // "i3" field.
  int? _i3;
  int get i3 => _i3 ?? 0;
  set i3(int? val) => _i3 = val;

  void incrementI3(int amount) => i3 = i3 + amount;

  bool hasI3() => _i3 != null;

  // "i4" field.
  int? _i4;
  int get i4 => _i4 ?? 0;
  set i4(int? val) => _i4 = val;

  void incrementI4(int amount) => i4 = i4 + amount;

  bool hasI4() => _i4 != null;

  // "i5" field.
  int? _i5;
  int get i5 => _i5 ?? 0;
  set i5(int? val) => _i5 = val;

  void incrementI5(int amount) => i5 = i5 + amount;

  bool hasI5() => _i5 != null;

  // "i6" field.
  int? _i6;
  int get i6 => _i6 ?? 0;
  set i6(int? val) => _i6 = val;

  void incrementI6(int amount) => i6 = i6 + amount;

  bool hasI6() => _i6 != null;

  // "i7" field.
  int? _i7;
  int get i7 => _i7 ?? 0;
  set i7(int? val) => _i7 = val;

  void incrementI7(int amount) => i7 = i7 + amount;

  bool hasI7() => _i7 != null;

  static DaysStruct fromMap(Map<String, dynamic> data) => DaysStruct(
        i1: castToType<int>(data['i1']),
        i2: castToType<int>(data['i2']),
        i3: castToType<int>(data['i3']),
        i4: castToType<int>(data['i4']),
        i5: castToType<int>(data['i5']),
        i6: castToType<int>(data['i6']),
        i7: castToType<int>(data['i7']),
      );

  static DaysStruct? maybeFromMap(dynamic data) =>
      data is Map ? DaysStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'i1': _i1,
        'i2': _i2,
        'i3': _i3,
        'i4': _i4,
        'i5': _i5,
        'i6': _i6,
        'i7': _i7,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'i1': serializeParam(
          _i1,
          ParamType.int,
        ),
        'i2': serializeParam(
          _i2,
          ParamType.int,
        ),
        'i3': serializeParam(
          _i3,
          ParamType.int,
        ),
        'i4': serializeParam(
          _i4,
          ParamType.int,
        ),
        'i5': serializeParam(
          _i5,
          ParamType.int,
        ),
        'i6': serializeParam(
          _i6,
          ParamType.int,
        ),
        'i7': serializeParam(
          _i7,
          ParamType.int,
        ),
      }.withoutNulls;

  static DaysStruct fromSerializableMap(Map<String, dynamic> data) =>
      DaysStruct(
        i1: deserializeParam(
          data['i1'],
          ParamType.int,
          false,
        ),
        i2: deserializeParam(
          data['i2'],
          ParamType.int,
          false,
        ),
        i3: deserializeParam(
          data['i3'],
          ParamType.int,
          false,
        ),
        i4: deserializeParam(
          data['i4'],
          ParamType.int,
          false,
        ),
        i5: deserializeParam(
          data['i5'],
          ParamType.int,
          false,
        ),
        i6: deserializeParam(
          data['i6'],
          ParamType.int,
          false,
        ),
        i7: deserializeParam(
          data['i7'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'DaysStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DaysStruct &&
        i1 == other.i1 &&
        i2 == other.i2 &&
        i3 == other.i3 &&
        i4 == other.i4 &&
        i5 == other.i5 &&
        i6 == other.i6 &&
        i7 == other.i7;
  }

  @override
  int get hashCode => const ListEquality().hash([i1, i2, i3, i4, i5, i6, i7]);
}

DaysStruct createDaysStruct({
  int? i1,
  int? i2,
  int? i3,
  int? i4,
  int? i5,
  int? i6,
  int? i7,
}) =>
    DaysStruct(
      i1: i1,
      i2: i2,
      i3: i3,
      i4: i4,
      i5: i5,
      i6: i6,
      i7: i7,
    );
