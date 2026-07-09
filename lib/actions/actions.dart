import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<String?> createActiveCampaignContact(
  BuildContext context, {
  String? createdContactId,
}) async {
  ApiCallResponse? apiResult3lc;

  logFirebaseEvent('createActiveCampaignContact_backend_call');
  apiResult3lc = await ActivecampaignGroup.createContactCall.call(
    email: currentUserEmail,
    firstName: currentUserDisplayName,
  );

  logFirebaseEvent('createActiveCampaignContact_backend_call');

  await currentUserReference!.update(createUsersRecordData(
    activeCampgainContactId: ActivecampaignGroup.createContactCall.contatId(
      (apiResult3lc?.jsonBody ?? ''),
    ),
  ));

  return null;
}

Future removeAllActiveCampaignSubscriptions(
  BuildContext context, {
  required String? id,
}) async {
  ApiCallResponse? apiResulttb2;
  ApiCallResponse? apiResultzgl;

  logFirebaseEvent('removeAllActiveCampaignSubscriptions_bac');
  apiResulttb2 = await ActivecampaignGroup.getAllAutomationsByUserCall.call(
    contact: id,
  );

  for (int loop1Index = 0;
      loop1Index <
          functions
              .getAutomationIdsBySeries(
                  FFAppConstants.NewRegistrationsIdAC.toList(),
                  getJsonField(
                    (apiResulttb2?.jsonBody ?? ''),
                    r'''$''',
                  ))
              .length;
      loop1Index++) {
    final currentLoop1Item = functions.getAutomationIdsBySeries(
        FFAppConstants.NewRegistrationsIdAC.toList(),
        getJsonField(
          (apiResulttb2?.jsonBody ?? ''),
          r'''$''',
        ))[loop1Index];
    logFirebaseEvent('removeAllActiveCampaignSubscriptions_bac');
    apiResultzgl = await ActivecampaignGroup.deleteUserFromAutomationCall.call(
      contactAutomationId: currentLoop1Item,
    );
  }
}

Future newUserSignUpActiveCampaign(BuildContext context) async {
  ApiCallResponse? apiResult1ew;
  ApiCallResponse? apiResult1ew2;

  if (FFLocalizations.of(context).languageCode == 'en') {
    logFirebaseEvent('newUserSignUpActiveCampaign_backend_call');
    apiResult1ew = await ActivecampaignGroup.addUserToAutomationCall.call(
      contactId:
          valueOrDefault(currentUserDocument?.activeCampgainContactId, ''),
      automationId: FFAppConstants.NewAppRegistrationEnId,
    );

    logFirebaseEvent('newUserSignUpActiveCampaign_backend_call');

    await currentUserReference!.update(createUsersRecordData(
      currentAutomationId: FFAppConstants.NewAppRegistrationEnId,
    ));
  } else {
    if (FFLocalizations.of(context).languageCode == 'de') {
      logFirebaseEvent('newUserSignUpActiveCampaign_backend_call');
      apiResult1ew2 = await ActivecampaignGroup.addUserToAutomationCall.call(
        contactId:
            valueOrDefault(currentUserDocument?.activeCampgainContactId, ''),
        automationId: FFAppConstants.NewAppRegistrationDeId,
      );

      logFirebaseEvent('newUserSignUpActiveCampaign_backend_call');

      await currentUserReference!.update(createUsersRecordData(
        currentAutomationId: FFAppConstants.NewAppRegistrationDeId,
      ));
    }
  }
}

Future startTrial(BuildContext context) async {
  ApiCallResponse? apiResultjug;
  ApiCallResponse? apiResultjug2;

  logFirebaseEvent('StartTrial_action_block');
  await action_blocks.removeAllActiveCampaignSubscriptions(
    context,
    id: valueOrDefault(currentUserDocument?.activeCampgainContactId, ''),
  );
  if (FFLocalizations.of(context).languageCode == 'en') {
    logFirebaseEvent('StartTrial_backend_call');
    apiResultjug = await ActivecampaignGroup.addUserToAutomationCall.call(
      contactId:
          valueOrDefault(currentUserDocument?.activeCampgainContactId, ''),
      automationId: FFAppConstants.NewTrialEnId,
    );

    logFirebaseEvent('StartTrial_backend_call');

    await currentUserReference!.update(createUsersRecordData(
      currentAutomationId: FFAppConstants.NewTrialEnId,
      currentAutomationType: ActiveCampaignAutomations.Plusmember,
    ));
  } else {
    if (FFLocalizations.of(context).languageCode == 'de') {
      logFirebaseEvent('StartTrial_backend_call');
      apiResultjug2 = await ActivecampaignGroup.addUserToAutomationCall.call(
        contactId:
            valueOrDefault(currentUserDocument?.activeCampgainContactId, ''),
        automationId: FFAppConstants.NewTrialDeId,
      );

      logFirebaseEvent('StartTrial_backend_call');

      await currentUserReference!.update(createUsersRecordData(
        currentAutomationId: FFAppConstants.NewTrialDeId,
        currentAutomationType: ActiveCampaignAutomations.Plusmember,
      ));
    }
  }
}

