import 'package:flutter/material.dart';
import 'package:travel_app/widgets/add_head.dart';
import 'package:travel_app/widgets/add_page.dart';
import 'package:travel_app/widgets/bottom_bar.dart';
import 'package:travel_app/widgets/search.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(221, 249, 247, 1),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 238, 139, 82),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddPage()));
        },
        child: const Icon(
          Icons.add_box_rounded,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 44,
              ),
              AddHead(),
              SizedBox(
                height: 32,
              ),
              Row(
                children: [
                  Text(
                    "Your",
                    style: TextStyle(fontSize: 32, color: Colors.black),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    "BucketList",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "“Dream it. Do it. Tick off that bucket list one epic adventure at a time.”",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 24,
              ),
              SearchBox(),
              SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CircularBottomBar(),
    );
  }
}
