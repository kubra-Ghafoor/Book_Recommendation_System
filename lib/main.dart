// main.dart

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authentication/search_screen.dart';
import 'package:flutter_authentication/splash_screen.dart';
import 'package:flutter_authentication/user-provider.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'forgot_password.dart';
import 'login_screen.dart';
import 'signup_screen.dart';
import 'home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.purple),
        home: SplashScreen(),
        routes: {
          '/login': (context) => LoginScreen(),
          '/forgot password':(context) => ForgotPasswordScreen(),
          '/signup': (context) => SignUpScreen(),
          '/home': (context) => const HomeScreen(),
          '/search': (context) => Search(
                name: '1984',
              ),
        },
      ),
    );
  }
}
