import 'package:flutter/material.dart';
import 'package:howfarchat/provider/images.dart';
import 'package:howfarchat/provider/tab.dart';
import 'package:howfarchat/provider/userfollow_increment.dart';
import 'package:provider/provider.dart';

class Homepage2Widget extends StatefulWidget {
  const Homepage2Widget({Key? key}) : super(key: key);

  @override
  State<Homepage2Widget> createState() => _Homepage2WidgetState();
}

class _Homepage2WidgetState extends State<Homepage2Widget>
    with TickerProviderStateMixin {
  late Homepage2Model _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserModel(), // Initialize UserModel here
      child: GestureDetector(
        onTap: () => _model.unfocusNode.canRequestFocus
            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
            : FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFF1A2947),
          body: SafeArea(
            top: true,
            child: Column(
              children: [
                Align(
                  alignment: Alignment(0, 0),
                  child: TabBar(
                    labelColor: Colors.white, // Adjust color here
                    unselectedLabelColor: Colors.white, // Adjust color here
                    labelStyle: TextStyle(
                      // Adjust text style here
                      fontFamily: 'Readex Pro',
                      letterSpacing: 0,
                    ),
                    unselectedLabelStyle: TextStyle(), // Adjust text style here
                    indicatorColor: Color(0xFF1A2947),
                    padding: EdgeInsets.all(4),
                    tabs: [
                      Tab(
                        text: 'Followers',
                      ),
                      Tab(
                        text: 'Following',
                      ),
                    ],
                    controller: _model.tabBarController,
                    onTap: (i) async {
                      [() async {}, () async {}][i]();
                    },
                  ),
                ),
                Expanded(
                  child: Consumer<UserModel>(
                    builder: (context, userModel, _) {
                      return TabBarView(
                        controller: _model.tabBarController,
                        children: [
                          ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount: userModel.followersCount,
                            itemBuilder: (context, index) {
                              return UserListItem(); // Your custom user list item
                            },
                          ),
                          ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount: userModel.followingCount,
                            itemBuilder: (context, index) {
                              return UserListItem(); // Your custom user list item
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Custom widget representing each user in the list
class UserListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Listen to the ProfilePictureProvider
    final profilePictureProvider = Provider.of<ProfilePictureProvider>(context);

    return ListTile(
      // Use Consumer to rebuild the widget when imageUrl changes
      leading: Consumer<ProfilePictureProvider>(
        builder: (context, provider, child) {
          // Use the current imageUrl from the provider
          return CircleAvatar(
            backgroundImage: NetworkImage(profilePictureProvider.imageUrl),
          );
        },
      ),
      title: Text('UserName'),
      onTap: () {
        // Handle tap on user
      },
    );
  }
}
