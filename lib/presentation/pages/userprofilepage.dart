import 'package:flutter/material.dart';
import 'package:howfarchat/provider/images.dart';
import 'package:howfarchat/provider/location.dart';
import 'package:howfarchat/provider/userfollow_increment.dart';
import 'package:howfarchat/utils/app_navbar.dart';
import 'package:provider/provider.dart';

class ProfileUserPageWidget extends StatefulWidget {
  const ProfileUserPageWidget({super.key});

  @override
  State<ProfileUserPageWidget> createState() => _ProfileUserPageWidgetState();
}

class _ProfileUserPageWidgetState extends State<ProfileUserPageWidget> {
  void _changeProfilePicture(String newImageUrl) {
    Provider.of<ProfilePictureProvider>(context, listen: false)
        .setImageUrl(newImageUrl);
  }
  void handleFollow() {
    Provider.of<UserModel>(context, listen: false).incrementFollowing();
    // You may also update the count for the user being followed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A2947),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: const Color(0xFF1A2947),
          title: const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 356, 0),
            child: Text(
              'Profile',
              style: TextStyle(
                fontFamily: 'Readex Pro',
                color: Color(0xFFD8D8D8),
                fontSize: 24,
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu_rounded,
                color: Color(0xFFD8D8D8),
                size: 24,
              ),
            ),
          ],
          centerTitle: true,
          elevation: 4,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Consumer<ProfilePictureProvider>(
                builder: (context, profilePictureProvider, _) {
                  return GestureDetector(
                    onTap: () {
                      _changeProfilePicture(
                          'assets/images/medium-shot-smiley-woman-taking-selfie_2.jpg');
                    },
                    child: CircleAvatar(
                      radius: 45,
                      // ignore: unnecessary_null_comparison
                      backgroundImage: profilePictureProvider.imageUrl != null
                          ? NetworkImage(profilePictureProvider.imageUrl!)
                              as ImageProvider<Object>
                          : const AssetImage(
                              'assets/images/medium-shot-smiley-woman-taking-selfie_2.jpg'),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              Consumer<LocationProvider>(
                  builder: (context, locationProvider, _) {
                return  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: Color(0xFFFBD512),
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      locationProvider.userLocation.isEmpty
                      ?locationProvider.userLocation:'Updating location...',
                      style: const TextStyle(
                         fontFamily: 'Readex Pro',
                        color: Color(0xFFD8D8D8),
                      ),
                    )
                  ],
                );
              }),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        'Follower',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          color: Color(0xFFD8D8D8),
                        ),
                      ),
                      Text(
                        '0',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          color: Color(0xFFD8D8D8),
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Post',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          color: Color(0xFFD8D8D8),
                        ),
                      ),
                      Text(
                        '0',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          color: Color(0xFFD8D8D8),
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Following',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          color: Color(0xFFD8D8D8),
                        ),
                      ),
                      Text(
                        '0',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          color: Color(0xFFD8D8D8),
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(
                color: Color(0xFFA7A7A7),
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(height: 5),
              Container(
                alignment: const Alignment(-0.07, 0.28),
                width: 345,
                height: 208,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(323, 0, 0, 0),
                child: Row(
                  children: [
                    Icon(
                      Icons.chat_bubble_outline_rounded,
                      color: Color(0xFFD8D8D8),
                      size: 16,
                    ),
                    SizedBox(width: 5),
                    Text(
                      '9',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        color: Color(0xFFD8D8D8),
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.favorite_border,
                      color: Color(0xFFD8D8D8),
                      size: 16,
                    ),
                    SizedBox(width: 5),
                    Text(
                      '14',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        color: Color(0xFFD8D8D8),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A2947),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'The sun is a daily reminder that we too can rise from the darkness, that we too can shine our own light',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        color: Color(0xFFD8D8D8),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: CustomBottomNavBar(
                  currentIndex: 1,
                  onTap: (int index) {
                    // Your onTap logic here
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
