import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/structs/index.dart';
import '/components/dialogs/delete_acc_dialog/delete_acc_dialog_widget.dart';
import '/components/dialogs/select_goal_dialog/select_goal_dialog_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_edit_page_model.dart';
export 'profile_edit_page_model.dart';

class ProfileEditPageWidget extends StatefulWidget {
  const ProfileEditPageWidget({super.key});

  static String routeName = 'ProfileEditPage';
  static String routePath = '/profileEditPage';

  @override
  State<ProfileEditPageWidget> createState() => _ProfileEditPageWidgetState();
}

class _ProfileEditPageWidgetState extends State<ProfileEditPageWidget> {
  late ProfileEditPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileEditPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ProfileEditPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PROFILE_EDIT_ProfileEditPage_ON_INIT_STA');
      logFirebaseEvent('ProfileEditPage_update_page_state');
      _model.photo = currentUserPhoto;
      _model.genderEn = valueOrDefault<String>(
        valueOrDefault(currentUserDocument?.genderEn, ''),
        'Male',
      );
      _model.genderDe = valueOrDefault<String>(
        valueOrDefault(currentUserDocument?.genderDe, ''),
        'Männlich',
      );
      _model.genderJa = valueOrDefault(currentUserDocument?.genderJa, '');
      _model.goalDe = valueOrDefault(currentUserDocument?.goalDe, '');
      _model.goalEn = valueOrDefault(currentUserDocument?.goalEn, '');
      _model.goalJa = valueOrDefault(currentUserDocument?.goalJa, '');
      safeSetState(() {});
      if (currentUserDocument?.dateOfBirth != null) {
        logFirebaseEvent('ProfileEditPage_update_page_state');
        _model.date = currentUserDocument?.dateOfBirth;
        safeSetState(() {});
      }
      logFirebaseEvent('ProfileEditPage_custom_action');
      unawaited(
        () async {
          await actions.lockLandscapeMode();
        }(),
      );
      logFirebaseEvent('ProfileEditPage_custom_action');
      unawaited(
        () async {
          await actions.setStatusBarColor();
        }(),
      );
    });

    _model.nameTextController ??=
        TextEditingController(text: currentUserDisplayName);
    _model.nameFocusNode ??= FocusNode();

    _model.surnameTextController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.surname, ''));
    _model.surnameFocusNode ??= FocusNode();

    _model.weightkgTextController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.weight, 0).toString());
    _model.weightkgFocusNode ??= FocusNode();

    _model.heightcmTextController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.height, 0).toString());
    _model.heightcmFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).middleGray,
                    borderRadius: 12.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).primaryBackground,
                    icon: Icon(
                      FFIcons.karrowLeft24,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent('PROFILE_EDIT_arrowLeft24_ICN_ON_TAP');
                      logFirebaseEvent('IconButton_navigate_back');
                      context.safePop();
                    },
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      'nqxtmtlw' /* Edit profile */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          letterSpacing: 0.07,
                          fontWeight: FontWeight.w600,
                          lineHeight: 1.4,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                        ),
                  ),
                  if (currentUserEmail != null && currentUserEmail != '')
                    FlutterFlowIconButton(
                      borderColor: FlutterFlowTheme.of(context).middleGray,
                      borderRadius: 12.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      fillColor: FlutterFlowTheme.of(context).primaryBackground,
                      icon: Icon(
                        FFIcons.ktrash24,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent('PROFILE_EDIT_trash24_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_haptic_feedback');
                        HapticFeedback.selectionClick();
                        logFirebaseEvent('IconButton_bottom_sheet');
                        showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return GestureDetector(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: DeleteAccDialogWidget(),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      },
                    ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      AuthUserStreamWidget(
                        builder: (context) => Container(
                          width: 128.0,
                          height: 128.0,
                          decoration: BoxDecoration(
                            color: valueOrDefault<Color>(
                              currentUserPhoto == null || currentUserPhoto == ''
                                  ? FlutterFlowTheme.of(context).middleGray
                                  : FlutterFlowTheme.of(context).primary,
                              FlutterFlowTheme.of(context).middleGray,
                            ),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Builder(
                            builder: (context) {
                              if (_model.photo == null || _model.photo == '') {
                                return Icon(
                                  FFIcons.kuser20,
                                  color: FlutterFlowTheme.of(context).gray,
                                  size: 40.0,
                                );
                              } else {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(16.0),
                                  child: CachedNetworkImage(
                                    fadeInDuration: Duration(milliseconds: 500),
                                    fadeOutDuration:
                                        Duration(milliseconds: 500),
                                    imageUrl: _model.photo!,
                                    width: 128.0,
                                    height: 128.0,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'PROFILE_EDIT_SetOrChangePhoto_ON_TAP');
                            logFirebaseEvent(
                                'SetOrChangePhoto_haptic_feedback');
                            HapticFeedback.mediumImpact();
                            logFirebaseEvent(
                                'SetOrChangePhoto_upload_media_to_firebas');
                            final selectedMedia =
                                await selectMediaWithSourceBottomSheet(
                              context: context,
                              maxWidth: 1000.00,
                              maxHeight: 1000.00,
                              imageQuality: 80,
                              allowPhoto: true,
                            );
                            if (selectedMedia != null &&
                                selectedMedia.every((m) => validateFileFormat(
                                    m.storagePath, context))) {
                              safeSetState(() =>
                                  _model.isDataUploading_uploadDataXz31 = true);
                              var selectedUploadedFiles = <FFUploadedFile>[];

                              var downloadUrls = <String>[];
                              try {
                                selectedUploadedFiles = selectedMedia
                                    .map((m) => FFUploadedFile(
                                          name: m.storagePath.split('/').last,
                                          bytes: m.bytes,
                                          height: m.dimensions?.height,
                                          width: m.dimensions?.width,
                                          blurHash: m.blurHash,
                                          originalFilename: m.originalFilename,
                                        ))
                                    .toList();

                                downloadUrls = (await Future.wait(
                                  selectedMedia.map(
                                    (m) async => await uploadData(
                                        m.storagePath, m.bytes),
                                  ),
                                ))
                                    .where((u) => u != null)
                                    .map((u) => u!)
                                    .toList();
                              } finally {
                                _model.isDataUploading_uploadDataXz31 = false;
                              }
                              if (selectedUploadedFiles.length ==
                                      selectedMedia.length &&
                                  downloadUrls.length == selectedMedia.length) {
                                safeSetState(() {
                                  _model.uploadedLocalFile_uploadDataXz31 =
                                      selectedUploadedFiles.first;
                                  _model.uploadedFileUrl_uploadDataXz31 =
                                      downloadUrls.first;
                                });
                              } else {
                                safeSetState(() {});
                                return;
                              }
                            }

                            if ((_model.uploadedFileUrl_uploadDataXz31 !=
                                        null &&
                                    _model.uploadedFileUrl_uploadDataXz31 !=
                                        '') &&
                                !_model.isDataUploading_uploadDataXz31) {
                              logFirebaseEvent(
                                  'SetOrChangePhoto_update_page_state');
                              _model.photo =
                                  _model.uploadedFileUrl_uploadDataXz31;
                              _model.photoCheck = false;
                              safeSetState(() {});
                            }
                          },
                          text: valueOrDefault<String>(
                            _model.photo == null || _model.photo == ''
                                ? valueOrDefault<String>(
                                    FFLocalizations.of(context).getVariableText(
                                      enText: 'Set photo',
                                      deText: 'Foto hinzufügen',
                                      jaText: '写真を設定する',
                                    ),
                                    'Set photo',
                                  )
                                : valueOrDefault<String>(
                                    FFLocalizations.of(context).getVariableText(
                                      enText: 'Change photo',
                                      deText: 'Foto hinzufügen',
                                      jaText: '写真を変更',
                                    ),
                                    'Change photo',
                                  ),
                            'Set photo',
                          ),
                          options: FFButtonOptions(
                            width: 128.0,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).middleGray,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 14.0,
                                  letterSpacing: 0.07,
                                  lineHeight: 1.4,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .titleSmallIsCustom,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).middleGray,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '8kodqpfs' /* Use PNG or JPG up to 5 MB */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color: valueOrDefault<Color>(
                                  _model.photoCheck &&
                                          (_model.photo == null ||
                                              _model.photo == '')
                                      ? FlutterFlowTheme.of(context).error
                                      : FlutterFlowTheme.of(context).gray,
                                  FlutterFlowTheme.of(context).gray,
                                ),
                                fontSize: 10.0,
                                letterSpacing: 0.07,
                                fontWeight: FontWeight.w600,
                                lineHeight: 1.2,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .bodyMediumIsCustom,
                              ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'ykfx9rrd' /* Name */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  lineHeight: 1.3,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Form(
                          key: _model.formKey,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => Container(
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _model.nameTextController,
                                  focusNode: _model.nameFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.nameTextController',
                                    Duration(milliseconds: 300),
                                    () => safeSetState(() {}),
                                  ),
                                  autofocus: false,
                                  textCapitalization: TextCapitalization.words,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color:
                                              FlutterFlowTheme.of(context).gray,
                                          letterSpacing: 0.07,
                                          fontWeight: FontWeight.w600,
                                          lineHeight: 1.4,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .middleGray,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            16.0, 12.0, 16.0, 12.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        letterSpacing: 0.07,
                                        fontWeight: FontWeight.w600,
                                        lineHeight: 1.4,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                  maxLength: 50,
                                  maxLengthEnforcement:
                                      MaxLengthEnforcement.none,
                                  buildCounter: (context,
                                          {required currentLength,
                                          required isFocused,
                                          maxLength}) =>
                                      null,
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model.nameTextControllerValidator
                                      .asValidator(context),
                                  inputFormatters: [
                                    if (!isAndroid && !isiOS)
                                      TextInputFormatter.withFunction(
                                          (oldValue, newValue) {
                                        return TextEditingValue(
                                          selection: newValue.selection,
                                          text: newValue.text.toCapitalization(
                                              TextCapitalization.words),
                                        );
                                      }),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 32.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'uw5rooxb' /* Surname */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  lineHeight: 1.3,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => Container(
                              width: double.infinity,
                              child: TextFormField(
                                controller: _model.surnameTextController,
                                focusNode: _model.surnameFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.surnameTextController',
                                  Duration(milliseconds: 300),
                                  () => safeSetState(() {}),
                                ),
                                autofocus: false,
                                textCapitalization: TextCapitalization.words,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color:
                                            FlutterFlowTheme.of(context).gray,
                                        letterSpacing: 0.07,
                                        fontWeight: FontWeight.w600,
                                        lineHeight: 1.4,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .middleGray,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          16.0, 12.0, 16.0, 12.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.07,
                                      fontWeight: FontWeight.w600,
                                      lineHeight: 1.4,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                                maxLength: 50,
                                maxLengthEnforcement: MaxLengthEnforcement.none,
                                buildCounter: (context,
                                        {required currentLength,
                                        required isFocused,
                                        maxLength}) =>
                                    null,
                                cursorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                validator: _model.surnameTextControllerValidator
                                    .asValidator(context),
                                inputFormatters: [
                                  if (!isAndroid && !isiOS)
                                    TextInputFormatter.withFunction(
                                        (oldValue, newValue) {
                                      return TextEditingValue(
                                        selection: newValue.selection,
                                        text: newValue.text.toCapitalization(
                                            TextCapitalization.words),
                                      );
                                    }),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final genderStates =
                                FFAppState().genders.map((e) => e).toList();

                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(genderStates.length,
                                  (genderStatesIndex) {
                                final genderStatesItem =
                                    genderStates[genderStatesIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'PROFILE_EDIT_Row_gggxsy7m_ON_TAP');
                                    logFirebaseEvent('Row_haptic_feedback');
                                    HapticFeedback.mediumImpact();
                                    logFirebaseEvent('Row_update_page_state');
                                    _model.genderEn = genderStatesItem.titleEn;
                                    _model.genderDe = genderStatesItem.titleDe;
                                    _model.genderJa = genderStatesItem.titleJa;
                                    safeSetState(() {});
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        Icons.circle_sharp,
                                        color: valueOrDefault<Color>(
                                          (_model.genderEn ==
                                                      genderStatesItem
                                                          .titleEn) &&
                                                  (_model.genderDe ==
                                                      genderStatesItem
                                                          .titleDe) &&
                                                  (_model.genderJa ==
                                                      genderStatesItem.titleJa)
                                              ? FlutterFlowTheme.of(context)
                                                  .secondary
                                              : FlutterFlowTheme.of(context)
                                                  .middleGray,
                                          FlutterFlowTheme.of(context)
                                              .middleGray,
                                        ),
                                        size: 28.0,
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          FFLocalizations.of(context)
                                              .getVariableText(
                                            enText: genderStatesItem.titleEn,
                                            deText: genderStatesItem.titleDe,
                                            jaText: genderStatesItem.titleJa,
                                          ),
                                          'Male',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              letterSpacing: 0.07,
                                              lineHeight: 1.4,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                      ),
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                );
                              }).divide(SizedBox(width: 24.0)),
                            );
                          },
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 32.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '49xzdd9n' /* Goal */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  lineHeight: 1.3,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'PROFILE_EDIT_Container_jxk3rus6_ON_TAP');
                            logFirebaseEvent('Container_haptic_feedback');
                            HapticFeedback.mediumImpact();
                            logFirebaseEvent('Container_bottom_sheet');
                            showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () {
                                    FocusScope.of(context).unfocus();
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: SelectGoalDialogWidget(
                                      goalDe: _model.goalDe,
                                      goalEn: _model.goalEn,
                                      goalJa: _model.goalJa,
                                      update: (de, en, ja) async {
                                        logFirebaseEvent('_update_page_state');
                                        _model.goalDe = de;
                                        _model.goalEn = en;
                                        _model.goalJa = ja;
                                        safeSetState(() {});
                                      },
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                          child: Material(
                            color: Colors.transparent,
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Container(
                              width: double.infinity,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color:
                                      FlutterFlowTheme.of(context).middleGray,
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        valueOrDefault<String>(
                                          (_model.goalDe != null &&
                                                      _model.goalDe != '') &&
                                                  (_model.goalEn != null &&
                                                      _model.goalEn != '') &&
                                                  (_model.goalJa != null &&
                                                      _model.goalJa != '')
                                              ? valueOrDefault<String>(
                                                  FFLocalizations.of(context)
                                                      .getVariableText(
                                                    enText: _model.goalEn,
                                                    deText: _model.goalDe,
                                                    jaText: _model.goalJa,
                                                  ),
                                                  'Male',
                                                )
                                              : 'Select goal',
                                          'Select goal',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              letterSpacing: 0.07,
                                              fontWeight: FontWeight.w600,
                                              lineHeight: 1.4,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                      ),
                                    ),
                                    Icon(
                                      FFIcons.karrowDown24,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 32.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'xz3hzjuf' /* Date of birth */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  lineHeight: 1.3,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'PROFILE_EDIT_Container_f138evl4_ON_TAP');
                            logFirebaseEvent('Container_haptic_feedback');
                            HapticFeedback.mediumImpact();
                            logFirebaseEvent('Container_date_time_picker');
                            await showModalBottomSheet<bool>(
                                context: context,
                                builder: (context) {
                                  return ScrollConfiguration(
                                    behavior:
                                        const MaterialScrollBehavior().copyWith(
                                      dragDevices: {
                                        PointerDeviceKind.mouse,
                                        PointerDeviceKind.touch,
                                        PointerDeviceKind.stylus,
                                        PointerDeviceKind.unknown
                                      },
                                    ),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              3,
                                      width: MediaQuery.of(context).size.width,
                                      child: CupertinoDatePicker(
                                        mode: CupertinoDatePickerMode.date,
                                        minimumDate: DateTime(1900),
                                        initialDateTime: ((_model.date != null
                                                ? _model.date
                                                : getCurrentTimestamp) ??
                                            DateTime.now()),
                                        maximumDate: (getCurrentTimestamp ??
                                            DateTime(2050)),
                                        use24hFormat: false,
                                        onDateTimeChanged: (newDateTime) =>
                                            safeSetState(() {
                                          _model.datePicked = newDateTime;
                                        }),
                                      ),
                                    ),
                                  );
                                });
                            logFirebaseEvent('Container_update_page_state');
                            _model.date = _model.datePicked;
                            safeSetState(() {});
                          },
                          child: Material(
                            color: Colors.transparent,
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Container(
                              width: double.infinity,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color:
                                      FlutterFlowTheme.of(context).middleGray,
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        valueOrDefault<String>(
                                          _model.date != null
                                              ? valueOrDefault<String>(
                                                  dateTimeFormat(
                                                    "dd.MM.yyyy",
                                                    _model.date,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ),
                                                  'Select date of birth',
                                                )
                                              : valueOrDefault<String>(
                                                  FFLocalizations.of(context)
                                                      .getVariableText(
                                                    enText:
                                                        'Select date of birth',
                                                    deText:
                                                        'Geburtsdatum auswählen',
                                                    jaText: '生年月日を選択',
                                                  ),
                                                  'Select date of birth',
                                                ),
                                          'Select date of birth',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              letterSpacing: 0.07,
                                              fontWeight: FontWeight.w600,
                                              lineHeight: 1.4,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                      ),
                                    ),
                                    Icon(
                                      FFIcons.kcalendar24,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 32.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'rf9zfcww' /* Weight (kg) */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  lineHeight: 1.3,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => Container(
                              width: double.infinity,
                              child: TextFormField(
                                controller: _model.weightkgTextController,
                                focusNode: _model.weightkgFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.weightkgTextController',
                                  Duration(milliseconds: 300),
                                  () => safeSetState(() {}),
                                ),
                                autofocus: false,
                                textCapitalization: TextCapitalization.none,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color:
                                            FlutterFlowTheme.of(context).gray,
                                        letterSpacing: 0.07,
                                        fontWeight: FontWeight.w600,
                                        lineHeight: 1.4,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .middleGray,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          16.0, 12.0, 16.0, 12.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.07,
                                      fontWeight: FontWeight.w600,
                                      lineHeight: 1.4,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                                maxLength: 50,
                                maxLengthEnforcement: MaxLengthEnforcement.none,
                                buildCounter: (context,
                                        {required currentLength,
                                        required isFocused,
                                        maxLength}) =>
                                    null,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        signed: true, decimal: true),
                                cursorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                validator: _model
                                    .weightkgTextControllerValidator
                                    .asValidator(context),
                                inputFormatters: [
                                  if (!isAndroid && !isiOS)
                                    TextInputFormatter.withFunction(
                                        (oldValue, newValue) {
                                      return TextEditingValue(
                                        selection: newValue.selection,
                                        text: newValue.text.toCapitalization(
                                            TextCapitalization.none),
                                      );
                                    }),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 32.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'd640scwx' /* Height (cm) */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  lineHeight: 1.3,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => Container(
                              width: double.infinity,
                              child: TextFormField(
                                controller: _model.heightcmTextController,
                                focusNode: _model.heightcmFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.heightcmTextController',
                                  Duration(milliseconds: 300),
                                  () => safeSetState(() {}),
                                ),
                                autofocus: false,
                                textCapitalization: TextCapitalization.none,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color:
                                            FlutterFlowTheme.of(context).gray,
                                        letterSpacing: 0.07,
                                        fontWeight: FontWeight.w600,
                                        lineHeight: 1.4,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .middleGray,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          16.0, 12.0, 16.0, 12.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.07,
                                      fontWeight: FontWeight.w600,
                                      lineHeight: 1.4,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                                maxLength: 50,
                                maxLengthEnforcement: MaxLengthEnforcement.none,
                                buildCounter: (context,
                                        {required currentLength,
                                        required isFocused,
                                        maxLength}) =>
                                    null,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        signed: true, decimal: true),
                                cursorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                validator: _model
                                    .heightcmTextControllerValidator
                                    .asValidator(context),
                                inputFormatters: [
                                  if (!isAndroid && !isiOS)
                                    TextInputFormatter.withFunction(
                                        (oldValue, newValue) {
                                      return TextEditingValue(
                                        selection: newValue.selection,
                                        text: newValue.text.toCapitalization(
                                            TextCapitalization.none),
                                      );
                                    }),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent('PROFILE_EDIT_Savechanges_ON_TAP');
                            logFirebaseEvent('Savechanges_haptic_feedback');
                            HapticFeedback.selectionClick();
                            logFirebaseEvent('Savechanges_validate_form');
                            if (_model.formKey.currentState == null ||
                                !_model.formKey.currentState!.validate()) {
                              return;
                            }
                            logFirebaseEvent('Savechanges_backend_call');

                            await currentUserReference!
                                .update(createUsersRecordData(
                              displayName: _model.nameTextController.text,
                              weight: valueOrDefault<int>(
                                int.tryParse(
                                    _model.weightkgTextController.text),
                                0,
                              ),
                              height: valueOrDefault<int>(
                                int.tryParse(
                                    _model.heightcmTextController.text),
                                0,
                              ),
                              surname: _model.surnameTextController.text,
                              goalDe: valueOrDefault<String>(
                                _model.goalDe,
                                'Fitter werden',
                              ),
                              goalEn: valueOrDefault<String>(
                                _model.goalEn,
                                'Get more fit',
                              ),
                              genderEn: valueOrDefault<String>(
                                _model.genderEn,
                                'Male',
                              ),
                              genderDe: valueOrDefault<String>(
                                _model.genderDe,
                                'Männlich',
                              ),
                              genderJa: _model.genderJa,
                              goalJa: _model.goalJa,
                            ));
                            await Future.wait([
                              Future(() async {
                                if (_model.date != null) {
                                  logFirebaseEvent('Savechanges_backend_call');
                                  unawaited(
                                    () async {
                                      await currentUserReference!
                                          .update(createUsersRecordData(
                                        dateOfBirth: _model.date,
                                      ));
                                    }(),
                                  );
                                }
                              }),
                              Future(() async {
                                if (_model.photo == null ||
                                    _model.photo == '') {
                                  logFirebaseEvent('Savechanges_backend_call');
                                  unawaited(
                                    () async {
                                      await currentUserReference!.update({
                                        ...mapToFirestore(
                                          {
                                            'photo_url': FieldValue.delete(),
                                          },
                                        ),
                                      });
                                    }(),
                                  );
                                } else {
                                  logFirebaseEvent('Savechanges_backend_call');
                                  unawaited(
                                    () async {
                                      await currentUserReference!
                                          .update(createUsersRecordData(
                                        photoUrl: _model.photo,
                                      ));
                                    }(),
                                  );
                                }
                              }),
                            ]);
                            logFirebaseEvent('Savechanges_navigate_back');
                            context.safePop();
                            if (valueOrDefault(
                                        currentUserDocument
                                            ?.activeCampgainContactId,
                                        '') !=
                                    null &&
                                valueOrDefault(
                                        currentUserDocument
                                            ?.activeCampgainContactId,
                                        '') !=
                                    '') {
                              logFirebaseEvent('Savechanges_backend_call');
                              await ActivecampaignGroup.updateContactCall.call(
                                id: valueOrDefault(
                                    currentUserDocument
                                        ?.activeCampgainContactId,
                                    ''),
                                email: currentUserEmail,
                                name: _model.nameTextController.text,
                                surname: _model.surnameTextController.text,
                              );
                            }
                          },
                          text: FFLocalizations.of(context).getText(
                            '78w933u7' /* Save changes */,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 14.0,
                                  letterSpacing: 0.07,
                                  lineHeight: 1.4,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .titleSmallIsCustom,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).secondary,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    ]
                        .addToStart(SizedBox(height: 24.0))
                        .addToEnd(SizedBox(height: 34.0)),
                  ),
                ),
              ),
            ].divide(SizedBox(height: 16.0)).addToStart(SizedBox(height: 48.0)),
          ),
        ),
      ),
    );
  }
}
