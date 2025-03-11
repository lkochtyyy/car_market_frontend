import 'package:flutter/material.dart';
import 'pages/homepage.dart';
import 'pages/signupscreen.dart';
import 'pages/forgetpassword.dart';
import 'pages/pass1.dart';
import 'pages/acceuil.dart';
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
            '/': (context) => const LoginPage(),
            '/signupscreen': (context) => SignUpScreen(),
            '/forgotpassword': (context) => ForgotPasswordPage(),
            '/pass1': (context) => OnboardingScreen(),
            '/acceuil': (context) => AcceuilPage(),
          },
        );
      },
    );
  }
}

