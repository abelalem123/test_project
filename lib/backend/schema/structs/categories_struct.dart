// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoriesStruct extends BaseStruct {
  CategoriesStruct({
    int? id,
    String? name,
    String? slug,
    String? description,
    int? parent,
    bool? image,
  })  : _id = id,
        _name = name,
        _slug = slug,
        _description = description,
        _parent = parent,
        _image = image;

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

  // "slug" field.
  String? _slug;
  String get slug => _slug ?? '';
  set slug(String? val) => _slug = val;

  bool hasSlug() => _slug != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "parent" field.
  int? _parent;
  int get parent => _parent ?? 0;
  set parent(int? val) => _parent = val;

  void incrementParent(int amount) => parent = parent + amount;

  bool hasParent() => _parent != null;

  // "image" field.
  bool? _image;
  bool get image => _image ?? false;
  set image(bool? val) => _image = val;

  bool hasImage() => _image != null;

  static CategoriesStruct fromMap(Map<String, dynamic> data) =>
      CategoriesStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        slug: data['slug'] as String?,
        description: data['description'] as String?,
        parent: castToType<int>(data['parent']),
        image: data['image'] as bool?,
      );

  static CategoriesStruct? maybeFromMap(dynamic data) => data is Map
      ? CategoriesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'slug': _slug,
        'description': _description,
        'parent': _parent,
        'image': _image,
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
        'slug': serializeParam(
          _slug,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'parent': serializeParam(
          _parent,
          ParamType.int,
        ),
        'image': serializeParam(
          _image,
          ParamType.bool,
        ),
      }.withoutNulls;

  static CategoriesStruct fromSerializableMap(Map<String, dynamic> data) =>
      CategoriesStruct(
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
        slug: deserializeParam(
          data['slug'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        parent: deserializeParam(
          data['parent'],
          ParamType.int,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'CategoriesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CategoriesStruct &&
        id == other.id &&
        name == other.name &&
        slug == other.slug &&
        description == other.description &&
        parent == other.parent &&
        image == other.image;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, name, slug, description, parent, image]);
}

CategoriesStruct createCategoriesStruct({
  int? id,
  String? name,
  String? slug,
  String? description,
  int? parent,
  bool? image,
}) =>
    CategoriesStruct(
      id: id,
      name: name,
      slug: slug,
      description: description,
      parent: parent,
      image: image,
    );
