import '/flutter_flow/flutter_flow_util.dart';
import 'profile_edit_page_widget.dart' show ProfileEditPageWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileEditPageModel extends FlutterFlowModel<ProfileEditPageWidget> {
  ///  Local state fields for this page.

  String? photo;

  String? genderEn = 'Male';

  bool photoCheck = false;

  String? genderDe = 'Männlich';

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'iucaudhi' /* Fill in the field */,
      );
    }

    if (val.length < 2) {
      return FFLocalizations.of(context).getText(
        'z32b285m' /* Min 2 symbols */,
      );
    }
    if (val.length > 50) {
      return FFLocalizations.of(context).getText(
        'go07m07e' /* Max 50 symbols */,
      );
    }

    return null;
  }

  // State field(s) for Surname widget.
  FocusNode? surnameFocusNode;
  TextEditingController? surnameTextController;
  String? Function(BuildContext, String?)? surnameTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for Weightkg widget.
  FocusNode? weightkgFocusNode;
  TextEditingController? weightkgTextController;
  String? Function(BuildContext, String?)? weightkgTextControllerValidator;
  // State field(s) for Heightcm widget.
  FocusNode? heightcmFocusNode;
  TextEditingController? heightcmTextController;
  String? Function(BuildContext, String?)? heightcmTextControllerValidator;

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    surnameFocusNode?.dispose();
    surnameTextController?.dispose();

    weightkgFocusNode?.dispose();
    weightkgTextController?.dispose();

    heightcmFocusNode?.dispose();
    heightcmTextController?.dispose();
  }
}
