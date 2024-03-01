import 'package:flutter/material.dart';
import 'package:travel_app/widgets/bottom_bar.dart';
import 'package:travel_app/widgets/home_card.dart';
import 'package:travel_app/widgets/homehead.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color.fromRGBO(221, 249, 247, 1),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 44,
                  ),
                  HomeHead(),
                  SizedBox(
                    height: 32,
                  ),
                  Row(
                    children: [
                      Text(
                        "Let’s",
                        style: TextStyle(fontSize: 32, color: Colors.black),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        "travel",
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        "now",
                        style: TextStyle(fontSize: 32),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "“We live in a wonderful world that is full of beauty, charm and adventure. There is no end to the adventures we can have if only we seek them with our eyes open.”",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      " – Jawaharial Nehru",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recommended",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: [
                          Text(
                            "See All",
                            style: TextStyle(fontSize: 16),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.orange,
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      HomeCard(imagePath: 'assets/images/mountain.png', scenryName: 'Mountain',placeName: 'Nepal'),
                      HomeCard(imagePath: 'assets/images/lake.png',scenryName: 'Lake',placeName: 'India'),
                    ],
                  ),
                  Row(
                    children: [
                      HomeCard(imagePath: 'assets/images/mountain.png', scenryName: 'Mountain',placeName: 'Nepal'),
                      HomeCard(imagePath: 'assets/images/lake.png',scenryName: 'Lake',placeName: 'India'),
                    ],
                  ),
                  Row(
                    children: [
                      HomeCard(imagePath: 'assets/images/mountain.png', scenryName: 'Mountain',placeName: 'Nepal'),
                      HomeCard(imagePath: 'assets/images/lake.png',scenryName: 'Lake',placeName: 'India'),
                    ],
                  ),
                  Row(
                    children: [
                      HomeCard(imagePath: 'assets/images/mountain.png', scenryName: 'Mountain',placeName: 'Nepal'),
                      HomeCard(imagePath: 'assets/images/lake.png',scenryName: 'Lake',placeName: 'India'),
                    ],
                  ),
                  Row(
                    children: [
                      HomeCard(imagePath: 'assets/images/mountain.png', scenryName: 'Mountain',placeName: 'Nepal'),
                      HomeCard(imagePath: 'assets/images/lake.png',scenryName: 'Lake',placeName: 'India'),
                    ],
                  ),
                  Row(
                    children: [
                      HomeCard(imagePath: 'assets/images/mountain.png', scenryName: 'Mountain',placeName: 'Nepal'),
                      HomeCard(imagePath: 'assets/images/lake.png',scenryName: 'Lake',placeName: 'India'),
                    ],
                  ),
                  Row(
                    children: [
                      HomeCard(imagePath: 'assets/images/mountain.png', scenryName: 'Mountain',placeName: 'Nepal'),
                      HomeCard(imagePath: 'assets/images/lake.png',scenryName: 'Lake',placeName: 'India'),
                    ],
                  ),
                  Row(
                    children: [
                      HomeCard(imagePath: 'assets/images/mountain.png', scenryName: 'Mountain',placeName: 'Nepal'),
                      HomeCard(imagePath: 'assets/images/lake.png',scenryName: 'Lake',placeName: 'India'),
                    ],
                  ),
                  Row(
                    children: [
                      HomeCard(imagePath: 'assets/images/mountain.png', scenryName: 'Mountain',placeName: 'Nepal'),
                      HomeCard(imagePath: 'assets/images/lake.png',scenryName: 'Lake',placeName: 'India'),
                    ],
                  ),
                  Row(
                    children: [
                      HomeCard(imagePath: 'assets/images/mountain.png', scenryName: 'Mountain',placeName: 'Nepal'),
                      HomeCard(imagePath: 'assets/images/lake.png',scenryName: 'Lake',placeName: 'India'),
                    ],
                  ),
                  Row(
                    children: [
                      HomeCard(imagePath: 'assets/images/mountain.png', scenryName: 'Mountain',placeName: 'Nepal'),
                      HomeCard(imagePath: 'assets/images/lake.png',scenryName: 'Lake',placeName: 'India'),
                    ],
                  ),
                  Row(
                    children: [
                      HomeCard(imagePath: 'assets/images/mountain.png', scenryName: 'Mountain',placeName: 'Nepal'),
                      HomeCard(imagePath: 'assets/images/lake.png',scenryName: 'Lake',placeName: 'India'),
                    ],
                  ),
                  Row(
                    children: [
                      HomeCard(imagePath: 'assets/images/mountain.png', scenryName: 'Mountain',placeName: 'Nepal'),
                      HomeCard(imagePath: 'assets/images/lake.png',scenryName: 'Lake',placeName: 'India'),
                    ],
                  ),
                  Row(
                    children: [
                      HomeCard(imagePath: 'assets/images/mountain.png', scenryName: 'Mountain',placeName: 'Nepal'),
                      HomeCard(imagePath: 'assets/images/lake.png',scenryName: 'Lake',placeName: 'India'),
                    ],
                  ),
                  Row(
                    children: [
                      HomeCard(imagePath: 'assets/images/mountain.png', scenryName: 'Mountain',placeName: 'Nepal'),
                      HomeCard(imagePath: 'assets/images/lake.png',scenryName: 'Lake',placeName: 'India'),
                    ],
                  ),
                  Row(
                    children: [
                      HomeCard(imagePath: 'assets/images/mountain.png', scenryName: 'Mountain',placeName: 'Nepal'),
                      HomeCard(imagePath: 'assets/images/lake.png',scenryName: 'Lake',placeName: 'India'),
                    ],
                  ),
                ]),
          ),
        ),
        bottomNavigationBar: CircularBottomBar());
  }
}
