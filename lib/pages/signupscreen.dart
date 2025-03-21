import 'package:flutter/material.dart';

void main() {
  runApp(const RegisterScreenApp());
}

class RegisterScreenApp extends StatelessWidget {
  const RegisterScreenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFD7F5FF), // Fond bleu clair
      ),
      home: const RegisterScreen(),
    );
  }
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isPasswordMatch = true;
  bool _isButtonEnabled = false;

  // Méthode pour valider la correspondance des mots de passe
  void _validatePasswords() {
    setState(() {
      _isPasswordMatch =
          _passwordController.text == _confirmPasswordController.text;
      _isButtonEnabled =
          _formKey.currentState?.validate() ?? false && _isPasswordMatch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD7F5FF),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Create an\naccount",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'SF Pro',
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 6,
                        color: Colors.black26,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const CustomTextField(hintText: "Prenom"),
                const CustomTextField(hintText: "Nom"),
                const CustomTextField(hintText: "Username or Email"),
                CustomTextField(
                  hintText: "Password",
                  isPassword: true,
                  controller: _passwordController,
                  onChanged: (value) => _validatePasswords(),
                ),
                CustomTextField(
                  hintText: "Confirm Password",
                  isPassword: true,
                  controller: _confirmPasswordController,
                  onChanged: (value) => _validatePasswords(),
                ),
                const SizedBox(height: 10),
                if (!_isPasswordMatch)
                  const Text(
                    "Passwords do not match",
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                const SizedBox(height: 10),
                const Text(
                  "By clicking the Register button, you agree to the public offer",
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: _isButtonEnabled
                      ? () {
                          // Actions after successful registration
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Registration successful!')),
                          );
                        }
                      : null,
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: _isButtonEnabled ? Colors.black : Colors.grey,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 12,
                          spreadRadius: 2,
                          offset: Offset(2, 5),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'SF Pro',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Center(
                  child: Text.rich(
                    TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                      children: [
                        TextSpan(
                          text: "Login Now",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$hintText is required';
          }
          return null;
        },
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(
            isPassword ? Icons.lock_outline : Icons.person_outline,
            color: Colors.grey,
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        ),
      ),
    );
  }
}
