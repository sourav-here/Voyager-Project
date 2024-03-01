import 'package:flutter/material.dart';
import 'package:travel_app/widgets/bottom_bar.dart';
import 'package:travel_app/widgets/user_head.dart';
import 'package:travel_app/widgets/userlist.dart';

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
              UserTile(icon: const Icon(Icons.person_3), text: 'Profile', onpressed: () {}),
              const SizedBox(height: 10),
              UserTile(icon: const Icon(Icons.info_outline_rounded), text: 'About', onpressed: () {}),
              const SizedBox(height: 10),
              UserTile(icon: const Icon(Icons.private_connectivity_outlined), text: 'Privacy & Policy', onpressed: () {}),
              const SizedBox(height: 10),
              UserTile(icon: const Icon(Icons.bar_chart_rounded), text: 'Chart', onpressed: () {}),
              const SizedBox(height: 10),
              UserTile(icon: const Icon(Icons.contact_phone_rounded), text: 'Contact US', onpressed: () {}),
              const SizedBox(height: 10),
              UserTile(icon: const Icon(Icons.my_library_books_outlined), text: 'Journal', onpressed: () {}),
              const SizedBox(height: 10),
              UserTile(icon: const Icon(Icons.settings_backup_restore_rounded), text: 'Reset App', onpressed: () {}),
              const SizedBox(height: 10),
              UserTile(icon: const Icon(Icons.exit_to_app_rounded), text: 'Log Out', onpressed: () {}),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CircularBottomBar(),
    );
  }
}
