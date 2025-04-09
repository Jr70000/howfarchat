import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:howfarchat/presentation/pages/profilepage.dart';
import 'package:howfarchat/presentation/screen/splashscreen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), 
      builder: (context, snapshot){
        if(snapshot.hasData){
          return const CreateProfilePage();
        }
        else{
          return const SplashScreen();
        }
      }),
    );
  }
}