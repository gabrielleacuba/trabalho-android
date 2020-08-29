import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:trabalho/home/enter_house_page.dart';
import 'package:trabalho/home/home_page.dart';
import 'package:trabalho/home/welcome_page.dart';
import 'package:trabalho/pages/auth/register_member_page.dart';
import 'package:trabalho/pages/error_page.dart';
import 'package:trabalho/pages/splash_screen.dart';
import 'package:trabalho/theme/theme_manager.dart';
import 'package:trabalho/wrapper.dart';
import 'pages/auth/register_house.dart';
import 'routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeManager.defaultTheme(),
      debugShowCheckedModeBanner: false,
      home: Startup(),
      routes: {
        Routes.registerHouse: (_) => RegisterHouse(),
        Routes.registerMember: (_) => RegisterMember(),
        Routes.welcomePage: (_) => WelcomePage(),
        Routes.enterHousePage: (_) => EnterHousePage(),
        Routes.homePage: (_) => HomePage(),
      },
    );
  }
}

class Startup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> app = Firebase.initializeApp();

    return FutureBuilder<FirebaseApp>(
      future: app,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorPage();
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return Wrapper();
        }

        return SplashScreen();
      },
    );
  }
}
