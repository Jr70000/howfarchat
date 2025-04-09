import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserController {
  static Future<User?> loginWithGoogle() async {
    try {
      // Start the Google sign-in process
      final GoogleSignInAccount? googleAccount = await GoogleSignIn().signIn();

      if (googleAccount != null) {
        // Get authentication details
        final GoogleSignInAuthentication googleAuth =
            await googleAccount.authentication;

        // Create a credential with the access and ID tokens
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Sign in to Firebase with the credential
        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        // Return the signed-in user
        return userCredential.user;
      } else {
        // User canceled the sign-in process
      
        return null;
      }
    } catch (error) {
      // Handle any errors that occurred during the sign-in process
    
      return null;

      
    }
  }
}
