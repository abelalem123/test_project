// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServiceStruct extends BaseStruct {
  ServiceStruct({
    String? startAt,
    String? endAt,
    int? serviceId,
    int? assistantId,
    String? assistantName,
  })  : _startAt = startAt,
        _endAt = endAt,
        _serviceId = serviceId,
        _assistantId = assistantId,
        _assistantName = assistantName;

  // "startAt" field.
  String? _startAt;
  String get startAt => _startAt ?? '';
  set startAt(String? val) => _startAt = val;

  bool hasStartAt() => _startAt != null;

  // "endAt" field.
  String? _endAt;
  String get endAt => _endAt ?? '';
  set endAt(String? val) => _endAt = val;

  bool hasEndAt() => _endAt != null;

  // "serviceId" field.
  int? _serviceId;
  int get serviceId => _serviceId ?? 0;
  set serviceId(int? val) => _serviceId = val;

  void incrementServiceId(int amount) => serviceId = serviceId + amount;

  bool hasServiceId() => _serviceId != null;

  // "assistantId" field.
  int? _assistantId;
  int get assistantId => _assistantId ?? 0;
  set assistantId(int? val) => _assistantId = val;

  void incrementAssistantId(int amount) => assistantId = assistantId + amount;

  bool hasAssistantId() => _assistantId != null;

  // "assistantName" field.
  String? _assistantName;
  String get assistantName => _assistantName ?? '';
  set assistantName(String? val) => _assistantName = val;

  bool hasAssistantName() => _assistantName != null;

  static ServiceStruct fromMap(Map<String, dynamic> data) => ServiceStruct(
        startAt: data['startAt'] as String?,
        endAt: data['endAt'] as String?,
        serviceId: castToType<int>(data['serviceId']),
        assistantId: castToType<int>(data['assistantId']),
        assistantName: data['assistantName'] as String?,
      );

  static ServiceStruct? maybeFromMap(dynamic data) =>
      data is Map ? ServiceStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'startAt': _startAt,
        'endAt': _endAt,
        'serviceId': _serviceId,
        'assistantId': _assistantId,
        'assistantName': _assistantName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'startAt': serializeParam(
          _startAt,
          ParamType.String,
        ),
        'endAt': serializeParam(
          _endAt,
          ParamType.String,
        ),
        'serviceId': serializeParam(
          _serviceId,
          ParamType.int,
        ),
        'assistantId': serializeParam(
          _assistantId,
          ParamType.int,
        ),
        'assistantName': serializeParam(
          _assistantName,
          ParamType.String,
        ),
      }.withoutNulls;

  static ServiceStruct fromSerializableMap(Map<String, dynamic> data) =>
      ServiceStruct(
        startAt: deserializeParam(
          data['startAt'],
          ParamType.String,
          false,
        ),
        endAt: deserializeParam(
          data['endAt'],
          ParamType.String,
          false,
        ),
        serviceId: deserializeParam(
          data['serviceId'],
          ParamType.int,
          false,
        ),
        assistantId: deserializeParam(
          data['assistantId'],
          ParamType.int,
          false,
        ),
        assistantName: deserializeParam(
          data['assistantName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ServiceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ServiceStruct &&
        startAt == other.startAt &&
        endAt == other.endAt &&
        serviceId == other.serviceId &&
        assistantId == other.assistantId &&
        assistantName == other.assistantName;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([startAt, endAt, serviceId, assistantId, assistantName]);
}

ServiceStruct createServiceStruct({
  String? startAt,
  String? endAt,
  int? serviceId,
  int? assistantId,
  String? assistantName,
}) =>
    ServiceStruct(
      startAt: startAt,
      endAt: endAt,
      serviceId: serviceId,
      assistantId: assistantId,
      assistantName: assistantName,
    );
