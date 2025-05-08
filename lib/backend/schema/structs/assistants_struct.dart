// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AssistantsStruct extends BaseStruct {
  AssistantsStruct({
    int? id,
    String? name,
    String? email,
    String? phoneCountryCode,
    String? phone,
    String? description,
    String? imageUrl,
  })  : _id = id,
        _name = name,
        _email = email,
        _phoneCountryCode = phoneCountryCode,
        _phone = phone,
        _description = description,
        _imageUrl = imageUrl;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "phone_country_code" field.
  String? _phoneCountryCode;
  String get phoneCountryCode => _phoneCountryCode ?? '';
  set phoneCountryCode(String? val) => _phoneCountryCode = val;

  bool hasPhoneCountryCode() => _phoneCountryCode != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  set phone(String? val) => _phone = val;

  bool hasPhone() => _phone != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "image_url" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  set imageUrl(String? val) => _imageUrl = val;

  bool hasImageUrl() => _imageUrl != null;

  static AssistantsStruct fromMap(Map<String, dynamic> data) =>
      AssistantsStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        email: data['email'] as String?,
        phoneCountryCode: data['phone_country_code'] as String?,
        phone: data['phone'] as String?,
        description: data['description'] as String?,
        imageUrl: data['image_url'] as String?,
      );

  static AssistantsStruct? maybeFromMap(dynamic data) => data is Map
      ? AssistantsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'email': _email,
        'phone_country_code': _phoneCountryCode,
        'phone': _phone,
        'description': _description,
        'image_url': _imageUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'phone_country_code': serializeParam(
          _phoneCountryCode,
          ParamType.String,
        ),
        'phone': serializeParam(
          _phone,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'image_url': serializeParam(
          _imageUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static AssistantsStruct fromSerializableMap(Map<String, dynamic> data) =>
      AssistantsStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        phoneCountryCode: deserializeParam(
          data['phone_country_code'],
          ParamType.String,
          false,
        ),
        phone: deserializeParam(
          data['phone'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        imageUrl: deserializeParam(
          data['image_url'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AssistantsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AssistantsStruct &&
        id == other.id &&
        name == other.name &&
        email == other.email &&
        phoneCountryCode == other.phoneCountryCode &&
        phone == other.phone &&
        description == other.description &&
        imageUrl == other.imageUrl;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, name, email, phoneCountryCode, phone, description, imageUrl]);
}

AssistantsStruct createAssistantsStruct({
  int? id,
  String? name,
  String? email,
  String? phoneCountryCode,
  String? phone,
  String? description,
  String? imageUrl,
}) =>
    AssistantsStruct(
      id: id,
      name: name,
      email: email,
      phoneCountryCode: phoneCountryCode,
      phone: phone,
      description: description,
      imageUrl: imageUrl,
    );
