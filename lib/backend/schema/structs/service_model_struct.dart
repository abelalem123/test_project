// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServiceModelStruct extends BaseStruct {
  ServiceModelStruct({
    int? id,
    String? name,
    double? price,
    String? currency,
    int? unit,
    String? duration,
    String? description,
    List<int>? categories,
    bool? isselected,
    int? secondary,
  })  : _id = id,
        _name = name,
        _price = price,
        _currency = currency,
        _unit = unit,
        _duration = duration,
        _description = description,
        _categories = categories,
        _isselected = isselected,
        _secondary = secondary;

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

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;

  void incrementPrice(double amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "currency" field.
  String? _currency;
  String get currency => _currency ?? '';
  set currency(String? val) => _currency = val;

  bool hasCurrency() => _currency != null;

  // "unit" field.
  int? _unit;
  int get unit => _unit ?? 0;
  set unit(int? val) => _unit = val;

  void incrementUnit(int amount) => unit = unit + amount;

  bool hasUnit() => _unit != null;

  // "duration" field.
  String? _duration;
  String get duration => _duration ?? '';
  set duration(String? val) => _duration = val;

  bool hasDuration() => _duration != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "categories" field.
  List<int>? _categories;
  List<int> get categories => _categories ?? const [];
  set categories(List<int>? val) => _categories = val;

  void updateCategories(Function(List<int>) updateFn) {
    updateFn(_categories ??= []);
  }

  bool hasCategories() => _categories != null;

  // "isselected" field.
  bool? _isselected;
  bool get isselected => _isselected ?? false;
  set isselected(bool? val) => _isselected = val;

  bool hasIsselected() => _isselected != null;

  // "secondary" field.
  int? _secondary;
  int get secondary => _secondary ?? 0;
  set secondary(int? val) => _secondary = val;

  void incrementSecondary(int amount) => secondary = secondary + amount;

  bool hasSecondary() => _secondary != null;

  static ServiceModelStruct fromMap(Map<String, dynamic> data) =>
      ServiceModelStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        price: castToType<double>(data['price']),
        currency: data['currency'] as String?,
        unit: castToType<int>(data['unit']),
        duration: data['duration'] as String?,
        description: data['description'] as String?,
        categories: getDataList(data['categories']),
        isselected: data['isselected'] as bool?,
        secondary: castToType<int>(data['secondary']),
      );

  static ServiceModelStruct? maybeFromMap(dynamic data) => data is Map
      ? ServiceModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'price': _price,
        'currency': _currency,
        'unit': _unit,
        'duration': _duration,
        'description': _description,
        'categories': _categories,
        'isselected': _isselected,
        'secondary': _secondary,
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
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'currency': serializeParam(
          _currency,
          ParamType.String,
        ),
        'unit': serializeParam(
          _unit,
          ParamType.int,
        ),
        'duration': serializeParam(
          _duration,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'categories': serializeParam(
          _categories,
          ParamType.int,
          isList: true,
        ),
        'isselected': serializeParam(
          _isselected,
          ParamType.bool,
        ),
        'secondary': serializeParam(
          _secondary,
          ParamType.int,
        ),
      }.withoutNulls;

  static ServiceModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      ServiceModelStruct(
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
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
        currency: deserializeParam(
          data['currency'],
          ParamType.String,
          false,
        ),
        unit: deserializeParam(
          data['unit'],
          ParamType.int,
          false,
        ),
        duration: deserializeParam(
          data['duration'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        categories: deserializeParam<int>(
          data['categories'],
          ParamType.int,
          true,
        ),
        isselected: deserializeParam(
          data['isselected'],
          ParamType.bool,
          false,
        ),
        secondary: deserializeParam(
          data['secondary'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ServiceModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ServiceModelStruct &&
        id == other.id &&
        name == other.name &&
        price == other.price &&
        currency == other.currency &&
        unit == other.unit &&
        duration == other.duration &&
        description == other.description &&
        listEquality.equals(categories, other.categories) &&
        isselected == other.isselected &&
        secondary == other.secondary;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        name,
        price,
        currency,
        unit,
        duration,
        description,
        categories,
        isselected,
        secondary
      ]);
}

ServiceModelStruct createServiceModelStruct({
  int? id,
  String? name,
  double? price,
  String? currency,
  int? unit,
  String? duration,
  String? description,
  bool? isselected,
  int? secondary,
}) =>
    ServiceModelStruct(
      id: id,
      name: name,
      price: price,
      currency: currency,
      unit: unit,
      duration: duration,
      description: description,
      isselected: isselected,
      secondary: secondary,
    );
