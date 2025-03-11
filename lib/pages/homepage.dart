import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Titre
                const Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),

                // Champ Email
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    hintText: "Username or Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // Champ Mot de passe
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: const Icon(Icons.visibility),
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Lien "Forgot Password"
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/forgotpassword');
                    },
                    child: const Text("Forgot Password?"),
                  ),
                ),
                const SizedBox(height: 20),

                // Bouton Login
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/pass1');
                    },
                    child: const Text("Login", style: TextStyle(
                               fontSize: 18,
                              color: Colors.white, // Correction ici
                                ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Bouton Register
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/signupscreen');
                    },
                    child: const Text("Register",  style: TextStyle(
                               fontSize: 18,
                              color: Colors.white, // Correction ici
                                ),),
                  ),
                ),
                const SizedBox(height: 20),

                // Texte "Se connecter en tant qu’invité"
                Text(
                  "Se connecter autant qu’un invité",
                  style: TextStyle(color: Colors.grey[600]),
                ),
                const SizedBox(height: 20),

                // Texte "OR Continue with"
                Text("- OR Continue with -",
                    style: TextStyle(color: Colors.grey[600])),
                const SizedBox(height: 10),

                // Boutons sociaux
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialButton(icon: FontAwesomeIcons.google, color: Colors.red),
                    SizedBox(width: 15),
                    SocialButton(icon: FontAwesomeIcons.apple, color: Colors.black),
                    SizedBox(width: 15),
                    SocialButton(icon: FontAwesomeIcons.facebook, color: Colors.blue),
                  ],
                ),

                const SizedBox(height: 20),

                // Lien "Create An Account"
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Create An Account"),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Sign Up"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Widget pour les boutons sociaux
class SocialButton extends StatelessWidget {
  final IconData icon;
  final Color color;

  const SocialButton({super.key, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey),
      ),
      child: Icon(icon, color: color),
    );
  }
}
