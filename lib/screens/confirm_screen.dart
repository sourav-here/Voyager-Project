import 'package:flutter/material.dart';
import 'package:travel_app/widgets/bottom_bar.dart';
import 'package:travel_app/widgets/confirm_head.dart';

class ConfirmScreen extends StatelessWidget {
  const ConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(221, 249, 247, 1),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 44,
              ),
              ConfirmHead(),
              SizedBox(
                height: 32,
              ),
              Row(
                children: [
                  Text(
                    "You",
                    style: TextStyle(fontSize: 32, color: Colors.black),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    "Ready?",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "“A journey of a thousand miles begins with a single step, There is a world elsewhere”",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CircularBottomBar(),
    );
  }
}
