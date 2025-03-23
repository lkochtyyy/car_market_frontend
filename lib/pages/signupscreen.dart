import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:pfe_frontend/pages/login.dart';

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
        scaffoldBackgroundColor: const Color(0xFFD7F5FF),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black54),
        ),
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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isPasswordMatch = true;
  bool _isButtonEnabled = false;

  void _validateForm() {
    setState(() {
      _isPasswordMatch =
          _passwordController.text == _confirmPasswordController.text;
      _isButtonEnabled = _formKey.currentState?.validate() ?? false;
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Rejoignez-nous !",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 38, 3, 3),
                      shadows: [
                        Shadow(
                            offset: Offset(2, 2),
                            blurRadius: 6,
                            color: Colors.black26)
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const CustomTextField(
                      hintText: "Prénom", inputType: TextInputType.name),
                  const CustomTextField(
                      hintText: "Nom", inputType: TextInputType.name),
                  CustomTextField(
                      hintText: "Email",
                      inputType: TextInputType.emailAddress,
                      controller: _emailController),
                  CustomTextField(
                      hintText: "Mot de passe ",
                      isPassword: true,
                      controller: _passwordController,
                      onChanged: (value) => _validateForm()),
                  CustomTextField(
                      hintText: "Confirmer le mot de passe",
                      isPassword: true,
                      controller: _confirmPasswordController,
                      onChanged: (value) => _validateForm()),
                  const SizedBox(height: 10),
                  if (!_isPasswordMatch)
                    const Text("Mot de passe ne correspond pas",
                        style: TextStyle(color: Colors.red, fontSize: 12)),
                  const SizedBox(height: 10),
                  const Text.rich(
                    TextSpan(
                      text: "En cliquant sur ",
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                      children: [
                        TextSpan(
                          text: "Créer mon compte",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blue, // Changez la couleur ici
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text:
                              ", vous acceptez nos Conditions d'utilisation et notre Politique de confidentialité 😊",
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: _isButtonEnabled
                        ? () => ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Inscription réussie !')))
                        : null,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
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
                              offset: Offset(2, 5))
                        ],
                      ),
                      child: const Center(
                        child: Text("Créer mon compte",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Text.rich(
                      TextSpan(
                        text: "Vous avez déjà un compte ? ",
                        style: const TextStyle(
                            fontSize: 14, color: Colors.black54),
                        children: [
                          TextSpan(
                            text: "Se connecter",
                            style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage())),
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
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final Function(String)? onChanged;

  const CustomTextField(
      {super.key,
      required this.hintText,
      this.isPassword = false,
      this.controller,
      this.inputType,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: inputType,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$hintText is required';
          }
          if (hintText == "Email" &&
              !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\$")
                  .hasMatch(value)) {
            return "Enter a valid email";
          }
          return null;
        },
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(
              isPassword ? Icons.lock_outline : Icons.person_outline,
              color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        ),
      ),
    );
  }
}
