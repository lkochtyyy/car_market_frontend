import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD5F3F9), // Light blue background
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Image.asset(
              'assets/chorliya.png',
              width: 400,
              height: 400,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 40),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 12,
                    spreadRadius: 2,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  hintText: 'Enter your email address',
                  hintStyle: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                  prefixIcon: Icon(Icons.email_outlined, color: Colors.black54),
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '* We will send you a message to set or reset your new password',
                style: TextStyle(color: Colors.redAccent, fontSize: 12),
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: double.infinity,
              height: 55,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 8,
                    spreadRadius: 1,
                    offset: Offset(0, 4),
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
                ),
                onPressed: () {},
                child: Text(
                  'Send email',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
