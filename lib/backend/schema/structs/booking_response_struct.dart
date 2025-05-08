// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookingResponseStruct extends BaseStruct {
  BookingResponseStruct({
    String? status,
    List<BookingItemStruct>? items,
  })  : _status = status,
        _items = items;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "items" field.
  List<BookingItemStruct>? _items;
  List<BookingItemStruct> get items => _items ?? const [];
  set items(List<BookingItemStruct>? val) => _items = val;

  void updateItems(Function(List<BookingItemStruct>) updateFn) {
    updateFn(_items ??= []);
  }

  bool hasItems() => _items != null;

  static BookingResponseStruct fromMap(Map<String, dynamic> data) =>
      BookingResponseStruct(
        status: data['status'] as String?,
        items: getStructList(
          data['items'],
          BookingItemStruct.fromMap,
        ),
      );

  static BookingResponseStruct? maybeFromMap(dynamic data) => data is Map
      ? BookingResponseStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'status': _status,
        'items': _items?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'items': serializeParam(
          _items,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static BookingResponseStruct fromSerializableMap(Map<String, dynamic> data) =>
      BookingResponseStruct(
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        items: deserializeStructParam<BookingItemStruct>(
          data['items'],
          ParamType.DataStruct,
          true,
          structBuilder: BookingItemStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'BookingResponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is BookingResponseStruct &&
        status == other.status &&
        listEquality.equals(items, other.items);
  }

  @override
  int get hashCode => const ListEquality().hash([status, items]);
}

BookingResponseStruct createBookingResponseStruct({
  String? status,
}) =>
    BookingResponseStruct(
      status: status,
    );
