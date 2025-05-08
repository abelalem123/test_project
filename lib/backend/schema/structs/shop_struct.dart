// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShopStruct extends BaseStruct {
  ShopStruct({
    String? id,
    String? title,
  })  : _id = id,
        _title = title;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  static ShopStruct fromMap(Map<String, dynamic> data) => ShopStruct(
        id: data['id'] as String?,
        title: data['title'] as String?,
      );

  static ShopStruct? maybeFromMap(dynamic data) =>
      data is Map ? ShopStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'title': _title,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
      }.withoutNulls;

  static ShopStruct fromSerializableMap(Map<String, dynamic> data) =>
      ShopStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ShopStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ShopStruct && id == other.id && title == other.title;
  }

  @override
  int get hashCode => const ListEquality().hash([id, title]);
}

ShopStruct createShopStruct({
  String? id,
  String? title,
}) =>
    ShopStruct(
      id: id,
      title: title,
    );
