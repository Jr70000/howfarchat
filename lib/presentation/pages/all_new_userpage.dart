import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:howfarchat/presentation/pages/map.dart';

class AllUserPage extends StatelessWidget {
  const AllUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A2947),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: const Color(0xFF1A2947),
          automaticallyImplyLeading: true,
          title: const Text(
            '5 minutes ago',
            style: TextStyle(
              fontFamily: 'Readex Pro',
              color: Color(0xFFD8D8D8),
              fontSize: 24,
              letterSpacing: 0,
            ),
          ),
          actions: [
             Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 23),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MapWidget(),));
                },
                child: Icon(
                  Icons.location_on_outlined,
                  color: Color(0xFFD8D8D8),
                  size: 24,
                ),
              ),
            ),
          ],
          centerTitle: true,
          elevation: 4,
        ),
      ),
      body: SafeArea(
        top: true,
        child: ListView.builder(
          itemCount: 10, // Assuming there are 10 registered users
          itemBuilder: (context, index) {
            return ListTile(
              leading: const CircleAvatar(
                backgroundColor: Color(0xFFC2C2C2),
              ),
              title: Text(
                'User ${index + 1}',
                style: const TextStyle(
                  fontFamily: 'Readex Pro',
                  color: Color(0xFFD8D8D8),
                  letterSpacing: 0,
                ),
              ),
              subtitle: Text(
                '${index + 1} hrs ago',
                style: const TextStyle(
                  fontFamily: 'Readex Pro',
                  color: Color(0xFFD8D8D8),
                  letterSpacing: 0,
                ),
              ),
              trailing: const Icon(
                Icons.favorite_border,
                color: Color(0xFFD8D8D8),
                size: 16,
              ),
              onTap: () {
                // Handle user tap
              },
            );
          },
        ),
      ),
    );
  }
}
