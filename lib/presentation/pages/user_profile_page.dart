import 'package:flutter/material.dart';
import 'package:howfarchat/utils/app_navbar.dart';

class UserProfilepage3Widget extends StatefulWidget {
  const UserProfilepage3Widget({Key? key}) : super(key: key);

  @override
  State<UserProfilepage3Widget> createState() => _UserProfilepage3WidgetState();
}

class _UserProfilepage3WidgetState extends State<UserProfilepage3Widget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A2947),
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, _) => [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.width * 0.8,
            collapsedHeight: 80,
            pinned: true,
            floating: false,
            backgroundColor: const Color(0xFF1A2947),
            automaticallyImplyLeading: true,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/medium-shot-smiley-woman-taking-selfie_2.jpg',
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width * 0.8,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.settings_outlined,
                    color: Colors.white,
                    size: 24,
                  ),
                  const Align(
                    alignment: AlignmentDirectional(-0.85, -0.58),
                    child: Icon(
                      Icons.arrow_back_ios_outlined,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const Align(
                    alignment: AlignmentDirectional(-0.57, 0.41),
                    child: Text(
                      'Sarah Fernandez',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                        fontSize: 24,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                  const Align(
                    alignment: AlignmentDirectional(-0.72, 0.59),
                    child: Icon(
                      Icons.location_on_outlined,
                      color: Color(0xFFFBD512),
                      size: 19,
                    ),
                  ),
                  const Align(
                    alignment: AlignmentDirectional(-0.60, 0.58),
                    child: Text(
                      'Location',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                ],
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            elevation: 4,
          )
        ],
        body: Builder(
          builder: (context) {
            return SafeArea(
              top: false,
              child: Stack(
                children: [
                  const Align(
                    alignment: AlignmentDirectional(-0.01, -0.86),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                      child: Text(
                        '0',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                          fontSize: 24,
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: AlignmentDirectional(0.54, -0.85),
                    child: Text(
                      '0',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                        fontSize: 24,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                  const Align(
                    alignment: AlignmentDirectional(0.61, -0.69),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                      child: Text(
                        'Followers',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: AlignmentDirectional(-0.55, -0.85),
                    child: Text(
                      '0',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                        fontSize: 24,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                  const Align(
                    alignment: AlignmentDirectional(-0.63, -0.68),
                    child: Text(
                      'Following',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                  const Align(
                    alignment: AlignmentDirectional(0, -0.69),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                      child: Text(
                        'Post',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-0.1, -0.1),
                    child: Container(
                      width: 345,
                      height: 208,
                      decoration: const BoxDecoration(
                        color: Color(0xFFD8D8D8),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(19),
                          bottomRight: Radius.circular(19),
                          topLeft: Radius.circular(19),
                          topRight: Radius.circular(19),
                        ),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: AlignmentDirectional(0.57, 0.49),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                      child: Icon(
                        Icons.chat_bubble_outline_rounded,
                        color: Color(0xFFD8D8D8),
                        size: 16,
                      ),
                    ),
                  ),
                   const Align(
                    alignment: AlignmentDirectional(0.35, 0.49),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                      child: Icon(
                        Icons.favorite_border_outlined,
                        color: Color(0xFFD8D8D8),
                        size: 16,
                      ),
                    ),
                  ),
                  const Align(
                    alignment: AlignmentDirectional(0.42, 0.49),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 9, 0, 0),
                      child: Text(
                        '9',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          color: Color(0xFFD8D8D8),
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: AlignmentDirectional(0.71, 0.49),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 8, 0),
                      child: Text(
                        '14',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          color: Color(0xFFD8D8D8),
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(100,497,0,0),
                    child: CustomBottomNavBar(currentIndex: 1, onTap: (int ) { },),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
