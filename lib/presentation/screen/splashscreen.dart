import 'package:flutter/material.dart';
import 'package:howfarchat/constant/app_image.dart';
import 'package:howfarchat/presentation/screen/sign_up.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Use a variable to hold the CircularProgressIndicator
    Widget circularIndicator = const CircularProgressIndicator(
      color: Color.fromARGB(255, 5, 83, 147),
    );

    // Navigate to the next screen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const SignupWidget(),
        ),
      );
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(50, 80, 0, 0),
            child: Image.asset(AppImage.image1),
          ),
          // Position the CircularProgressIndicator at the center
          Positioned.fill(
            child: Center(
              child: circularIndicator,
            ),
          ),
        ],
      ),
    );
  }
}
