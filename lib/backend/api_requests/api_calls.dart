import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

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
  static AddUserToAutomationCall addUserToAutomationCall =
      AddUserToAutomationCall();
  static DeleteUserFromAutomationCall deleteUserFromAutomationCall =
      DeleteUserFromAutomationCall();
  static GetAllAutomationsByUserCall getAllAutomationsByUserCall =
      GetAllAutomationsByUserCall();
  static UpdateContactCall updateContactCall = UpdateContactCall();
  static GetAllTagsCall getAllTagsCall = GetAllTagsCall();
  static AddContactTagsCall addContactTagsCall = AddContactTagsCall();
  static GetContactTagsCall getContactTagsCall = GetContactTagsCall();
  static DeleteContactTagCall deleteContactTagCall = DeleteContactTagCall();
  static AddContactToListCall addContactToListCall = AddContactToListCall();
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

class AddUserToAutomationCall {
  Future<ApiCallResponse> call({
    String? contactId = '',
    String? automationId = '',
  }) async {
    final baseUrl = ActivecampaignGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "contactAutomation": {
    "contact": "${contactId}",
    "automation": "${automationId}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add user to automation',
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
      encodeBodyUtf8: true,
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
      decodeUtf8: true,
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
      decodeUtf8: true,
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

class GetAllTagsCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = ActivecampaignGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getAllTags',
      apiUrl: '${baseUrl}/api/3/tags',
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
}

class AddContactTagsCall {
  Future<ApiCallResponse> call({
    String? contactId = '',
    String? tagId = '',
  }) async {
    final baseUrl = ActivecampaignGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "contactTag": {
    "contact": "${escapeStringForJson(contactId)}",
    "tag": "${escapeStringForJson(tagId)}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addContactTags',
      apiUrl: '${baseUrl}/api/3/contactTags',
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

class GetContactTagsCall {
  Future<ApiCallResponse> call({
    String? contactId = '',
  }) async {
    final baseUrl = ActivecampaignGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getContactTags',
      apiUrl: '${baseUrl}/api/3/contacts/${contactId}/contactTags',
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

  List<ContactTagStruct>? contactTags(dynamic response) => (getJsonField(
        response,
        r'''$.contactTags''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => ContactTagStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
}

class DeleteContactTagCall {
  Future<ApiCallResponse> call({
    String? contactTagId = '',
  }) async {
    final baseUrl = ActivecampaignGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'deleteContactTag',
      apiUrl: '${baseUrl}/api/3/contactTags/${contactTagId}',
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

class AddContactToListCall {
  Future<ApiCallResponse> call({
    String? listId = '',
    String? contactId = '',
  }) async {
    final baseUrl = ActivecampaignGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "contactList": {
    "list": "${escapeStringForJson(listId)}",
    "contact": "${escapeStringForJson(contactId)}",
    "status": "1"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addContactToList',
      apiUrl: '${baseUrl}/api/3/contactLists',
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
