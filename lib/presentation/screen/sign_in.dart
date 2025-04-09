import 'package:facebook_login/facebook_login.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:howfarchat/presentation/pages/all_new_userpage.dart';
import 'package:provider/provider.dart';

import 'package:howfarchat/constant/app_image.dart';
import 'package:howfarchat/constant/app_text.dart';
import 'package:howfarchat/controller/user_controller.dart';
import 'package:howfarchat/presentation/pages/profilepage.dart';
import 'package:howfarchat/services/auth_service.dart';
import 'package:howfarchat/utils/app_button.dart';
import 'package:howfarchat/utils/app_richtext.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({
    super.key,
  });

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  late bool _passwordVisible;
  late GoogleSignIn _googleSignIn = GoogleSignIn();



  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordVisible = false;
    _googleSignIn = GoogleSignIn();
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      backgroundColor: const Color(0xFF1A2947),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(19),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
                child: Column(
                  children: [
                    Text(
                      AppText.welcome,
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        color: Color(0xFFD8D8D8),
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      AppText.logintocontinue,
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        color: Color(0xFFD8D8D8),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 80),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: const TextStyle(
                    fontFamily: 'Readex Pro',
                    color: Color(0xFFD8D8D8),
                    fontWeight: FontWeight.w600,
                  ),
                  filled: true,
                  fillColor: const Color(0xFF707070),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                obscureText: false,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: const TextStyle(
                    fontFamily: 'Readex Pro',
                    color: Color(0xFFD8D8D8),
                    fontWeight: FontWeight.w600,
                  ),
                  filled: true,
                  fillColor: const Color(0xFF707070),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                ),
                obscureText: !_passwordVisible,
              ),
              const SizedBox(height: 3),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(320, 0, 0, 50),
                child: MyRichText(),
              ),
              ElevatedButton(
                onPressed: () async {
          final email = _usernameController.text;
          final password = _passwordController.text;
          // Check if user credentials exist
          final authService = Provider.of<AuthService>(context, listen: false);
          final userExists = await authService.checkUserCredentialsExist(email);
          if (userExists) {
            // If user exists, proceed with login
            
             Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) =>
                            AllUserPage(), // Replace HomePage with your homepage widget
                      ),
                    );
          } else {
            // If user does not exist, handle accordingly (e.g., show error message)
            print('User does not exist');
          }
        },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFBD512),
                  minimumSize: const Size(267, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Log in',
                  style: TextStyle(
                      fontFamily: 'Readex Pro',
                      fontSize: 16,
                      letterSpacing: 0,
                      color: Color(0xFF000000)),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: const AlignmentDirectional(0.01, 0.01),
                child: Column(
                  children: [
                    const Text(
                      AppText.orsigninwith,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xFFD8D8D8)),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.01, 0.01),
                      child: Column(
                        children: [
                          SizedBox(
                              height: 48,
                              width: 291,
                              child: CustomButton(
                                color: const Color(0xFFFFFFFF),
                                height: 20,
                                image: const AssetImage(
                                  AppImage.google,
                                ),
                                text: AppText.loginwithgoogle,
                                onPressed: () async {
                                  try {
                                    final user =
                                        await UserController.loginWithGoogle();
                                    if (user != null && mounted) {
                                      // ignore: use_build_context_synchronously
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const CreateProfilePage(),
                                        ),
                                      );
                                    }
                                  } catch (e) {
                                    // Handle any errors that occur during login
                                  }
                                },
                              ))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.01, 0.01),
                      child: Column(
                        children: [
                          SizedBox(
                              height: 48,
                              width: 291,
                              child: CustomButton(
                                color: const Color(0xFFFFFFFF),
                                height: 20,
                                image: const AssetImage(AppImage.facebook),
                                text: AppText.loginwithfacebook,
                               onPressed: () {}
                              ))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          AppText.donthaveaccount,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFA7A7A7)),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CreateProfilePage(),
                                ));
                          },
                          child: const Text(
                            AppText.signup,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFFBD512)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
