import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:howfarchat/presentation/pages/all_new_userpage.dart';
import 'package:howfarchat/presentation/pages/homepage.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          height: 70,
          width: 345,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: onTap,
              items: [
                BottomNavigationBarItem(
                  icon: GestureDetector(
                    child: Icon(Icons.home_outlined,
                    color: Color(0xFF303030),),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage(),));
                    },
                  ),
                  label: 'Home',
                  backgroundColor: Color.fromARGB(255, 16, 15, 15),
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0,12,0,0),
                    child: Icon(Icons.favorite_border,
                    color: Color(0xFF303030),),
                  ),
                  label: 'Love',
                ),
                BottomNavigationBarItem(
                  icon: GestureDetector(
                    child: Icon(Icons.messenger_outline_rounded,
                    color: Color(0xFF303030),),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline_rounded,
                  color: Color(0xFF303030),),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0,0,0,40),
          child: Positioned(
            bottom: 35, // Adjust position as needed
            child: FloatingActionButton(
              onPressed: () {
                // Add onPressed logic
              },
              backgroundColor: Color.fromARGB(255, 243, 243, 33),
              shape: CircleBorder(),
              child:const Icon(Icons.add), // Set desired background color
            ),
          ),
        ),
      ],
    );
  }
}
