import 'package:flutter/material.dart';
import 'package:howfarchat/provider/homepage.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model =
        Provider.of<HomePageModel>(context); // Access HomePageModel instance

    return Scaffold(
      backgroundColor: Color(0xFF1A2947),
      appBar: AppBar(
        backgroundColor: Color(0xFF1A2947),
        automaticallyImplyLeading: false,
        title: Text(
          'Profiles',
          style: TextStyle(
            fontFamily: 'Outfit',
            color: Colors.white,
            fontSize: 22,
            letterSpacing: 0,
          ),
        ),
        centerTitle: false,
        elevation: 2,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: model.users.length,
          itemBuilder: (context, index) {
            UserData user = model.users[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(user.imageUrl),
              ),
              title: Text(
                user.name,
                style: TextStyle(
                  fontFamily: 'Readex Pro',
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
