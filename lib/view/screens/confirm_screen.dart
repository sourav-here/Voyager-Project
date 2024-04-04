import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:travel_app/model/complete_model/complete_model.dart';
import 'package:travel_app/view/subscreens/chart_screen.dart';
import 'package:travel_app/view/subscreens/completed_details.dart';
import 'package:travel_app/view/subscreens/confirm_head.dart';
import 'package:travel_app/view/widgets/bottom_bar.dart';

class ConfirmScreen extends StatelessWidget {
  const ConfirmScreen({super.key});

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
              const ConfirmHead(),
              const SizedBox(
                height: 32,
              ),
              const Row(
                children: [
                  Text(
                    "You",
                    style: TextStyle(fontSize: 32, color: Colors.black),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    "Did it !!!",
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
              const SizedBox(
                height: 16,
              ),
              const Text(
                "“A journey of a thousand miles begins with a single step, There is a world elsewhere”",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              FutureBuilder(
                future: Hive.openBox<CompleteModel>('completeBox'),
                builder: (context, AsyncSnapshot<Box<CompleteModel>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      final completeBox = snapshot.data!;
                      final completeTrips =
                          completeBox.values.toList().reversed.toList();
                      List<int> completeSum = [];

                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: completeTrips.length,
                        itemBuilder: (context, index) {
                          final complteTrip = completeTrips[index];
                          completeSum.add(complteTrip.extraMoney);
                          double totalExpenses = completeSum
                              .reduce((value, element) => value + element)
                              .toDouble();
                          TripData.totalExpense = totalExpenses;
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 143, 235, 206),
                                borderRadius: BorderRadius.circular(10),
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
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        image: complteTrip.image.isNotEmpty
                                            ? DecorationImage(
                                                image: FileImage(
                                                    File(complteTrip.image)),
                                                fit: BoxFit.cover,
                                              )
                                            : const DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/mountain.png'),
                                                fit: BoxFit.cover),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: ListTile(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CompletedDetails(
                                                        destination: '',
                                                        extraDay: complteTrip
                                                            .extraDay,
                                                        extraMoney: complteTrip
                                                            .extraMoney,
                                                        image:
                                                            complteTrip.image,
                                                      )));
                                        },
                                        title: Text(complteTrip.destination!),
                                        trailing:
                                            const Icon(Icons.done_all_rounded),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CircularBottomBar(),
    );
  }
}
