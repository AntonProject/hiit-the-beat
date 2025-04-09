import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start activecampaign Group Code

class ActivecampaignGroup {
  static String getBaseUrl() => 'https://hiit-the-beat.api-us1.com';
  static Map<String, String> headers = {
    'Accept': 'application/json',
    'Content-type': 'application/json',
    'Api-Token':
        'fe003b0f5214b5cb584ba3d5c7b4cb4c9d59c8e9150d645c97cffc17a764bbadbf15a367',
  };
  static CreateContactCall createContactCall = CreateContactCall();
  static NewAppRegistrationENCall newAppRegistrationENCall =
      NewAppRegistrationENCall();
  static NewAppRegistrationDECall newAppRegistrationDECall =
      NewAppRegistrationDECall();
  static DeleteUserFromAutomationCall deleteUserFromAutomationCall =
      DeleteUserFromAutomationCall();
  static GetAllAutomationsByUserCall getAllAutomationsByUserCall =
      GetAllAutomationsByUserCall();
  static UpdateContactCall updateContactCall = UpdateContactCall();
}

class CreateContactCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? firstName = '',
  }) async {
    final baseUrl = ActivecampaignGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "contact": {
    "email": "${email}",
    "firstName": "${firstName}",
    "lastName": "<lastName>"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createContact',
      apiUrl: '${baseUrl}/api/3/contacts',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-type': 'application/json',
        'Api-Token':
            'fe003b0f5214b5cb584ba3d5c7b4cb4c9d59c8e9150d645c97cffc17a764bbadbf15a367',
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

  String? contatId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.contact.id''',
      ));
}

class NewAppRegistrationENCall {
  Future<ApiCallResponse> call({
    String? contactId = '',
  }) async {
    final baseUrl = ActivecampaignGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "contactAutomation": {
    "contact": "${contactId}",
    "automation": "45"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'New App Registration EN',
      apiUrl: '${baseUrl}/api/3/contactAutomations',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-type': 'application/json',
        'Api-Token':
            'fe003b0f5214b5cb584ba3d5c7b4cb4c9d59c8e9150d645c97cffc17a764bbadbf15a367',
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
}

class NewAppRegistrationDECall {
  Future<ApiCallResponse> call({
    String? contactId = '',
  }) async {
    final baseUrl = ActivecampaignGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "contactAutomation": {
    "contact": "${contactId}",
    "automation": "44"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'New App Registration DE',
      apiUrl: '${baseUrl}/api/3/contactAutomations',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-type': 'application/json',
        'Api-Token':
            'fe003b0f5214b5cb584ba3d5c7b4cb4c9d59c8e9150d645c97cffc17a764bbadbf15a367',
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
}

class DeleteUserFromAutomationCall {
  Future<ApiCallResponse> call({
    String? contactAutomationId = '',
  }) async {
    final baseUrl = ActivecampaignGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Delete user from automation',
      apiUrl: '${baseUrl}/api/3/contactAutomations/${contactAutomationId}',
      callType: ApiCallType.DELETE,
      headers: {
        'Accept': 'application/json',
        'Content-type': 'application/json',
        'Api-Token':
            'fe003b0f5214b5cb584ba3d5c7b4cb4c9d59c8e9150d645c97cffc17a764bbadbf15a367',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAllAutomationsByUserCall {
  Future<ApiCallResponse> call({
    String? contact = '',
  }) async {
    final baseUrl = ActivecampaignGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get all automations by user',
      apiUrl: '${baseUrl}/api/3/contacts/${contact}',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-type': 'application/json',
        'Api-Token':
            'fe003b0f5214b5cb584ba3d5c7b4cb4c9d59c8e9150d645c97cffc17a764bbadbf15a367',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? automationIds(dynamic response) => (getJsonField(
        response,
        r'''$.contactAutomations[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class UpdateContactCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? email = '',
    String? name = '',
    String? surname = '',
  }) async {
    final baseUrl = ActivecampaignGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "contact": {
    "email": "${escapeStringForJson(email)}",
    "firstName": "${escapeStringForJson(name)}",
    "lastName": "${escapeStringForJson(surname)}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateContact',
      apiUrl: '${baseUrl}/api/3/contacts/${id}',
      callType: ApiCallType.PUT,
      headers: {
        'Accept': 'application/json',
        'Content-type': 'application/json',
        'Api-Token':
            'fe003b0f5214b5cb584ba3d5c7b4cb4c9d59c8e9150d645c97cffc17a764bbadbf15a367',
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
}

/// End activecampaign Group Code

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
  if (item is DocumentReference) {
    return item.path;
  }
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
