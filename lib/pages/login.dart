import 'package:flutter/material.dart';
import 'forgetpassword.dart';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDDF4F9),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Image.asset(
              'assets/beepbeep.png',
              width: 300,
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person, color: Colors.grey),
                        hintText: 'Username or Email',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(16),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock, color: Colors.grey),
                        hintText: 'Password',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(16),
                        suffixIcon: Icon(Icons.visibility_off, color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
Align(
  alignment: Alignment.centerRight,
  child: GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  ForgotPasswordScreen()),
      );
    },
    child: Text(
      'Forgot Password?',
      style: TextStyle(
        color: Colors.grey.shade700,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        decoration: TextDecoration.underline, // Adds a subtle underline
      ),
    ),
  ),
),

                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 100),
                      elevation: 8,
                      shadowColor: Colors.black,
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}