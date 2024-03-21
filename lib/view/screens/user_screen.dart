import 'package:flutter/material.dart';
import 'package:travel_app/view/screens/login/signup_screen.dart';
import 'package:travel_app/view/subscreens/about.dart';
import 'package:travel_app/view/subscreens/chart_screen.dart';
import 'package:travel_app/view/subscreens/journal.dart';
import 'package:travel_app/view/subscreens/privacy.dart';
import 'package:travel_app/view/subscreens/user_head.dart';
import 'package:travel_app/view/subscreens/userlist.dart';
import 'package:travel_app/view/widgets/bottom_bar.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
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
                            builder: (context) => const ChartPage(
                                  trips: [],
                                )));
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
                    logoutDialogue();
                  }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CircularBottomBar(),
    );
  }

  void logoutDialogue() {
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
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => const SignUp()),
                        (route) => false);
                  },
                  child: const Text('Go on'),
                ),
              ],
            ));
  }
}
