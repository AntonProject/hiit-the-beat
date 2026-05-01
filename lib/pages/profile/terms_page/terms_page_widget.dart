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
import 'terms_page_model.dart';
export 'terms_page_model.dart';

class TermsPageWidget extends StatefulWidget {
  const TermsPageWidget({super.key});

  static String routeName = 'TermsPage';
  static String routePath = '/termsPage';

  @override
  State<TermsPageWidget> createState() => _TermsPageWidgetState();
}

class _TermsPageWidgetState extends State<TermsPageWidget> {
  late TermsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'TermsPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('TERMS_PAGE_PAGE_TermsPage_ON_INIT_STATE');
      logFirebaseEvent('TermsPage_custom_action');
      unawaited(
        () async {
          await actions.lockLandscapeMode();
        }(),
      );
      logFirebaseEvent('TermsPage_custom_action');
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
                          'TERMS_PAGE_PAGE_arrowLeft24_ICN_ON_TAP');
                      logFirebaseEvent('IconButton_navigate_back');
                      context.safePop();
                    },
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      'qd3rx64d' /* Terms & conditions */,
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
                                'wfo5zhc6' /* TERMS AND CONDITIONS – BREAKLE... */,
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
                                '11jk5d9h' /* HIIT the Beat & BREAKLETICS co... */,
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
                                'izylydxv' /* 2. Scope

2.1. Parties to the ... */
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
                                'jgqjdkni' /* These General Terms and Condit... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'c9iuu5f6' /* 2.2. Terms and conditions for ... */,
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
                                'epmwbahx' /* A condition for opening a user... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'yk8ovu46' /* 2.3. Additional terms and cond... */,
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
                                'hlikr382' /* We reserve the right to agree ... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                't636bn94' /* 3. Your Health

3.1. Terms and... */
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
                                'm3z5s105' /* Use of the HIIT the Beat & BRE... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'sm1sodu1' /* 3.2. No substitute for medical... */,
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
                                'ffp0wtwt' /* The services and information o... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '6eo5h3nf' /* 3.3. Training-/Dietary Methods... */,
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
                                'xpfrkxye' /* Fitness and/or nutritional adv... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'yu6zti7y' /* 4. Breakletics Services and Pr... */,
                              ),
                              style: GoogleFonts.urbanist(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '5lvxbu85' /* The scope of the services incl... */,
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
                                'ty2y8nz5' /* 4.2. Prices

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
                                '71xw0cav' /* Please consult the website www... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '9ql8r61n' /* 5. User Account

5.1. Registra... */
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
                                'vsj8gjz8' /* In order to use the Breakletic... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '4e3d0hbh' /* 6. Conclusion of a Contract

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
                                'h3apvdkq' /* How the respective contract is... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'ki77838z' /* 6.1. Online registration on th... */,
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
                                'wzkpsefd' /* www.hiit-the-beat.com

 */
                                ,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).secondary,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '31k76pf9' /* When signing up for our websit... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'ib00fpxh' /* 6.2. Conclusion of a contract ... */,
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
                                'xuqboe95' /* You can purchase individual ad... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'ui3zn03n' /* 6.3. Correction of input error... */,
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
                                'fv8y3eec' /* If you would like to purchase ... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'vlmser1l' /* 7. NEWSLETTER

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
                                'g5u2r96w' /* Breakletics sends newsletters ... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'ps1dtmng' /* 8. Term of Validity

8.1. User... */
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
                                'jc7z55zd' /* The user contract concluded be... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '4d3hlx6o' /* 8.2. One-off additional servic... */,
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
                                'vui4k6jh' /* One-off additional services ma... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'kqtq006o' /* 8.3. Subscriptions

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
                                't3jhk2h2' /* Our subscriptions are offered ... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '7654ar40' /* 9. Terms and Conditions of Pay... */,
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
                                'pvseqxy7' /* Fees are collected when the co... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'pbbeomk4' /* 9.2. Payment default

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
                                '79gjz5t0' /* We reserve the right to assert... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '54h6ly65' /* 10. Payment Methods

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
                                'afmh446u' /* An overview over our accepted ... */,
                              ),
                              style: GoogleFonts.urbanist(
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'uhh0b1hx' /* 11. Right to Cancel

11.1. Can... */
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
                                '8yugdc9t' /* If you have entered into a con... */,
                              ),
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'omzrmpqp' /* 12. Consequences of cancellati... */,
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
                                '3vz7vd1y' /* If you cancel the contract we ... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'efqeew33' /* 13. Lapse of the right of canc... */,
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
                                '4owlal2e' /* In the case of a contract for ... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'pau37e2r' /* 14. Liability for Defects

14.... */
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
                                'vhehyub0' /* Statutory provisions apply to ... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'k7tnva2g' /* 14.2. Disclaimer of guarantees... */,
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
                                'z9zkzf9b' /* We do not make any representat... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'l3qqsfcx' /* 15. Liability

15.1. General

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
                                '8qknkohw' /* Concerning our Breakletics ser... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'oq7tsaam' /* 15.2. Liability for services p... */,
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
                                'mz0bocvt' /* For services provided free of ... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'oe3trzns' /* 15.3. Liability for services p... */,
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
                                'rku3rm5m' /* In the case of services provid... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'p6lin2o2' /* 15.4. Liability of our employe... */,
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
                                'miw7k3t8' /* To the extent that our liabili... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'js9juuko' /* 15.5. Product liability

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
                                'asv0jmxc' /* Claims under the German Produc... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '6yrlztok' /* 16. Rights of Use over Breakle... */,
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
                                'n7y81m8j' /* The services offered by us are... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'yrbx3mvu' /* 17. Responsibility for User-Ge... */,
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
                                'ib8sasz3' /* You are solely responsible for... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'ydoz9ho7' /* 17.2. ompliance with statutory... */,
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
                                'l0303fky' /* When supplying your own conten... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '1pryc2hu' /* 17.3. Indemnification

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
                                'w2ilxml6' /* If you infringe the principles... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '3qvwxb9q' /* 18. Collected Data

18.1. Nutz... */
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
                                't3xjktet' /* Breakletics is collecting data... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '35ng7cib' /* 19. Ending the Contract

19.1.... */
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
                                'b3otr8id' /* You have the right to cancel y... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '2pdsce4w' /* 19.2. Subscription

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
                                'goiheqn1' /* Every subscription for a Break... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'p6kg6dti' /* 19.3. Cancellation for good ca... */,
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
                                'g4n94g96' /* The right to cancel for good c... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'jpyzqqj2' /* 20. Changes to the General Ter... */,
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
                                'gk9r2bya' /* Breakletics retains the right ... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'r783xvd9' /* 20.1 General 

20.2

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
                                '3q14b4ur' /* Changes of these terms and con... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'o17m6v2f' /* 20.3

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
                                '2bm71bko' /* If the user does not agree wit... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'hsr3g415' /* 20.4

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
                                '3tqep5va' /* Information on the provider
B... */
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
                                'cu5i3e23' /* 21. Final Provision

21.1. App... */
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
                                'r3ojk3jv' /* Between the two parties, only ... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'wrhi807g' /* 21.2. Place of jurisdiction

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
                                'zy6371ym' /* If you do not have a place of ... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'hgkcb24o' /* 21.3. Language of the contract... */,
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
                                '5brnidmm' /* The language of the contract i... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'wqw5peb4' /* 21.4. Severability clause

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
                                'v7kjdq5s' /* Should any individual provisio... */,
                              ),
                              style: GoogleFonts.urbanist(
                                color: FlutterFlowTheme.of(context).primaryText,
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
