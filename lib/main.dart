import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:howfarchat/firebase_options.dart';
import 'package:howfarchat/presentation/pages/chatpage.dart';
import 'package:howfarchat/provider/favorite.dart';
import 'package:howfarchat/provider/homepage.dart';
import 'package:howfarchat/provider/images.dart';
import 'package:howfarchat/provider/location.dart';
import 'package:howfarchat/provider/userfollow_increment.dart';
import 'package:howfarchat/services/auth_service.dart';
import 'package:howfarchat/services/chat_services.dart';
import 'package:provider/provider.dart';
import 'package:connectivity/connectivity.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(create: (context) => ProfilePictureProvider()),
        ChangeNotifierProvider(create: (context) => LocationProvider()),
        ChangeNotifierProvider(create: (context) => UserModel()),
        ChangeNotifierProvider(create: (context) => FavoritePageModel()),
        ChangeNotifierProvider(create: (context) => HomePageModel()),
        ChangeNotifierProvider(create: (context) => ChatService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'How far Chat',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: ChatpageWidget(receiverUserEmail: '', receiverUserID: '', message: "",));
  }

  Future<bool> checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
}
