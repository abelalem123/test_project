// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FromStruct extends BaseStruct {
  FromStruct({
    String? s0,
    String? s1,
  })  : _s0 = s0,
        _s1 = s1;

  // "s0" field.
  String? _s0;
  String get s0 => _s0 ?? '';
  set s0(String? val) => _s0 = val;

  bool hasS0() => _s0 != null;

  // "s1" field.
  String? _s1;
  String get s1 => _s1 ?? '';
  set s1(String? val) => _s1 = val;

  bool hasS1() => _s1 != null;

  static FromStruct fromMap(Map<String, dynamic> data) => FromStruct(
        s0: data['s0'] as String?,
        s1: data['s1'] as String?,
      );

  static FromStruct? maybeFromMap(dynamic data) =>
      data is Map ? FromStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        's0': _s0,
        's1': _s1,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        's0': serializeParam(
          _s0,
          ParamType.String,
        ),
        's1': serializeParam(
          _s1,
          ParamType.String,
        ),
      }.withoutNulls;

  static FromStruct fromSerializableMap(Map<String, dynamic> data) =>
      FromStruct(
        s0: deserializeParam(
          data['s0'],
          ParamType.String,
          false,
        ),
        s1: deserializeParam(
          data['s1'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FromStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FromStruct && s0 == other.s0 && s1 == other.s1;
  }

  @override
  int get hashCode => const ListEquality().hash([s0, s1]);
}

FromStruct createFromStruct({
  String? s0,
  String? s1,
}) =>
    FromStruct(
      s0: s0,
      s1: s1,
    );
