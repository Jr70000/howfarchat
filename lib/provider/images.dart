import 'package:flutter/material.dart';

class ProfilePictureProvider extends ChangeNotifier {
  String _imageUrl= 'assets/images/medium-shot-smiley-woman-taking-selfie_2.jpg';

  String get imageUrl => _imageUrl;

  void setImageUrl(String url) {
    _imageUrl = url;
    notifyListeners();
  }
}
