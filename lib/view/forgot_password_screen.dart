import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
        backgroundColor: const Color(0xff25364A),
        elevation: 0,
      ),
      backgroundColor: const Color(0xff25364A),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Enter your email to reset your password',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  height: 1.5, // Better line height for readability
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // Email Input Field
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    fontSize: 18,
                    color: Color(0xff25364A),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  filled: true,
                  fillColor: Color(0xffF6F6F6),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 30),

              // Reset Button
              ElevatedButton(
                onPressed: () {
                  // TODO: Add logic to send reset email
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Reset email sent!')),
                  );
                },
                child: const Text(
                  'Send Reset Link',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                ),
              ),
              const SizedBox(height: 40),

              // Back to Login Link
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Go back to login screen
                },
                child: const Text(
                  'Back to Login',
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
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
