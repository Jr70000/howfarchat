import 'package:flutter/material.dart';

class MapModel extends ChangeNotifier {
  // State fields for stateful widgets in this page.
  final unfocusNode = FocusNode();

  @override
  void dispose() {
    unfocusNode.dispose();
    super.dispose();
  }
}
