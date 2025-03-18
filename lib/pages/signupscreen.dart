import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD7F5FF),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
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
              SizedBox(height: 20),
              CustomTextField(hintText: "Prenom"),
              CustomTextField(hintText: "Nom"),
              CustomTextField(hintText: "Username or Email"),
              CustomTextField(hintText: "Password", isPassword: true),
              CustomTextField(hintText: "Confirm Password", isPassword: true),
              SizedBox(height: 10),
              Text(
                "By clicking the Register button, you agree to the public offer",
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 12,
                      spreadRadius: 2,
                      offset: Offset(2, 5),
                    ),
                  ],
                ),
                child: Center(
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
              SizedBox(height: 10),
              Center(
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
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  CustomTextField({required this.hintText, this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        obscureText: isPassword,
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
          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
         
          
        ),
      ),
    );
  }
}
