import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/view/screens/login/login_screen.dart';
import 'package:travel_app/view/screens/login/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('message');
    return Scaffold(
        body: Stack(
      children: [_backgroundImage(), _headerView(), _fotterView(context)],
    ));
  }

  Widget _backgroundImage() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/welcome_bg.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _headerView() {
    return  Padding(
      padding: const EdgeInsets.all(11.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 44,
          ),
          Text(
            "Let's travel around the",
            style: GoogleFonts.lato(fontSize: 38,fontWeight: FontWeight.w300),
          ),
          Text(
            "Beautiful World...",
            style: GoogleFonts.lato(fontSize: 60,fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _fotterView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: 54,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LogIn()));
              },
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500,color: Colors.black),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: const Color.fromARGB(255, 5, 191, 171),
              ),
              child: const Text("Log in",style: TextStyle(color: Colors.white),),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: double.infinity,
            height: 54,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUp()));
              },
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: const Color.fromARGB(255, 238, 139, 82),
              ),
              child: const Text("Sign UP",style: TextStyle(color: Colors.white),),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }
}