Future activeCampaignInit(BuildContext context) async {
  ApiCallResponse? apiResult8cu2;
  ApiCallResponse? apiResultu1f4;
  ApiCallResponse? apiResultu1f3;
  ApiCallResponse? apiResult8cu;
  ApiCallResponse? apiResultu1f44;
  ApiCallResponse? apiResultu1f34;
  ApiCallResponse? apiResultu1f;
  ApiCallResponse? contactTags;
  ApiCallResponse? apiResultm5v;
  ApiCallResponse? apiResultu1f2;
  ApiCallResponse? contactTags2;
  ApiCallResponse? apiResultm5v2;
  ApiCallResponse? apiResultu1f23;

  if (valueOrDefault(currentUserDocument?.activeCampgainContactId, '') !=
          null &&
      valueOrDefault(currentUserDocument?.activeCampgainContactId, '') != '') {
    if (!(valueOrDefault(currentUserDocument?.currentContactList, '') != null &&
        valueOrDefault(currentUserDocument?.currentContactList, '') != '')) {
      logFirebaseEvent('ActiveCampaignInit_backend_call');
      apiResult8cu2 = await ActivecampaignGroup.addContactToListCall.call(
        listId: FFAppConstants.activeCampaignAppSubscriberListId,
        contactId:
            valueOrDefault(currentUserDocument?.activeCampgainContactId, ''),
      );

      logFirebaseEvent('ActiveCampaignInit_backend_call');

      await currentUserReference!.update(createUsersRecordData(
        currentContactList: FFAppConstants.activeCampaignAppSubscriberListId,
      ));
    }
    if (FFLocalizations.of(context).languageCode == 'de') {
      logFirebaseEvent('ActiveCampaignInit_backend_call');
      apiResultu1f4 = await ActivecampaignGroup.addContactTagsCall.call(
        contactId:
            valueOrDefault(currentUserDocument?.activeCampgainContactId, ''),
        tagId: FFAppConstants.activeCampaignDeLangTagId,
      );
    }
    if (FFLocalizations.of(context).languageCode == 'en') {
      logFirebaseEvent('ActiveCampaignInit_backend_call');
      apiResultu1f3 = await ActivecampaignGroup.addContactTagsCall.call(
        contactId:
            valueOrDefault(currentUserDocument?.activeCampgainContactId, ''),
        tagId: FFAppConstants.activeCampaignEnLangTagId,
      );
    }
  } else {
    logFirebaseEvent('ActiveCampaignInit_action_block');
    await action_blocks.createActiveCampaignContact(context);
    logFirebaseEvent('ActiveCampaignInit_backend_call');
    apiResult8cu = await ActivecampaignGroup.addContactToListCall.call(
      listId: FFAppConstants.activeCampaignAppSubscriberListId,
      contactId:
          valueOrDefault(currentUserDocument?.activeCampgainContactId, ''),
    );

    logFirebaseEvent('ActiveCampaignInit_backend_call');

    await currentUserReference!.update(createUsersRecordData(
      currentContactList: FFAppConstants.activeCampaignAppSubscriberListId,
    ));
    if (FFLocalizations.of(context).languageCode == 'de') {
      logFirebaseEvent('ActiveCampaignInit_backend_call');
      apiResultu1f44 = await ActivecampaignGroup.addContactTagsCall.call(
        contactId:
            valueOrDefault(currentUserDocument?.activeCampgainContactId, ''),
        tagId: FFAppConstants.activeCampaignDeLangTagId,
      );
    }
    if (FFLocalizations.of(context).languageCode == 'en') {
      logFirebaseEvent('ActiveCampaignInit_backend_call');
      apiResultu1f34 = await ActivecampaignGroup.addContactTagsCall.call(
        contactId:
            valueOrDefault(currentUserDocument?.activeCampgainContactId, ''),
        tagId: FFAppConstants.activeCampaignEnLangTagId,
      );
    }
  }

  if ((valueOrDefault<bool>(currentUserDocument?.plusmember, false) == true) &&
      (valueOrDefault<bool>(currentUserDocument?.plusmember, false) != null)) {
    if (currentUserDocument?.currentAutomationType !=
        ActiveCampaignAutomations.Plusmember) {
      logFirebaseEvent('ActiveCampaignInit_backend_call');
      apiResultu1f = await ActivecampaignGroup.addContactTagsCall.call(
        contactId:
            valueOrDefault(currentUserDocument?.activeCampgainContactId, ''),
        tagId: FFAppConstants.activeCampaignPlusmemberTagId,
      );

      logFirebaseEvent('ActiveCampaignInit_backend_call');
      contactTags = await ActivecampaignGroup.getContactTagsCall.call(
        contactId:
            valueOrDefault(currentUserDocument?.activeCampgainContactId, ''),
      );

      logFirebaseEvent('ActiveCampaignInit_backend_call');
      apiResultm5v = await ActivecampaignGroup.deleteContactTagCall.call(
        contactTagId: ActivecampaignGroup.getContactTagsCall
            .contactTags(
              (contactTags?.jsonBody ?? ''),
            )
            ?.where(
                (e) => e.tag == FFAppConstants.activeCampaignFreememberTagId)
            .toList()
            ?.firstOrNull
            ?.id,
      );

      logFirebaseEvent('ActiveCampaignInit_action_block');
      await action_blocks.startTrial(context);
    }
  } else {
    if (currentUserDocument?.currentAutomationType != null) {
      if (currentUserDocument?.currentAutomationType ==
          ActiveCampaignAutomations.Plusmember) {
        logFirebaseEvent('ActiveCampaignInit_backend_call');
        apiResultu1f2 = await ActivecampaignGroup.addContactTagsCall.call(
          contactId:
              valueOrDefault(currentUserDocument?.activeCampgainContactId, ''),
          tagId: FFAppConstants.activeCampaignFreememberTagId,
        );

        logFirebaseEvent('ActiveCampaignInit_backend_call');
        contactTags2 = await ActivecampaignGroup.getContactTagsCall.call(
          contactId:
              valueOrDefault(currentUserDocument?.activeCampgainContactId, ''),
        );

        logFirebaseEvent('ActiveCampaignInit_backend_call');
        apiResultm5v2 = await ActivecampaignGroup.deleteContactTagCall.call(
          contactTagId: ActivecampaignGroup.getContactTagsCall
              .contactTags(
                (contactTags2?.jsonBody ?? ''),
              )
              ?.where(
                  (e) => e.tag == FFAppConstants.activeCampaignPlusmemberTagId)
              .toList()
              ?.firstOrNull
              ?.id,
        );

        logFirebaseEvent('ActiveCampaignInit_backend_call');

        await currentUserReference!.update(createUsersRecordData(
          currentAutomationType: ActiveCampaignAutomations.Freemember,
        ));
      }
    } else {
      logFirebaseEvent('ActiveCampaignInit_backend_call');

      await currentUserReference!.update(createUsersRecordData(
        currentAutomationType: ActiveCampaignAutomations.Freemember,
      ));
      logFirebaseEvent('ActiveCampaignInit_backend_call');
      apiResultu1f23 = await ActivecampaignGroup.addContactTagsCall.call(
        contactId:
            valueOrDefault(currentUserDocument?.activeCampgainContactId, ''),
        tagId: FFAppConstants.activeCampaignFreememberTagId,
      );

      logFirebaseEvent('ActiveCampaignInit_action_block');
      await action_blocks.newUserSignUpActiveCampaign(context);
    }
  }
}

Future recheckUserDeviceLanguage(BuildContext context) async {
  String? lang;

  logFirebaseEvent('recheckUserDeviceLanguage_custom_action');
  lang = await actions.getUserDeviceLanguage();
  if (lang == 'de') {
    logFirebaseEvent('recheckUserDeviceLanguage_set_app_langua');
    setAppLanguage(context, 'de');
  } else if (lang == 'ja') {
    logFirebaseEvent('recheckUserDeviceLanguage_set_app_langua');
    setAppLanguage(context, 'ja');
  } else {
    logFirebaseEvent('recheckUserDeviceLanguage_set_app_langua');
    setAppLanguage(context, 'en');
  }
}
