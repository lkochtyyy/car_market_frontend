import 'package:flutter/material.dart';
import 'package:pfe_frontend/pages/login.dart';
import 'package:pfe_frontend/pages/signupscreen.dart'; // Correction du chemin de l'inscription

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD5F3F9), // Couleur de fond
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/welcome.png', // Vérifie bien le chemin de l'image
                width: 280, // Ajusté pour un meilleur rendu
                height: 280,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 50), // Espacement amélioré
              CustomButton(
                text: 'Se Connecter', // Texte en français
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
              SizedBox(height: 20), // Réduction de l'espacement entre les boutons
              CustomButton(
                text: 'S’inscrire',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  CustomButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220, // Légèrement plus large pour plus d'équilibre
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Ombre améliorée
            blurRadius: 12,
            spreadRadius: 1,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.symmetric(vertical: 16),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: 'SF Pro', // Assure-toi que SF Pro est bien utilisé
          ),
        ),
      ),
    );
  }
}
