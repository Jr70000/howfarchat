import 'package:flutter/material.dart';


class HomePageModel extends ChangeNotifier {
  List<UserData> _users = []; // List of users

  List<UserData> get users => _users;

  // Method to update users
  void updateUsers(List<UserData> newUsers) {
    _users = newUsers;
    notifyListeners(); // Notify listeners about the change
  }
}

// Model class to represent user data
class UserData {
  final String name;
  final String imageUrl;

  UserData({required this.name, required this.imageUrl});
}
