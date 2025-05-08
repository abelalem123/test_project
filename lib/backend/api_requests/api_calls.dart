import 'dart:convert';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class LoginCommonSalonBookingAPICall {
  static Future<ApiCallResponse> call({
    String? websiteURL = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'loginCommonSalonBookingAPI',
      apiUrl: 'https://Quickwashsthlm.se/wp-json/salon/api/v1/login',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'name': "Aspio",
        'password': "ty6NHg-@8eQ-u-G3UAfR",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class BookingsCommonSalonBookingAPICall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    int? hours,
    String? startDate = '',
    String? endDate = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'BookingsCommonSalonBookingAPI ',
      apiUrl: 'https://Quickwashsthlm.se/wp-json/salon/api/v1/bookings/',
      callType: ApiCallType.GET,
      headers: {
        'Access-Token': '${authToken}',
      },
      params: {
        'hours': hours,
        'start_date': startDate,
        'end_date': endDate,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<BookingItemStruct>? items(dynamic response) => (getJsonField(
        response,
        r'''$.items''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => BookingItemStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
}

class BookingsMobileSalonBookingAPICall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    int? hours,
    String? startDate = '',
    String? endDate = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'BookingsMobileSalonBookingAPI ',
      apiUrl: 'https://Quickwashsthlm.se/wp-json/salon/api/mobile/v1/bookings/',
      callType: ApiCallType.GET,
      headers: {
        'Access-Token': '${authToken}',
      },
      params: {
        'hours': hours,
        'start_date': startDate,
        'end_date': endDate,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<BookingItemStruct>? items(dynamic response) => (getJsonField(
        response,
        r'''$.items''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => BookingItemStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
}

class BookingsCommonSalonBookingAPICopyCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    int? hours,
    String? startDate = '',
    String? endDate = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'BookingsCommonSalonBookingAPI  Copy',
      apiUrl: 'https://bokningsminuten-410ae.ey.r.appspot.com/bookings',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'start_date': startDate,
        'end_date': endDate,
        'authToken': authToken,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<BookingItemStruct>? items(dynamic response) => (getJsonField(
        response,
        r'''$.items''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => BookingItemStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
}

class BookingsCommonassistantsAPICall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    int? hours,
    String? startDate = '',
    String? endDate = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'BookingsCommonassistantsAPI ',
      apiUrl: 'https://bokningsminuten-410ae.ey.r.appspot.com/assistants',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'authToken': authToken,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<BookingItemStruct>? items(dynamic response) => (getJsonField(
        response,
        r'''$.items''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => BookingItemStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
}

class ServicesCall {
  static Future<ApiCallResponse> call({
    String? authToken = '8341e0d40a688dc78f83c95b4675e105759d50f9',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'services',
      apiUrl: 'https://demo.aspio.io/wp-json/salon/api/v1/services',
      callType: ApiCallType.GET,
      headers: {
        'Access-Token': '${authToken}',
      },
      params: {
        'auth_token': authToken,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<ServiceModelStruct>? servicemodel(dynamic response) =>
      (getJsonField(
        response,
        r'''$.items''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => ServiceModelStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
}

class AvailabilitybookingdateCall {
  static Future<ApiCallResponse> call({
    String? authToken = '8341e0d40a688dc78f83c95b4675e105759d50f9',
    String? date = '',
    String? time = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'availabilitybookingdate',
      apiUrl:
          'https://demo.aspio.io/wp-json/salon/api/v1/availability/booking/date',
      callType: ApiCallType.GET,
      headers: {
        'Access-Token': '${authToken}',
      },
      params: {
        'auth_token': authToken,
        'date': date,
        'time': time,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic workTimes(dynamic response) => getJsonField(
        response,
        r'''$.intervals.times''',
      );
}

class AvailabilityintervalsCopyCall {
  static Future<ApiCallResponse> call({
    String? authToken = '8341e0d40a688dc78f83c95b4675e105759d50f9',
    String? date = '',
    String? time = '',
  }) async {
    final ffApiRequestBody = '''
{
  "date": "2025-05-05" 
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'availabilityintervals Copy',
      apiUrl:
          'https://demo.aspio.io/wp-json/salon/api/v1/availability/intervals',
      callType: ApiCallType.POST,
      headers: {
        'Access-Token': '${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<ServiceModelStruct>? servicemodel(dynamic response) =>
      (getJsonField(
        response,
        r'''$.items''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => ServiceModelStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
}

class AvailabilityservicesprimaryCall {
  static Future<ApiCallResponse> call({
    String? authToken = '8341e0d40a688dc78f83c95b4675e105759d50f9',
    String? date = '',
  }) async {
    final ffApiRequestBody = '''
{
  "date": "2025-05-05" 
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'availabilityservicesprimary',
      apiUrl:
          'https://demo.aspio.io/wp-json/salon/api/v1/availability/services/primary',
      callType: ApiCallType.POST,
      headers: {
        'Access-Token': '${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<ServiceModelStruct>? servicemodel(dynamic response) =>
      (getJsonField(
        response,
        r'''$.items''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => ServiceModelStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
}

class AvailabilitybookingassistantsCall {
  static Future<ApiCallResponse> call({
    String? authToken = '8341e0d40a688dc78f83c95b4675e105759d50f9',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'availabilitybookingassistants',
      apiUrl:
          'https://demo.aspio.io/wp-json/salon/api/v1/availability/booking/assistants',
      callType: ApiCallType.GET,
      headers: {
        'Access-Token': '${authToken}',
      },
      params: {
        'auth_token': authToken,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<ServiceModelStruct>? servicemodel(dynamic response) =>
      (getJsonField(
        response,
        r'''$.items''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => ServiceModelStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
}

class AssistantsCall {
  static Future<ApiCallResponse> call({
    String? authToken = '8341e0d40a688dc78f83c95b4675e105759d50f9',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'assistants',
      apiUrl: 'https://demo.aspio.io/wp-json/salon/api/v1/assistants',
      callType: ApiCallType.GET,
      headers: {
        'Access-Token': '${authToken}',
      },
      params: {
        'auth_token': authToken,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<AssistantsStruct>? assistantmodel(dynamic response) =>
      (getJsonField(
        response,
        r'''$.items''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => AssistantsStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
}

class ServicescategoriesCall {
  static Future<ApiCallResponse> call({
    String? authToken = '8341e0d40a688dc78f83c95b4675e105759d50f9',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'servicescategories',
      apiUrl: 'https://demo.aspio.io/wp-json/salon/api/v1/services/categories',
      callType: ApiCallType.GET,
      headers: {
        'Access-Token': '${authToken}',
      },
      params: {
        'auth_token': authToken,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<CategoriesStruct>? categoriesmodel(dynamic response) =>
      (getJsonField(
        response,
        r'''$.items''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => CategoriesStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
}

class ServicesByCategoriesIdCall {
  static Future<ApiCallResponse> call({
    String? authToken = '8341e0d40a688dc78f83c95b4675e105759d50f9',
    String? id = '19',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'services by categories id',
      apiUrl:
          'https://demo.aspio.io/wp-json/salon/api/v1/services/categories/908',
      callType: ApiCallType.GET,
      headers: {
        'Access-Token': '${authToken}',
      },
      params: {
        'auth_token': authToken,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
