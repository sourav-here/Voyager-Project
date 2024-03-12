import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:travel_app/model/tripmodel/trip_model.dart';
import 'package:travel_app/view/screens/details_screen.dart';
import 'package:travel_app/view/subscreens/add_page.dart';
import 'package:travel_app/view/subscreens/edit_screen.dart';
import 'package:travel_app/view/widgets/bottom_bar.dart';
import 'package:travel_app/view/widgets/search.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  List<TripModel> trips = [];

  @override
  void initState() {
    super.initState();
    fetchTrips();
  }

  Future<void> fetchTrips() async {
    final tripBox = await Hive.openBox<TripModel>('tripBox');
    setState(() {
      trips = tripBox.values.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(221, 249, 247, 1),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 238, 139, 82),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddPage()),
          ).then((_) {
            fetchTrips();
          });
        },
        child: const Icon(Icons.add_box_rounded),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 44),
            const Text(
              "Your",
              style: TextStyle(fontSize: 32, color: Colors.black),
            ),
            const SizedBox(height: 12),
            const Text(
              "BucketList",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "“Dream it. Do it. Tick off that bucket list one epic adventure at a time.”",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const SearchBox(),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: trips.length,
                itemBuilder: (context, index) {
                  final trip = trips[index];
                  return Container(
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 238, 139, 82),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(
                              destination: trip.destination,
                              wayofTravel: trip.wayofTravel,
                              date: trip.date.toString(),
                              totalDay: trip.totalDay.toString(),
                              budget: trip.budget.toString(),
                              image: trip.image,
                            ),
                          ),
                        );
                      },
                      leading: CircleAvatar(
                        backgroundImage: trip.image.isNotEmpty
                            ? FileImage(File(trip.image))
                            : null,
                      ),
                      title: Text(trip.destination),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(trip.wayofTravel),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditPage(
                                    destination: trip.destination,
                                    wayofTravel: trip.wayofTravel,
                                    budget: trip.budget.toString(),
                                    date: trip.date.toString(),
                                    totalDay: trip.totalDay.toString(),
                                    imagepath: trip.image, 
                                  ),
                                ),
                              );
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete_outline_rounded),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Delete Trip'),
                                  content:
                                      const Text('Are you sure about this?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        deleteTrip(index);
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Delete'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CircularBottomBar(),
    );
  }

  Future<void> deleteTrip(int index) async {
    final tripBox = await Hive.openBox<TripModel>('tripBox');
    await tripBox.deleteAt(index);
    fetchTrips();
  }
}
