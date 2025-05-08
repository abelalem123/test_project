// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookingItemStruct extends BaseStruct {
  BookingItemStruct({
    String? id,
    int? created,
    String? date,
    String? time,
    String? status,
    String? customerId,
    String? customerFirstName,
    String? customerLastName,
    String? customerEmail,
    String? customerPhoneCountryCode,
    String? customerPhone,
    String? customerAddress,
    String? customerOneSignalPlayerId,
    List<ServiceStruct>? services,
    ShopStruct? shop,
    String? note,
    String? transactionId,
    String? currency,
    int? deposit,
    int? amount,
    String? duration,
    List<int>? discounts,
  })  : _id = id,
        _created = created,
        _date = date,
        _time = time,
        _status = status,
        _customerId = customerId,
        _customerFirstName = customerFirstName,
        _customerLastName = customerLastName,
        _customerEmail = customerEmail,
        _customerPhoneCountryCode = customerPhoneCountryCode,
        _customerPhone = customerPhone,
        _customerAddress = customerAddress,
        _customerOneSignalPlayerId = customerOneSignalPlayerId,
        _services = services,
        _shop = shop,
        _note = note,
        _transactionId = transactionId,
        _currency = currency,
        _deposit = deposit,
        _amount = amount,
        _duration = duration,
        _discounts = discounts;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "created" field.
  int? _created;
  int get created => _created ?? 0;
  set created(int? val) => _created = val;

  void incrementCreated(int amount) => created = created + amount;

  bool hasCreated() => _created != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  set date(String? val) => _date = val;

  bool hasDate() => _date != null;

  // "time" field.
  String? _time;
  String get time => _time ?? '';
  set time(String? val) => _time = val;

  bool hasTime() => _time != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "customerId" field.
  String? _customerId;
  String get customerId => _customerId ?? '';
  set customerId(String? val) => _customerId = val;

  bool hasCustomerId() => _customerId != null;

  // "customerFirstName" field.
  String? _customerFirstName;
  String get customerFirstName => _customerFirstName ?? '';
  set customerFirstName(String? val) => _customerFirstName = val;

  bool hasCustomerFirstName() => _customerFirstName != null;

  // "customerLastName" field.
  String? _customerLastName;
  String get customerLastName => _customerLastName ?? '';
  set customerLastName(String? val) => _customerLastName = val;

  bool hasCustomerLastName() => _customerLastName != null;

  // "customerEmail" field.
  String? _customerEmail;
  String get customerEmail => _customerEmail ?? '';
  set customerEmail(String? val) => _customerEmail = val;

  bool hasCustomerEmail() => _customerEmail != null;

  // "customerPhoneCountryCode" field.
  String? _customerPhoneCountryCode;
  String get customerPhoneCountryCode => _customerPhoneCountryCode ?? '';
  set customerPhoneCountryCode(String? val) => _customerPhoneCountryCode = val;

  bool hasCustomerPhoneCountryCode() => _customerPhoneCountryCode != null;

  // "customerPhone" field.
  String? _customerPhone;
  String get customerPhone => _customerPhone ?? '';
  set customerPhone(String? val) => _customerPhone = val;

  bool hasCustomerPhone() => _customerPhone != null;

  // "customerAddress" field.
  String? _customerAddress;
  String get customerAddress => _customerAddress ?? '';
  set customerAddress(String? val) => _customerAddress = val;

  bool hasCustomerAddress() => _customerAddress != null;

  // "customerOneSignalPlayerId" field.
  String? _customerOneSignalPlayerId;
  String get customerOneSignalPlayerId => _customerOneSignalPlayerId ?? '';
  set customerOneSignalPlayerId(String? val) =>
      _customerOneSignalPlayerId = val;

  bool hasCustomerOneSignalPlayerId() => _customerOneSignalPlayerId != null;

  // "services" field.
  List<ServiceStruct>? _services;
  List<ServiceStruct> get services => _services ?? const [];
  set services(List<ServiceStruct>? val) => _services = val;

  void updateServices(Function(List<ServiceStruct>) updateFn) {
    updateFn(_services ??= []);
  }

  bool hasServices() => _services != null;

  // "shop" field.
  ShopStruct? _shop;
  ShopStruct get shop => _shop ?? ShopStruct();
  set shop(ShopStruct? val) => _shop = val;

  void updateShop(Function(ShopStruct) updateFn) {
    updateFn(_shop ??= ShopStruct());
  }

  bool hasShop() => _shop != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  set note(String? val) => _note = val;

  bool hasNote() => _note != null;

  // "transactionId" field.
  String? _transactionId;
  String get transactionId => _transactionId ?? '';
  set transactionId(String? val) => _transactionId = val;

  bool hasTransactionId() => _transactionId != null;

  // "currency" field.
  String? _currency;
  String get currency => _currency ?? '';
  set currency(String? val) => _currency = val;

  bool hasCurrency() => _currency != null;

  // "deposit" field.
  int? _deposit;
  int get deposit => _deposit ?? 0;
  set deposit(int? val) => _deposit = val;

  void incrementDeposit(int amount) => deposit = deposit + amount;

  bool hasDeposit() => _deposit != null;

  // "amount" field.
  int? _amount;
  int get amount => _amount ?? 0;
  set amount(int? val) => _amount = val;

  void incrementAmount(int amount) => amount = amount + amount;

  bool hasAmount() => _amount != null;

  // "duration" field.
  String? _duration;
  String get duration => _duration ?? '';
  set duration(String? val) => _duration = val;

  bool hasDuration() => _duration != null;

  // "discounts" field.
  List<int>? _discounts;
  List<int> get discounts => _discounts ?? const [];
  set discounts(List<int>? val) => _discounts = val;

  void updateDiscounts(Function(List<int>) updateFn) {
    updateFn(_discounts ??= []);
  }

  bool hasDiscounts() => _discounts != null;

  static BookingItemStruct fromMap(Map<String, dynamic> data) =>
      BookingItemStruct(
        id: data['id'] as String?,
        created: castToType<int>(data['created']),
        date: data['date'] as String?,
        time: data['time'] as String?,
        status: data['status'] as String?,
        customerId: data['customerId'] as String?,
        customerFirstName: data['customerFirstName'] as String?,
        customerLastName: data['customerLastName'] as String?,
        customerEmail: data['customerEmail'] as String?,
        customerPhoneCountryCode: data['customerPhoneCountryCode'] as String?,
        customerPhone: data['customerPhone'] as String?,
        customerAddress: data['customerAddress'] as String?,
        customerOneSignalPlayerId: data['customerOneSignalPlayerId'] as String?,
        services: getStructList(
          data['services'],
          ServiceStruct.fromMap,
        ),
        shop: data['shop'] is ShopStruct
            ? data['shop']
            : ShopStruct.maybeFromMap(data['shop']),
        note: data['note'] as String?,
        transactionId: data['transactionId'] as String?,
        currency: data['currency'] as String?,
        deposit: castToType<int>(data['deposit']),
        amount: castToType<int>(data['amount']),
        duration: data['duration'] as String?,
        discounts: getDataList(data['discounts']),
      );

  static BookingItemStruct? maybeFromMap(dynamic data) => data is Map
      ? BookingItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'created': _created,
        'date': _date,
        'time': _time,
        'status': _status,
        'customerId': _customerId,
        'customerFirstName': _customerFirstName,
        'customerLastName': _customerLastName,
        'customerEmail': _customerEmail,
        'customerPhoneCountryCode': _customerPhoneCountryCode,
        'customerPhone': _customerPhone,
        'customerAddress': _customerAddress,
        'customerOneSignalPlayerId': _customerOneSignalPlayerId,
        'services': _services?.map((e) => e.toMap()).toList(),
        'shop': _shop?.toMap(),
        'note': _note,
        'transactionId': _transactionId,
        'currency': _currency,
        'deposit': _deposit,
        'amount': _amount,
        'duration': _duration,
        'discounts': _discounts,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'created': serializeParam(
          _created,
          ParamType.int,
        ),
        'date': serializeParam(
          _date,
          ParamType.String,
        ),
        'time': serializeParam(
          _time,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'customerId': serializeParam(
          _customerId,
          ParamType.String,
        ),
        'customerFirstName': serializeParam(
          _customerFirstName,
          ParamType.String,
        ),
        'customerLastName': serializeParam(
          _customerLastName,
          ParamType.String,
        ),
        'customerEmail': serializeParam(
          _customerEmail,
          ParamType.String,
        ),
        'customerPhoneCountryCode': serializeParam(
          _customerPhoneCountryCode,
          ParamType.String,
        ),
        'customerPhone': serializeParam(
          _customerPhone,
          ParamType.String,
        ),
        'customerAddress': serializeParam(
          _customerAddress,
          ParamType.String,
        ),
        'customerOneSignalPlayerId': serializeParam(
          _customerOneSignalPlayerId,
          ParamType.String,
        ),
        'services': serializeParam(
          _services,
          ParamType.DataStruct,
          isList: true,
        ),
        'shop': serializeParam(
          _shop,
          ParamType.DataStruct,
        ),
        'note': serializeParam(
          _note,
          ParamType.String,
        ),
        'transactionId': serializeParam(
          _transactionId,
          ParamType.String,
        ),
        'currency': serializeParam(
          _currency,
          ParamType.String,
        ),
        'deposit': serializeParam(
          _deposit,
          ParamType.int,
        ),
        'amount': serializeParam(
          _amount,
          ParamType.int,
        ),
        'duration': serializeParam(
          _duration,
          ParamType.String,
        ),
        'discounts': serializeParam(
          _discounts,
          ParamType.int,
          isList: true,
        ),
      }.withoutNulls;

  static BookingItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      BookingItemStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        created: deserializeParam(
          data['created'],
          ParamType.int,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.String,
          false,
        ),
        time: deserializeParam(
          data['time'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        customerId: deserializeParam(
          data['customerId'],
          ParamType.String,
          false,
        ),
        customerFirstName: deserializeParam(
          data['customerFirstName'],
          ParamType.String,
          false,
        ),
        customerLastName: deserializeParam(
          data['customerLastName'],
          ParamType.String,
          false,
        ),
        customerEmail: deserializeParam(
          data['customerEmail'],
          ParamType.String,
          false,
        ),
        customerPhoneCountryCode: deserializeParam(
          data['customerPhoneCountryCode'],
          ParamType.String,
          false,
        ),
        customerPhone: deserializeParam(
          data['customerPhone'],
          ParamType.String,
          false,
        ),
        customerAddress: deserializeParam(
          data['customerAddress'],
          ParamType.String,
          false,
        ),
        customerOneSignalPlayerId: deserializeParam(
          data['customerOneSignalPlayerId'],
          ParamType.String,
          false,
        ),
        services: deserializeStructParam<ServiceStruct>(
          data['services'],
          ParamType.DataStruct,
          true,
          structBuilder: ServiceStruct.fromSerializableMap,
        ),
        shop: deserializeStructParam(
          data['shop'],
          ParamType.DataStruct,
          false,
          structBuilder: ShopStruct.fromSerializableMap,
        ),
        note: deserializeParam(
          data['note'],
          ParamType.String,
          false,
        ),
        transactionId: deserializeParam(
          data['transactionId'],
          ParamType.String,
          false,
        ),
        currency: deserializeParam(
          data['currency'],
          ParamType.String,
          false,
        ),
        deposit: deserializeParam(
          data['deposit'],
          ParamType.int,
          false,
        ),
        amount: deserializeParam(
          data['amount'],
          ParamType.int,
          false,
        ),
        duration: deserializeParam(
          data['duration'],
          ParamType.String,
          false,
        ),
        discounts: deserializeParam<int>(
          data['discounts'],
          ParamType.int,
          true,
        ),
      );

  @override
  String toString() => 'BookingItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is BookingItemStruct &&
        id == other.id &&
        created == other.created &&
        date == other.date &&
        time == other.time &&
        status == other.status &&
        customerId == other.customerId &&
        customerFirstName == other.customerFirstName &&
        customerLastName == other.customerLastName &&
        customerEmail == other.customerEmail &&
        customerPhoneCountryCode == other.customerPhoneCountryCode &&
        customerPhone == other.customerPhone &&
        customerAddress == other.customerAddress &&
        customerOneSignalPlayerId == other.customerOneSignalPlayerId &&
        listEquality.equals(services, other.services) &&
        shop == other.shop &&
        note == other.note &&
        transactionId == other.transactionId &&
        currency == other.currency &&
        deposit == other.deposit &&
        amount == other.amount &&
        duration == other.duration &&
        listEquality.equals(discounts, other.discounts);
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        created,
        date,
        time,
        status,
        customerId,
        customerFirstName,
        customerLastName,
        customerEmail,
        customerPhoneCountryCode,
        customerPhone,
        customerAddress,
        customerOneSignalPlayerId,
        services,
        shop,
        note,
        transactionId,
        currency,
        deposit,
        amount,
        duration,
        discounts
      ]);
}

BookingItemStruct createBookingItemStruct({
  String? id,
  int? created,
  String? date,
  String? time,
  String? status,
  String? customerId,
  String? customerFirstName,
  String? customerLastName,
  String? customerEmail,
  String? customerPhoneCountryCode,
  String? customerPhone,
  String? customerAddress,
  String? customerOneSignalPlayerId,
  ShopStruct? shop,
  String? note,
  String? transactionId,
  String? currency,
  int? deposit,
  int? amount,
  String? duration,
}) =>
    BookingItemStruct(
      id: id,
      created: created,
      date: date,
      time: time,
      status: status,
      customerId: customerId,
      customerFirstName: customerFirstName,
      customerLastName: customerLastName,
      customerEmail: customerEmail,
      customerPhoneCountryCode: customerPhoneCountryCode,
      customerPhone: customerPhone,
      customerAddress: customerAddress,
      customerOneSignalPlayerId: customerOneSignalPlayerId,
      shop: shop ?? ShopStruct(),
      note: note,
      transactionId: transactionId,
      currency: currency,
      deposit: deposit,
      amount: amount,
      duration: duration,
    );
