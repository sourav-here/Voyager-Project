import 'dart:io';
import 'package:flutter/material.dart';
import 'package:travel_app/functions/functions.dart';
import 'package:travel_app/model/tripmodel/trip_model.dart';
import 'package:travel_app/view/screens/details_screen.dart';
import 'package:travel_app/view/subscreens/add_head.dart';
import 'package:travel_app/view/subscreens/add_page.dart';
import 'package:travel_app/view/subscreens/chart_screen.dart';
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
  List<TripModel> filteredTrips = [];
  List<int> tripSum = [];

  @override
  void initState() {
    super.initState();
    fetchTrips();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(221, 249, 247, 1),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 5, 191, 171),
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
            const AddHead(),
            const SizedBox(
              height: 34,
            ),
            const Row(
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
            const SizedBox(height: 16),
            const Text(
              "“Dream it. Do it. Tick off that bucket list one epic adventure at a time.”",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            SearchBox(
              onSearchTextChanged: searchTrips,
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: filteredTrips.length,
                itemBuilder: (context, index) {
                  final trip = filteredTrips.reversed.toList()[index];
                  tripSum.add(trip.budget);
                  double totalTrip = tripSum
                      .reduce((value, element) => value + element)
                      .toDouble();
                  TripData.totalValue = totalTrip;
                  return Container(
                    height: 100,
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 143, 235, 206),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10.0),
                              image: trip.image.isNotEmpty
                                  ? DecorationImage(
                                      image: FileImage(File(trip.image)),
                                      fit: BoxFit.cover,
                                    )
                                  : const DecorationImage(
                                      image: AssetImage('assets/images/mountain.png'),
                                      fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        Expanded(
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
                            contentPadding: const EdgeInsets.only(top: 10),
                            title: Text(trip.destination),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(trip.wayofTravel),
                              ],
                            ),
                          ),
                        ),
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
                          icon: const Icon(Icons.delete_outline_rounded),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Delete Trip'),
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
    await TripOperations.deleteTrip(index);
    fetchTrips();
  }

  Future<void> fetchTrips() async {
    final fetchedTrips = await TripOperations.fetchTrips();
    setState(() {
      trips = fetchedTrips.reversed.toList();
      filteredTrips = trips;
    });
  }

  void searchTrips(String searchText) {
    final searchedTrips = TripOperations.searchTrips(trips, searchText);
    setState(() {
      filteredTrips = searchedTrips;
    });
  }
}
