import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/additional_comp/additional_comp_widget.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/components/skeleton/skeleton_add_grid/skeleton_add_grid_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'additionals_page_model.dart';
export 'additionals_page_model.dart';

class AdditionalsPageWidget extends StatefulWidget {
  const AdditionalsPageWidget({super.key});

  static String routeName = 'AdditionalsPage';
  static String routePath = '/additionalsPage';

  @override
  State<AdditionalsPageWidget> createState() => _AdditionalsPageWidgetState();
}

class _AdditionalsPageWidgetState extends State<AdditionalsPageWidget> {
  late AdditionalsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdditionalsPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AdditionalsPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ADDITIONALS_AdditionalsPage_ON_INIT_STAT');
      logFirebaseEvent('AdditionalsPage_custom_action');
      unawaited(
        () async {
          await actions.lockLandscapeMode();
        }(),
      );
      logFirebaseEvent('AdditionalsPage_custom_action');
      unawaited(
        () async {
          await actions.setStatusBarColor();
        }(),
      );
    });

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
        body: Align(
          alignment: AlignmentDirectional(0.0, -1.0),
          child: Stack(
            alignment: AlignmentDirectional(0.0, 1.0),
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOutQuint,
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      valueOrDefault<Color>(
                        _model.pageViewCurrentIndex == 0
                            ? FlutterFlowTheme.of(context).red
                            : FlutterFlowTheme.of(context).accent1,
                        FlutterFlowTheme.of(context).red,
                      ),
                      valueOrDefault<Color>(
                        _model.pageViewCurrentIndex == 0
                            ? Color(0xFF16060B)
                            : Color(0xFF06151C),
                        Color(0xFF16060B),
                      )
                    ],
                    stops: [0.0, 1.0],
                    begin: AlignmentDirectional(0.0, -1.0),
                    end: AlignmentDirectional(0, 1.0),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'q9dc63ht' /* Additionals */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 24.0,
                                letterSpacing: 0.07,
                                fontWeight: FontWeight.bold,
                                lineHeight: 1.4,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .bodyMediumIsCustom,
                              ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final types = FFAppState().types.toList();

                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children:
                                  List.generate(types.length, (typesIndex) {
                                final typesItem = types[typesIndex];
                                return FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'ADDITIONALS_PAGE_PAGE_Warmups_ON_TAP');
                                    logFirebaseEvent('Warmups_haptic_feedback');
                                    HapticFeedback.selectionClick();
                                    logFirebaseEvent(
                                        'Warmups_update_page_state');
                                    _model.tab = valueOrDefault<int>(
                                      typesItem.number,
                                      1,
                                    );
                                    safeSetState(() {});
                                    logFirebaseEvent('Warmups_page_view');
                                    await _model.pageViewController
                                        ?.animateToPage(
                                      valueOrDefault<int>(
                                        typesIndex,
                                        0,
                                      ),
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.ease,
                                    );
                                  },
                                  text: valueOrDefault<String>(
                                    typesItem.titleEn,
                                    'Warm ups',
                                  ),
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: valueOrDefault<Color>(
                                      _model.tab == typesItem.number
                                          ? FlutterFlowTheme.of(context)
                                              .primaryText
                                          : FlutterFlowTheme.of(context)
                                              .primary,
                                      FlutterFlowTheme.of(context).primaryText,
                                    ),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: valueOrDefault<Color>(
                                            _model.tab == typesItem.number
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                          fontSize: 14.0,
                                          letterSpacing: 0.07,
                                          lineHeight: 1.4,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .titleSmallIsCustom,
                                        ),
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color: valueOrDefault<Color>(
                                        _model.tab == typesItem.number
                                            ? FlutterFlowTheme.of(context)
                                                .primaryText
                                            : FlutterFlowTheme.of(context)
                                                .middleGray,
                                        FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  showLoadingIndicator: false,
                                );
                              })
                                      .divide(SizedBox(width: 8.0))
                                      .addToStart(SizedBox(width: 16.0))
                                      .addToEnd(SizedBox(width: 16.0)),
                            ),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Builder(
                          builder: (context) {
                            final type = FFAppState()
                                .types
                                .map((e) => e.number)
                                .toList();

                            return Container(
                              width: double.infinity,
                              height: 500.0,
                              child: PageView.builder(
                                controller: _model.pageViewController ??=
                                    PageController(
                                        initialPage:
                                            max(0, min(0, type.length - 1))),
                                onPageChanged: (_) async {
                                  logFirebaseEvent(
                                      'ADDITIONALS_PageView_13uyhiel_ON_WIDGET_');
                                  logFirebaseEvent(
                                      'PageView_update_page_state');
                                  _model.tab = valueOrDefault<int>(
                                    _model.pageViewCurrentIndex + 1,
                                    1,
                                  );
                                  safeSetState(() {});
                                },
                                scrollDirection: Axis.horizontal,
                                itemCount: type.length,
                                itemBuilder: (context, typeIndex) {
                                  final typeItem = type[typeIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child:
                                        StreamBuilder<List<AdditionalsRecord>>(
                                      stream: queryAdditionalsRecord(
                                        queryBuilder: (additionalsRecord) =>
                                            additionalsRecord
                                                .where(
                                                  'type_index',
                                                  isEqualTo: _model.tab,
                                                )
                                                .orderBy('index'),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return SkeletonAddGridWidget();
                                        }
                                        List<AdditionalsRecord>
                                            containerAdditionalsRecordList =
                                            snapshot.data!;

                                        return Container(
                                          decoration: BoxDecoration(),
                                          child: Builder(
                                            builder: (context) {
                                              final containerVar =
                                                  containerAdditionalsRecordList
                                                      .where((e) => () {
                                                            if (FFLocalizations.of(
                                                                        context)
                                                                    .languageCode ==
                                                                'en') {
                                                              return (e.en ||
                                                                  (e.en &&
                                                                      e.de &&
                                                                      e.ja) ||
                                                                  (e.en &&
                                                                      e.ja) ||
                                                                  (e.de &&
                                                                      e.ja));
                                                            } else if (FFLocalizations.of(
                                                                        context)
                                                                    .languageCode ==
                                                                'de') {
                                                              return (e.de ||
                                                                  (e.en &&
                                                                      e.de &&
                                                                      e.ja) ||
                                                                  (e.en &&
                                                                      e.de) ||
                                                                  (e.de &&
                                                                      e.ja));
                                                            } else {
                                                              return (e.ja ||
                                                                  (e.en &&
                                                                      e.de &&
                                                                      e.ja) ||
                                                                  (e.en &&
                                                                      e.ja) ||
                                                                  (e.de &&
                                                                      e.ja));
                                                            }
                                                          }())
                                                      .toList();
                                              if (containerVar.isEmpty) {
                                                return EmptyListWidget();
                                              }

                                              return GridView.builder(
                                                padding: EdgeInsets.fromLTRB(
                                                  0,
                                                  0,
                                                  0,
                                                  100.0,
                                                ),
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount:
                                                      valueOrDefault<int>(
                                                    MediaQuery.sizeOf(context)
                                                                .width >
                                                            500.0
                                                        ? 4
                                                        : 2,
                                                    2,
                                                  ),
                                                  crossAxisSpacing: 8.0,
                                                  mainAxisSpacing: 8.0,
                                                  childAspectRatio: 0.95,
                                                ),
                                                scrollDirection: Axis.vertical,
                                                itemCount: containerVar.length,
                                                itemBuilder: (context,
                                                    containerVarIndex) {
                                                  final containerVarItem =
                                                      containerVar[
                                                          containerVarIndex];
                                                  return wrapWithModel(
                                                    model: _model
                                                        .additionalCompModels
                                                        .getModel(
                                                      containerVarItem
                                                          .reference.id,
                                                      containerVarIndex,
                                                    ),
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    updateOnChange: true,
                                                    child: AdditionalCompWidget(
                                                      key: Key(
                                                        'Key97b_${containerVarItem.reference.id}',
                                                      ),
                                                      addit: containerVarItem,
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ]
                      .divide(SizedBox(height: 24.0))
                      .addToStart(SizedBox(height: 48.0)),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.navbarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: NavbarWidget(
                    pageNumber: 3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
