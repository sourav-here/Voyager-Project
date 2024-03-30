import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/view/screens/home_screen.dart';
import 'package:travel_app/view/screens/login/login_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  // ignore: constant_identifier_names
  static const String KEY = "Login";

  @override
  void initState() {
    super.initState();
    navigate();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
    );
  }

  void navigate() async {
    var shared = await SharedPreferences.getInstance();
    var isLoggedIn = shared.getBool(KEY);

    Future.delayed(const Duration(milliseconds: 1), () {
      if (isLoggedIn != null) {
         if (isLoggedIn) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        }
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>  LogIn()),
        );
      }
    });
  }
}