import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  int followersCount = 0;
  int followingCount = 0;
  int postsCount = 0;

  void incrementFollowers() {
    followersCount++;
    notifyListeners();
  }

  void decrementFollowers() {
    followersCount--;
    notifyListeners();
  }

  void incrementFollowing() {
    followingCount++;
    notifyListeners();
  }

  void decrementFollowing() {
    followingCount--;
    notifyListeners();
  }

  void incrementPosts() {
    postsCount++;
    notifyListeners();
  }
}
