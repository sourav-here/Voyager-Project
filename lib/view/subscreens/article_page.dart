import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:travel_app/model/tripmodel/trip_model.dart';
import 'package:travel_app/view/subscreens/add_page.dart';

class ArticlePage extends StatefulWidget {
  final String backgroundImage;
  final String headingText;
  final String about;
  final String price;

  const ArticlePage({
    Key? key,
    required this.backgroundImage,
    required this.headingText,
    required this.about,
    required this.price,
  }) : super(key: key);

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  late Box<TripModel> tripBox;

    @override
  void initState() {
    super.initState();
    tripBox = Hive.box<TripModel>('tripBox');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            widget.backgroundImage,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 130,),
              Padding(
                padding: const EdgeInsets.only(left: 20.0,top: 20.0),
                child: Text(
                  widget.headingText,
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0),
                child: Text(
                  widget.about,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 20,
            bottom: 40,
            child: Text(
              widget.price,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            right: 20,
            bottom: 20,
            child: ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Color.fromARGB(255, 5, 191, 171)),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  AddPage(initialDestination: widget.headingText)));
              },
              child: const Text(
                "Go here",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
