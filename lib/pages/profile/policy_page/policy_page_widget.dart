import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'policy_page_model.dart';
export 'policy_page_model.dart';

class PolicyPageWidget extends StatefulWidget {
  const PolicyPageWidget({super.key});

  static String routeName = 'PolicyPage';
  static String routePath = '/policyPage';

  @override
  State<PolicyPageWidget> createState() => _PolicyPageWidgetState();
}

class _PolicyPageWidgetState extends State<PolicyPageWidget> {
  late PolicyPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PolicyPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'PolicyPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('POLICY_PolicyPage_ON_INIT_STATE');
      logFirebaseEvent('PolicyPage_custom_action');
      unawaited(
        () async {
          await actions.lockLandscapeMode();
        }(),
      );
      logFirebaseEvent('PolicyPage_custom_action');
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Row(
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
                      logFirebaseEvent(
                          'POLICY_PAGE_PAGE_arrowLeft24_ICN_ON_TAP');
                      logFirebaseEvent('IconButton_navigate_back');
                      context.safePop();
                    },
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      'q7l5wmel' /* Privacy policy */,
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
                  Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'h9xi9ngr' /* PRIVACY POLICY

 */
                                ,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 16.0,
                                    letterSpacing: 0.07,
                                    fontWeight: FontWeight.bold,
                                    lineHeight: 1.4,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'yygsl7cs' /* Last updated: November 2024


... */
                                ,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 14.0,
                                    letterSpacing: 0.07,
                                    fontWeight: FontWeight.normal,
                                    lineHeight: 1.4,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'qt1noxu3' /* INTERPRETATION AND DEFINITIONS... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '40v9nhjc' /* The words of which the initial... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '4idif6px' /* Definitions

 */
                                ,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'r0ivnhz3' /* For the purposes of this Priva... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'qjs6qly9' /* www.breakletics.com

 */
                                ,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).secondary,
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'on9v5aye' /* Country refers to: Berlin, Ger... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'qpw1v2a6' /* COLLECTING AND USING YOUR PERS... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'v9e1wahy' /* While using Our Service, We ma... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'fogh6n3n' /* Usage Data

 */
                                ,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'z8w9f3qi' /* Usage Data is collected automa... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '7exfkd6n' /* Information from Third-Party S... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '92r57nzo' /* The Company allows You to crea... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'bxyy1cxc' /* Information Collected while Us... */,
                              ),
                              style: GoogleFonts.urbanist(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'd9pftf4l' /* While using Our Application, i... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '6uh71371' /* Tracking Technologies and Cook... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'f8lumrsd' /* We use Cookies and similar tra... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '6dqc8pxy' /* Necessary / Essential Cookies
... */
                                ,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'ny5uz6r3' /* Type: Session Cookies

Adminis... */
                                ,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'leze0xj6' /* Cookies Policy / Notice Accept... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'ug12olui' /* Type: Persistent Cookies

Admi... */
                                ,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'q19ygppd' /* Functionality Cookies

 */
                                ,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '2wgbtrnf' /* Type: Persistent Cookies

Admi... */
                                ,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'oakw7vvn' /* Tracking and Performance Cooki... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'nxgvk8ra' /* Type: Persistent Cookies

Admi... */
                                ,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'z0zigdyo' /* Use of Your Personal Data

 */
                                ,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'yqyv55rg' /* The Company may use Personal D... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'lmlrg8t2' /* Retention of Your Personal Dat... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '86duy0kl' /* The Company will retain Your P... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'qvy4nn8z' /* Transfer of Your Personal Data... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'etb00805' /* Your information, including Pe... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'v4mc17m3' /* Disclosure of Your Personal Da... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'w4t69g2v' /* Business Transactions
If the ... */
                                ,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'ddjtk7g6' /* Security of Your Personal Data... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'gbxyt7tf' /* The security of Your Personal ... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'smm1rjb7' /* DETAILED INFORMATION ON THE PR... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'm29j84b8' /* Service Providers have access ... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '8hap8oi9' /* Analytics

 */
                                ,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '0ieb5q5v' /* We may use third-party Service... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'vbivi1lk' /* Google Analytics

 */
                                ,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '0et8i7yy' /* For more information on the pr... */,
                              ),
                              style: GoogleFonts.urbanist(
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '28h8rq59' /* https://policies.google.com/pr... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).secondary,
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'bzhcjmdm' /* Email Marketing

 */
                                ,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'xqdhqe10' /* We may use Your Personal Data ... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'd2pahrfn' /* Active Campaign

 */
                                ,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'oj6mgbfq' /* Active Campaign is an email ma... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'cq136fzm' /* https://mailchimp.com/legal/pr... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).secondary,
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'vnxextye' /* Behavioral Remarketing

 */
                                ,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'afnkwspd' /* The Company uses remarketing s... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'p2hajglx' /* Google Ads (AdWords)

 */
                                ,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'xcly9kgf' /* Google Ads (AdWords) remarketi... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '4nf22fzk' /* http://www.google.com/settings... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).secondary,
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'vvored7w' /* Google also recommends install... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '7793d9q1' /* https://tools.google.com/dlpag... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).secondary,
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'ogw62cyt' /*  – for your web browser. Googl... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'i20q2t87' /* https://policies.google.com/pr... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).secondary,
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '4zjjpp2h' /* Facebook

 */
                                ,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'qhfp5nx4' /* You can learn more about inter... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'ciyooo7x' /* https://www.facebook.com/help/... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).secondary,
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'z5xv7k5f' /* To opt-out from Facebook’s int... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '2u2do80s' /* https://www.facebook.com/help/... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).secondary,
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '0xmywyyc' /* Facebook adheres to the Self-R... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'l874qh0d' /* http://www.aboutads.info/choic... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).secondary,
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '3gat2s8y' /* , the Digital Advertising Alli... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'm5vuw7ed' /* http://youradchoices.ca/ */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).secondary,
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'p4281dp0' /* , or the European Interactive ... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '206tck0g' /* http://www.youronlinechoices.e... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).secondary,
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                's9lght0j' /* , or opt-out using your mobile... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '6qc6zm6w' /* For more information on the pr... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'wn8nligv' /* https://www.facebook.com/priva... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).secondary,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'dm54evlx' /* Payments

 */
                                ,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'idhkf8s7' /* We may provide paid products a... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '9avj3mw2' /* Apple Store In-App Payments

 */
                                ,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'gid3vnrr' /* Their Privacy Policy can be vi... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '2l5kh7u8' /* https://www.apple.com/legal/pr... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).secondary,
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '06orj1gg' /* Google Play In-App Payments

 */
                                ,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'm73mluoo' /* Their Privacy Policy can be vi... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'f20rfurq' /* https://www.google.com/policie... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).secondary,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'kk8cwriw' /* Stripe

 */
                                ,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '9vmpo1cl' /* Their Privacy Policy can be vi... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '7flaebfb' /* https://stripe.com/us/privacy
... */
                                ,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).secondary,
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'pnnljlwu' /* PayPal

 */
                                ,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'ydgmp0cd' /* Their Privacy Policy can be vi... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'm5yu4fr0' /* https://www.paypal.com/webapps... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).secondary,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                's73rkyhf' /* When You use Our Service to pa... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '74kzajxs' /* GDPR PRIVACY

Legal Basis for ... */
                                ,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'uu8p04wx' /* We may process Personal Data u... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '1kbwxdqe' /* Your Rights under the GDPR

 */
                                ,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'wairoic1' /* The Company undertakes to resp... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'h2jai3eu' /* Exercising of Your GDPR Data P... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'jpzo6iw4' /* You may exercise Your rights o... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'iaa7bfaf' /* GDPR PRIVACY

Your Rights unde... */
                                ,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'f1irwnw7' /* Under this Privacy Policy, and... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'fzzvgesc' /* Exercising Your CCPA Data Prot... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'og8tx98m' /* In order to exercise any of Yo... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'omp9zedd' /* Do Not Sell My Personal Inform... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'low57xme' /* We do not sell personal inform... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'unnve6su' /* Website

 */
                                ,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '51fapj5l' /* You can opt out of receiving a... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'bb1h1993' /* Mobile Devices

 */
                                ,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'zxt9q6jy' /* Your mobile device may give yo... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'dlsenjv4' /* “DO NOT TRACK” POLICY AS REQUI... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '8nl3x4r5' /* Our Service does not respond t... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'r014fa2a' /* CHILDREN’S PRIVACY

 */
                                ,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'trbr04fn' /* Our Service does not address a... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '926799io' /* YOUR CALIFORNIA PRIVACY RIGHTS... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '2yry8nux' /* California Business and Profes... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'hp8gy5uc' /* LINKS TO OTHER WEBSITES

 */
                                ,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'rg3174q6' /* Our Service may contain links ... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'jtu7qlu2' /* CHANGES TO THIS PRIVACY POLICY... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'qce0iq8d' /* We may update our Privacy Poli... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '7rnu9mj3' /* CONTACT US

 */
                                ,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'kn6struv' /* If you have any questions abou... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '5x963izp' /*  info@hiit-the-beat.com */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).secondary,
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            )
                          ],
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .bodyMediumIsCustom,
                              ),
                        ),
                      ),
                    ]
                        .addToStart(SizedBox(height: 24.0))
                        .addToEnd(SizedBox(height: 34.0)),
                  ),
                ),
              ),
            ),
          ].divide(SizedBox(height: 16.0)).addToStart(SizedBox(height: 48.0)),
        ),
      ),
    );
  }
}
