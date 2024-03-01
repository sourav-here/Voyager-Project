import 'package:flutter/material.dart';
import 'package:travel_app/screens/add_screen.dart';
import 'package:travel_app/screens/confirm_screen.dart';
import 'package:travel_app/screens/home_screen.dart';
import 'package:travel_app/screens/user_screen.dart';

class CircularBottomBar extends StatelessWidget {
  const CircularBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 70,
        width: 900,
        decoration:  const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Color.fromARGB(255, 5, 191, 171),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(icon: const Icon(Icons.home, ), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()))),
              IconButton(icon: const Icon(Icons.add_box_rounded, ), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AddScreen()))),
              IconButton(icon: const Icon(Icons.view_list_rounded, ), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ConfirmScreen()))),
              IconButton(icon: const Icon(Icons.person_pin_rounded, ), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const UserScreen()))),
            ],
          ),
        ),
      ),
    );
  }
}
