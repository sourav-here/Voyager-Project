import 'dart:io';
import 'package:flutter/material.dart';
import 'package:travel_app/view/screens/add_screen.dart';
import 'package:travel_app/view/subscreens/confirm_details.dart';
import 'package:travel_app/view/subscreens/detail_text.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen(
      {super.key,
      required this.destination,
      required this.wayofTravel,
      required this.budget,
      this.date,
      this.totalDay,
      this.image});

  final String destination;
  final String wayofTravel;
  final String budget;
  final String? date;
  final String? totalDay;
  final String? image;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  File? selectedimage;
  String? destination;
  String? budget;

  @override
  void initState() {
    selectedimage = widget.image != '' ? File(widget.image!) : null;
    destination = widget.destination;
    budget = widget.budget;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(221, 249, 247, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Center(
              child: Text(
                widget.destination,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 29,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: SizedBox(
                width: 300,
                height: 210,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: widget.image != null
                        ? Image(
                            image: FileImage(File(widget.image!)),
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            'assets/images/form.jpg',
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.only(left: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Trip Summary',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      detailTextWidget('Destination: ${widget.destination}'),
                      const SizedBox(
                        height: 20,
                      ),
                      detailTextWidget(
                          'Way of Travelling: ${widget.wayofTravel}'),
                      const SizedBox(
                        height: 20,
                      ),
                      detailTextWidget('Budget: ${widget.budget}'),
                      const SizedBox(
                        height: 20,
                      ),
                      detailTextWidget("Year : ${widget.date}"),
                      const SizedBox(
                        height: 20,
                      ),
                      detailTextWidget('Total Days: ${widget.totalDay}'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CompleteDetails(
                      destination: widget.destination,
                      image: widget.image!,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w500),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: const Color.fromARGB(255, 238, 139, 82),
              ),
              child: const Text("Completed",
                  style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddScreen(),
                    ),
                  );
                },
                child: const Text(
                  "Go back",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ))
          ],
        ),
      ),
    );
  }
}
