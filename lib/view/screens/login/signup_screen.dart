import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/view/screens/login/login_screen.dart';
import 'package:travel_app/view/screens/login/splash.dart';

class SignUp extends StatelessWidget {
   SignUp({Key? key}) : super(key: key);

  final _formkey = GlobalKey<FormState>();

  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  Future<void> signup(BuildContext context) async {
    String username = usernamecontroller.text;
    String password = passwordcontroller.text;

    if (username.isNotEmpty && password.isNotEmpty) {
      SharedPreferences shared = await SharedPreferences.getInstance();
      shared.setString('username', username);
      shared.setString('password', password);
      shared.setBool(SplashScreenState.KEY, true);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>  LogIn(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter both username and password.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/bg.png',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/signup.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: usernamecontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter username";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Username',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25.0),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: passwordcontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter password";
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 80.0),
                    SizedBox(
                      width: 200,
                      height: 54,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            signup(context);
                          }
                        },
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: const Color.fromARGB(255, 5, 191, 171),
                        ),
                        child: const Text(
                          "Sign UP",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  LogIn(),
                            ),
                          );
                        },
                        child: const Text(
                          "Already have an account?",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
