import 'package:flutter/material.dart';
import 'package:travel_app/view/subscreens/about.dart';
import 'package:travel_app/view/subscreens/chart_screen.dart';
import 'package:travel_app/view/subscreens/journal.dart';
import 'package:travel_app/view/subscreens/privacy.dart';
import 'package:travel_app/view/subscreens/user_head.dart';
import 'package:travel_app/view/subscreens/userlist.dart';
import 'package:travel_app/view/widgets/bottom_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/view/screens/login/welcome_screen.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(221, 249, 247, 1),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 44,
              ),
              const UserHead(),
              const SizedBox(
                height: 32,
              ),
              UserTile(
                  icon: const Icon(Icons.info_outline_rounded),
                  text: 'About',
                  onpressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AboutPage()));
                  }),
              const SizedBox(height: 15),
              UserTile(
                  icon: const Icon(Icons.private_connectivity_outlined),
                  text: 'Privacy & Policy',
                  onpressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PrivacyPage()));
                  }),
              const SizedBox(height: 15),
              UserTile(
                  icon: const Icon(Icons.bar_chart_rounded),
                  text: 'Chart',
                  onpressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChartScreen()));
                  }),
              const SizedBox(height: 15),
              UserTile(
                  icon: const Icon(Icons.my_library_books_outlined),
                  text: 'Journal',
                  onpressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const JournalPage()));
                  }),
              const SizedBox(height: 15),
              UserTile(
                  icon: const Icon(Icons.exit_to_app_rounded),
                  text: 'Log Out',
                  onpressed: () {
                    logoutDialogue(context);
                  }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CircularBottomBar(),
    );
  }
  void logoutDialogue(BuildContext context) { 
    showDialog(
        context: context,
        
        useSafeArea: true,
        builder: (context) => AlertDialog(
              title: const Text('Log Out'),
              content: const Text('Are you sure about this?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    handleLogout(context);
                  },
                  child: const Text('Go on'),
                ),
              ],
            ));
  }

  void handleLogout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('username');
    prefs.remove('password');

    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const WelcomeScreen()),
    );
  }
}
