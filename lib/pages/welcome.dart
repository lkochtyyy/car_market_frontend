import 'package:flutter/material.dart';
import 'package:pfe_frontend/pages/login.dart' as login_page;
import 'package:pfe_frontend/pages/signupscreen.dart' as signup_page; // Correction du chemin de l'inscription

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFFD5F3F9), // Couleur de fond que vous avez choisie
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/welcome.png', // Vérifie bien le chemin de l'image
                width: 250, // Ajusté pour un meilleur rendu
                height: 250,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 60), // Espacement amélioré
              CustomButton(
                text: 'Se connecter', // Texte normalisé
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const login_page.LoginPage()),
                  );
                },
              ),
              const SizedBox(
                  height: 20), // Réduction de l'espacement entre les boutons
              CustomButton(
                text: 'S’inscrire', // Texte normalisé
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const signup_page.RegisterScreen()),
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

  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: 220, // Légèrement plus large pour plus d'équilibre
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Ombre améliorée
            blurRadius: 12,
            spreadRadius: 1,
            offset: const Offset(0, 6),
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
          padding: const EdgeInsets.symmetric(vertical: 16),
          elevation: 5, // Légère élévation pour plus d'effet de profondeur
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily:
                'Roboto', // Choisir une police classique si SF Pro non disponible
            letterSpacing: 1.2, // Espacement des lettres pour un effet moderne
          ),
        ),
      ),
    );
  }
}
