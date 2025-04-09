import 'package:flutter/material.dart';
import 'package:howfarchat/provider/favorite.dart';
import 'package:provider/provider.dart';


class FavoritePageWidget extends StatefulWidget {
  const FavoritePageWidget({Key? key}) : super(key: key);

  @override
  State<FavoritePageWidget> createState() => _FavoritePageWidgetState();
}

class _FavoritePageWidgetState extends State<FavoritePageWidget> {
  late FavoritePageModel _model;

  @override
  void initState() {
    super.initState();
    // Initialize the model
    _model = Provider.of<FavoritePageModel>(context, listen: false);
    _model.loadLikedUsers(); // Load liked users from wherever you store them
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A2947),
      appBar: AppBar(
        backgroundColor: Color(0xFF1A2947),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Favorites',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontStyle: FontStyle.italic,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: _model.likedUsers.length,
          itemBuilder: (context, index) {
            final likedUser = _model.likedUsers[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(likedUser.avatarUrl),
              ),
              title: Text(likedUser.username),
              subtitle: Text(likedUser.bio),
              onTap: () {
                // Handle tapping on a liked user
              },
            );
          },
        ),
      ),
    );
  }
}
