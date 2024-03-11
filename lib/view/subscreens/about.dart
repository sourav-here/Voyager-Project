import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(221, 249, 247, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(50.0),
          child: Text("lorem epsum"),
        ),),
      );
  }
}