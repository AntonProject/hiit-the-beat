import '/admin/admin_components/admin_nav_bar/admin_nav_bar_widget.dart';
import '/admin/admin_components/admin_user_dialog/admin_user_dialog_widget.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'admin_user_management_model.dart';
export 'admin_user_management_model.dart';

class AdminUserManagementWidget extends StatefulWidget {
  const AdminUserManagementWidget({super.key});

  static String routeName = 'AdminUserManagement';
  static String routePath = '/adminUserManagement';

  @override
  State<AdminUserManagementWidget> createState() =>
      _AdminUserManagementWidgetState();
}

class _AdminUserManagementWidgetState extends State<AdminUserManagementWidget> {
  late AdminUserManagementModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminUserManagementModel());

    _model.searchbynamesurnameTextController ??= TextEditingController();
    _model.searchbynamesurnameFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            wrapWithModel(
              model: _model.adminNavBarModel,
              updateCallback: () => safeSetState(() {}),
              child: AdminNavBarWidget(),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(40.0, 32.0, 40.0, 34.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: FutureBuilder<int>(
                            future: queryUsersRecordCount(),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 20.0,
                                    height: 20.0,
                                    child: SpinKitRipple(
                                      color: FlutterFlowTheme.of(context).green,
                                      size: 20.0,
                                    ),
                                  ),
                                );
                              }
                              int richTextCount = snapshot.data!;

                              return RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: valueOrDefault<String>(
                                        formatNumber(
                                          richTextCount,
                                          formatType: FormatType.custom,
                                          format: '0 ',
                                          locale: '',
                                        ),
                                        '0 ',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            fontSize: 24.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        'xvzqinso' /* users */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            fontSize: 24.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                          width: 225.0,
                          child: TextFormField(
                            controller:
                                _model.searchbynamesurnameTextController,
                            focusNode: _model.searchbynamesurnameFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.searchbynamesurnameTextController',
                              Duration(milliseconds: 100),
                              () => safeSetState(() {}),
                            ),
                            onFieldSubmitted: (_) async {
                              safeSetState(() {});
                            },
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelMediumFamily,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelMediumFamily),
                                  ),
                              hintText: FFLocalizations.of(context).getText(
                                'atu7e31q' /* Search by name & surname */,
                              ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelMediumFamily,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelMediumFamily),
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context).primary,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model
                                .searchbynamesurnameTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            try {
                              final result =
                                  await FirebaseFunctions.instanceFor(
                                          region: 'europe-west3')
                                      .httpsCallable('exportToExcel')
                                      .call({});
                              _model.cloudFunction =
                                  ExportToExcelCloudFunctionCallResponse(
                                data: result.data,
                                succeeded: true,
                                resultAsString: result.data.toString(),
                                jsonBody: result.data,
                              );
                            } on FirebaseFunctionsException catch (error) {
                              _model.cloudFunction =
                                  ExportToExcelCloudFunctionCallResponse(
                                errorCode: error.code,
                                succeeded: false,
                              );
                            }

                            if (_model.cloudFunction!.succeeded!) {
                              unawaited(
                                () async {
                                  await launchURL(_model.cloudFunction!.data!);
                                }(),
                              );
                            }

                            safeSetState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            '777taxqm' /* Export to Excel */,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
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
                                  fontSize: 12.0,
                                  letterSpacing: 0.07,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleSmallFamily),
                                  lineHeight: 1.4,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).middleGray,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                      ].divide(SizedBox(width: 24.0)),
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(1.0, 1.0),
                            child: Container(
                              width: 450.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                            ),
                          ),
                          FutureBuilder<List<UsersRecord>>(
                            future: queryUsersRecordOnce(
                              queryBuilder: (usersRecord) => usersRecord
                                  .orderBy('created_time', descending: true),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 20.0,
                                    height: 20.0,
                                    child: SpinKitRipple(
                                      color: FlutterFlowTheme.of(context).green,
                                      size: 20.0,
                                    ),
                                  ),
                                );
                              }
                              List<UsersRecord> containerUsersRecordList =
                                  snapshot.data!;

                              return Container(
                                decoration: BoxDecoration(),
                                child: Builder(
                                  builder: (context) {
                                    final users = (_model.searchbynamesurnameTextController
                                                        .text !=
                                                    ''
                                            ? containerUsersRecordList
                                                .where((e) => functions.search(
                                                    _model
                                                        .searchbynamesurnameTextController
                                                        .text,
                                                    e.email,
                                                    e.displayName,
                                                    e.surname,
                                                    FFLocalizations.of(context)
                                                        .getVariableText(
                                                      enText: e.genderEn,
                                                      deText: e.genderDe,
                                                    ),
                                                    FFLocalizations.of(context)
                                                        .getVariableText(
                                                      enText: e.goalEn,
                                                      deText: e.goalDe,
                                                    )))
                                                .toList()
                                            : containerUsersRecordList)
                                        .toList();
                                    if (users.isEmpty) {
                                      return EmptyListWidget();
                                    }

                                    return FlutterFlowDataTable<UsersRecord>(
                                      controller:
                                          _model.paginatedDataTableController,
                                      data: users,
                                      columnsBuilder: (onSortChanged) => [
                                        DataColumn2(
                                          label: DefaultTextStyle.merge(
                                            softWrap: true,
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '9k2mq9vi' /* Name */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLargeFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .gray,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLargeFamily),
                                                      ),
                                            ),
                                          ),
                                        ),
                                        DataColumn2(
                                          label: DefaultTextStyle.merge(
                                            softWrap: true,
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '1z9ju4z5' /* Surname */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLargeFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .gray,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLargeFamily),
                                                      ),
                                            ),
                                          ),
                                        ),
                                        DataColumn2(
                                          label: DefaultTextStyle.merge(
                                            softWrap: true,
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'yj7dmpyo' /* Gender */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLargeFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .gray,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLargeFamily),
                                                      ),
                                            ),
                                          ),
                                        ),
                                        DataColumn2(
                                          label: DefaultTextStyle.merge(
                                            softWrap: true,
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '6lsi09wz' /* Email */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLargeFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .gray,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLargeFamily),
                                                      ),
                                            ),
                                          ),
                                        ),
                                        DataColumn2(
                                          label: DefaultTextStyle.merge(
                                            softWrap: true,
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ojqqej2c' /* Progress */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLargeFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .gray,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLargeFamily),
                                                      ),
                                            ),
                                          ),
                                        ),
                                        DataColumn2(
                                          label: DefaultTextStyle.merge(
                                            softWrap: true,
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '7x72k1pp' /* Date of birth */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLargeFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .gray,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLargeFamily),
                                                      ),
                                            ),
                                          ),
                                        ),
                                        DataColumn2(
                                          label: DefaultTextStyle.merge(
                                            softWrap: true,
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'n11ijf50' /* Weight (kg) */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLargeFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .gray,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLargeFamily),
                                                      ),
                                            ),
                                          ),
                                        ),
                                        DataColumn2(
                                          label: DefaultTextStyle.merge(
                                            softWrap: true,
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'volnyvvf' /* Height (cm) */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLargeFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .gray,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLargeFamily),
                                                      ),
                                            ),
                                          ),
                                        ),
                                        DataColumn2(
                                          label: DefaultTextStyle.merge(
                                            softWrap: true,
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '10c251t1' /* Status */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLargeFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .gray,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLargeFamily),
                                                      ),
                                            ),
                                          ),
                                        ),
                                        DataColumn2(
                                          label: DefaultTextStyle.merge(
                                            softWrap: true,
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'be3znh29' /* Plusmember */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLargeFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .gray,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLargeFamily),
                                                      ),
                                            ),
                                          ),
                                        ),
                                        DataColumn2(
                                          label: DefaultTextStyle.merge(
                                            softWrap: true,
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'k7k9x8vg' /*   */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLargeFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .gray,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLargeFamily),
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ],
                                      dataRowBuilder: (usersItem, usersIndex,
                                              selected, onSelectChanged) =>
                                          DataRow(
                                        color: WidgetStateProperty.all(
                                          usersIndex % 2 == 0
                                              ? FlutterFlowTheme.of(context)
                                                  .primaryBackground
                                              : FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                        ),
                                        cells: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Container(
                                                  width: 32.0,
                                                  height: 32.0,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: CachedNetworkImage(
                                                    fadeInDuration: Duration(
                                                        milliseconds: 500),
                                                    fadeOutDuration: Duration(
                                                        milliseconds: 500),
                                                    imageUrl:
                                                        usersItem.photoUrl,
                                                    fit: BoxFit.cover,
                                                    errorWidget: (context,
                                                            error,
                                                            stackTrace) =>
                                                        Image.asset(
                                                      'assets/images/error_image.jpg',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    usersItem.displayName,
                                                    'Guest',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 12.0)),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              usersItem.surname,
                                              '-',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              FFLocalizations.of(context)
                                                  .getVariableText(
                                                enText: usersItem.genderEn,
                                                deText: usersItem.genderDe,
                                              ),
                                              '-',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              usersItem.email,
                                              '-',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                          StreamBuilder<List<ProgressRecord>>(
                                            stream: queryProgressRecord(
                                              queryBuilder: (progressRecord) =>
                                                  progressRecord.where(
                                                'user',
                                                isEqualTo: usersItem.reference,
                                              ),
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 20.0,
                                                    height: 20.0,
                                                    child: SpinKitRipple(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .green,
                                                      size: 20.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<ProgressRecord>
                                                  containerProgressRecordList =
                                                  snapshot.data!;
                                              final containerProgressRecord =
                                                  containerProgressRecordList
                                                          .isNotEmpty
                                                      ? containerProgressRecordList
                                                          .first
                                                      : null;

                                              return Container(
                                                decoration: BoxDecoration(),
                                                child: FutureBuilder<
                                                    List<WorkoutsRecord>>(
                                                  future:
                                                      queryWorkoutsRecordOnce(),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 20.0,
                                                          height: 20.0,
                                                          child: SpinKitRipple(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .green,
                                                            size: 20.0,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<WorkoutsRecord>
                                                        containerWorkoutsRecordList =
                                                        snapshot.data!;

                                                    return Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          formatNumber(
                                                            functions.totalPointsProgress(
                                                                containerProgressRecord
                                                                    ?.workoutDone
                                                                    .toList(),
                                                                containerWorkoutsRecordList
                                                                    .map((e) =>
                                                                        e.points)
                                                                    .toList()),
                                                            formatType:
                                                                FormatType
                                                                    .percent,
                                                          ),
                                                          '0%',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              dateTimeFormat(
                                                "dd.MM.yyyy",
                                                usersItem.dateOfBirth,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              '-',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              formatNumber(
                                                usersItem.weight,
                                                formatType: FormatType.custom,
                                                format: '0.0',
                                                locale: '',
                                              ),
                                              '0.0',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              formatNumber(
                                                usersItem.height,
                                                formatType: FormatType.custom,
                                                format: '0.0',
                                                locale: '',
                                              ),
                                              '0.0',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (!usersItem.deleted &&
                                                  !usersItem.blocked)
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'oko5ro7j' /* Active */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                              if (usersItem.blocked)
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'xcjzr0am' /* Blocked */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .gray,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                              if (usersItem.deleted)
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'em51kq6q' /* Deleted */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (usersItem.plusmember)
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'avlcdcx3' /* Yes */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                              if (!usersItem.plusmember)
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'j2z18xgk' /* No */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .gray,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                            ],
                                          ),
                                          Builder(
                                            builder: (context) => InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                showAlignedDialog(
                                                  context: context,
                                                  isGlobal: false,
                                                  avoidOverflow: false,
                                                  targetAnchor:
                                                      AlignmentDirectional(
                                                              1.0, -1.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  followerAnchor:
                                                      AlignmentDirectional(
                                                              1.0, -1.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  builder: (dialogContext) {
                                                    return Material(
                                                      color: Colors.transparent,
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(
                                                                  dialogContext)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child:
                                                            AdminUserDialogWidget(
                                                          user: usersItem,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              child: Container(
                                                width: 40.0,
                                                height: 40.0,
                                                decoration: BoxDecoration(),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 4.0,
                                                      height: 4.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 4.0,
                                                      height: 4.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 4.0,
                                                      height: 4.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 4.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ].map((c) => DataCell(c)).toList(),
                                      ),
                                      emptyBuilder: () => EmptyListWidget(),
                                      paginated: true,
                                      selectable: false,
                                      hidePaginator: false,
                                      showFirstLastButtons: false,
                                      headingRowHeight: 31.0,
                                      dataRowHeight: 39.0,
                                      columnSpacing: 20.0,
                                      headingRowColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                      addHorizontalDivider: true,
                                      addTopAndBottomDivider: false,
                                      hideDefaultHorizontalDivider: true,
                                      horizontalDividerColor:
                                          FlutterFlowTheme.of(context).primary,
                                      horizontalDividerThickness: 1.0,
                                      addVerticalDivider: false,
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ].divide(SizedBox(height: 28.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
