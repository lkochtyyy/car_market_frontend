import 'package:flutter/material.dart';
import 'pages/welcome.dart';
import 'pages/signupscreen.dart';
import 'pages/forgetpassword.dart';
import 'pages/pass1.dart';
import 'pages/login.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit( // ✅ Initialisation correcte
      designSize: const Size(375, 812), // Mets la taille de ton design ici
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => OnboardingScreen(),
            '/welcome' : (context) => WelcomeScreen(),
            '/signupscreen': (context) => RegisterScreen(),
            '/forgotpassword': (context) => ForgotPasswordScreen(),
            '/login': (context) => LoginPage(),
          },
        );
      },
    );
  }
}

