import 'package:flutter/material.dart';


class Homepage2Model extends ChangeNotifier {
  /// State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  late TabController tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController.index : 0;

    void initState(BuildContext context) {}
  
  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController.dispose();
    super.dispose();
  }
}
