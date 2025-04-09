import 'package:flutter/material.dart';

class CreateProfilePageModel extends ChangeNotifier{
  TextEditingController? textControllerUsername;
  TextEditingController? textControllerFirstname;
  TextEditingController? textControllerLastname;
  TextEditingController? textControllerPhonenumber;
  TextEditingController? textControllerLocation;
  TextEditingController? textControllerBirthday;

  FocusNode? textFieldFocusNodeUsername;
  FocusNode? textFieldFocusNodeFirstname;
  FocusNode? textFieldFocusNodeLastname;
  FocusNode? textFieldFocusNodePhonenumber;
  FocusNode? textFieldFocusNodeLocation;
  FocusNode? textFieldFocusNodeBirthday;

  @override
  void dispose() {
    super.dispose();
    textControllerUsername?.dispose();
    textControllerFirstname?.dispose();
    textControllerLastname?.dispose();
    textControllerPhonenumber?.dispose();
    textControllerLocation?.dispose();
    textControllerBirthday?.dispose();

    textFieldFocusNodeUsername?.dispose();
    textFieldFocusNodeFirstname?.dispose();
    textFieldFocusNodeLastname?.dispose();
    textFieldFocusNodePhonenumber?.dispose();
    textFieldFocusNodeLocation?.dispose();
    textFieldFocusNodeBirthday?.dispose();
  }
}
