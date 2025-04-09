import 'package:flutter/material.dart';

// Define your User model
class User {
  final String username;
  final String bio;
  final String avatarUrl;

  User({
    required this.username,
    required this.bio,
    required this.avatarUrl,
  });
}

class FavoritePageModel extends ChangeNotifier {
  List<User> _likedUsers = [];

  List<User> get likedUsers => _likedUsers;

  void loadLikedUsers() {
    // Load liked users from wherever you store them (e.g., database, shared preferences, etc.)
    // For demonstration purposes, let's add some dummy users
    _likedUsers = [
      User(
        username: 'User1',
        bio: 'Bio of User1',
        avatarUrl: 'https://via.placeholder.com/150', // Example URL
      ),
      User(
        username: 'User2',
        bio: 'Bio of User2',
        avatarUrl: 'https://via.placeholder.com/150', // Example URL
      ),
      // Add more users as needed
    ];

    notifyListeners();
  }

  void addLikedUser(User user) {
    _likedUsers.add(user);
    notifyListeners();
  }

  void removeLikedUser(User user) {
    _likedUsers.remove(user);
    notifyListeners();
  }
}
