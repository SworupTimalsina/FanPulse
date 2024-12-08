import 'package:flutter/material.dart';
import 'registration_screen.dart';

import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xff25364A),
                  Color(0xff25364A),
                ]
            )
        ),
        child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 90.0),
                child: Image(image: AssetImage('assets/images/logo.png')),
              ),
              const SizedBox(
                height: 100,
              ),
              const Text('Welcome Back',style: TextStyle(
                  fontSize: 30,
                  color: Colors.white
              ),),
              const SizedBox(height: 30,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()));
                },
                child: Container(
                  height: 53,
                  width: 320,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white),
                  ),
                  child: const Center(child: Text('SIGN IN',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),),),
                ),
              ),
              const SizedBox(height: 30,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const RegisterScreen()));
                },
                child: Container(
                  height: 53,
                  width: 320,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white),
                  ),
                  child: const Center(child: Text('SIGN UP',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),),),
                ),
              ),
              const Spacer(),
              const Text('Login with ',style: TextStyle(
                  fontSize: 17,
                  color: Colors.white
              ),),//
              const SizedBox(height: 12),
              SizedBox(
                height: 80, // Adjust the height as desired
                width: 80,  // Adjust the width as desired
                child: Image(image: AssetImage('assets/images/google.png')),
              ),
            ]
        ),
      ),

    );
  }
}