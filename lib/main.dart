import 'package:flutter/material.dart';
import 'package:pfe_frontend/pages/firstmsg.dart';
import 'package:pfe_frontend/pages/messagerie.dart';
import 'package:pfe_frontend/pages/pagedacceuil.dart';
import 'package:pfe_frontend/pages/profile.dart';
import 'package:pfe_frontend/pages/publier.dart';
import 'package:pfe_frontend/pages/resetpassword.dart';
import 'pages/welcome.dart';
import 'pages/signupscreen.dart' hide LoginPage;
import 'pages/forgetpassword.dart';
import 'pages/pass1.dart';
import 'pages/login.dart';
import 'pages/favoris.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // ✅ Initialisation correcte
      designSize: const Size(375, 812), // Mets la taille de ton design ici
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => const OnboardingScreen(),
            '/welcome': (context) => const WelcomeScreen(),
            '/signupscreen': (context) => const RegisterScreen(),
            '/forgotpassword': (context) => const ForgotPasswordScreen(),
            '/resetpassword': (context) => const ResetPasswordPage(),
            '/login': (context) => const LoginPage(),
            '/pagedaccueil': (context) => const FeaturedCarsPage(),
            '/favoris': (context) => FavorisPage(),
            '/messagerie': (context) => const ChatsPage(),
            '/publier': (context) => const PublierAnnoncePage(),
            '/firstmsg': (context) => const ChatApp(),
            '/profile': (context) => const EditProfilePage(),
          },
        );
      },
    );
  }
}
