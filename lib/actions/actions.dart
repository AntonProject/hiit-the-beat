import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';

Future signUpActiveCampgain(BuildContext context) async {
  ApiCallResponse? apiResult1ew;
  ApiCallResponse? apiResult1e24;
  ApiCallResponse? apiResult3lc;
  ApiCallResponse? apiResult1e1;
  ApiCallResponse? apiResult1e2;

  if (valueOrDefault(currentUserDocument?.activeCampgainContactId, '') != '') {
    if (FFLocalizations.of(context).languageCode == 'en') {
      apiResult1ew = await ActivecampaignGroup.newAppRegistrationENCall.call(
        contactId:
            valueOrDefault(currentUserDocument?.activeCampgainContactId, ''),
      );
    } else {
      apiResult1e24 = await ActivecampaignGroup.newAppRegistrationDECall.call(
        contactId:
            valueOrDefault(currentUserDocument?.activeCampgainContactId, ''),
      );
    }

    return;
  } else {
    apiResult3lc = await ActivecampaignGroup.createContactCall.call(
      email: currentUserEmail,
      firstName: currentUserDisplayName,
    );

    await currentUserReference!.update(createUsersRecordData(
      activeCampgainContactId: ActivecampaignGroup.createContactCall.contatId(
        (apiResult3lc.jsonBody ?? ''),
      ),
    ));
    if (FFLocalizations.of(context).languageCode == 'en') {
      apiResult1e1 = await ActivecampaignGroup.newAppRegistrationENCall.call(
        contactId:
            valueOrDefault(currentUserDocument?.activeCampgainContactId, ''),
      );
    } else {
      apiResult1e2 = await ActivecampaignGroup.newAppRegistrationDECall.call(
        contactId:
            valueOrDefault(currentUserDocument?.activeCampgainContactId, ''),
      );
    }

    return;
  }
}

Future removeAllActiveCampaignSubscriptions(
  BuildContext context, {
  required String? id,
}) async {
  ApiCallResponse? apiResulttb2;
  ApiCallResponse? apiResultzgl;

  apiResulttb2 = await ActivecampaignGroup.getAllAutomationsByUserCall.call(
    contact: id,
  );

  while (ActivecampaignGroup.getAllAutomationsByUserCall
          .automationIds(
            (apiResulttb2.jsonBody ?? ''),
          )!
          .length >
      FFAppState().subscriptionLooop) {
    apiResultzgl = await ActivecampaignGroup.deleteUserFromAutomationCall.call(
      contactAutomationId: ActivecampaignGroup.getAllAutomationsByUserCall
          .automationIds(
            (apiResulttb2.jsonBody ?? ''),
          )
          ?.elementAtOrNull(FFAppState().subscriptionLooop),
    );

    FFAppState().subscriptionLooop = FFAppState().subscriptionLooop + 1;
  }
  FFAppState().subscriptionLooop = 0;
}

Future checkSignupActiveCampaign(BuildContext context) async {
  ApiCallResponse? contactsAutomations;
  ApiCallResponse? apiResult1ew;
  ApiCallResponse? contactsAutomations2;
  ApiCallResponse? apiResult1ew2;
  ApiCallResponse? apiResult3lc;
  ApiCallResponse? apiResult1e1;
  ApiCallResponse? apiResult1e2;

  if (valueOrDefault(currentUserDocument?.activeCampgainContactId, '') != '') {
    if (FFLocalizations.of(context).languageCode == 'en') {
      contactsAutomations =
          await ActivecampaignGroup.getAllAutomationsByUserCall.call(
        contact:
            valueOrDefault(currentUserDocument?.activeCampgainContactId, ''),
      );

      if (functions.hasAutomationSeries(
          getJsonField(
            (contactsAutomations.jsonBody ?? ''),
            r'''$''',
          ),
          '45')) {
        return;
      }

      apiResult1ew = await ActivecampaignGroup.newAppRegistrationENCall.call(
        contactId:
            valueOrDefault(currentUserDocument?.activeCampgainContactId, ''),
      );

      return;
    } else {
      contactsAutomations2 =
          await ActivecampaignGroup.getAllAutomationsByUserCall.call(
        contact:
            valueOrDefault(currentUserDocument?.activeCampgainContactId, ''),
      );

      if (functions.hasAutomationSeries(
          getJsonField(
            (contactsAutomations2.jsonBody ?? ''),
            r'''$''',
          ),
          '44')) {
        return;
      }

      apiResult1ew2 = await ActivecampaignGroup.newAppRegistrationDECall.call(
        contactId:
            valueOrDefault(currentUserDocument?.activeCampgainContactId, ''),
      );

      return;
    }
  } else {
    if ((valueOrDefault<bool>(currentUserDocument?.hasPayable, false) ==
            true) ||
        valueOrDefault<bool>(currentUserDocument?.plusmember, false)) {
      return;
    }

    apiResult3lc = await ActivecampaignGroup.createContactCall.call(
      email: currentUserEmail,
      firstName: currentUserDisplayName,
    );

    await currentUserReference!.update(createUsersRecordData(
      activeCampgainContactId: ActivecampaignGroup.createContactCall.contatId(
        (apiResult3lc.jsonBody ?? ''),
      ),
    ));
    if (FFLocalizations.of(context).languageCode == 'en') {
      apiResult1e1 = await ActivecampaignGroup.newAppRegistrationENCall.call(
        contactId:
            valueOrDefault(currentUserDocument?.activeCampgainContactId, ''),
      );
    } else {
      apiResult1e2 = await ActivecampaignGroup.newAppRegistrationDECall.call(
        contactId:
            valueOrDefault(currentUserDocument?.activeCampgainContactId, ''),
      );
    }

    return;
  }
}
