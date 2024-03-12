// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:travel_app/model/tripmodel/trip_model.dart';

// ValueNotifier<List<TripModel>> TripNotifier = ValueNotifier([]);


// void updateTrip(index, TripModel value) {
//   final tripData = Hive.box('tripDb');
//   // ignore: invalid_use_of_protected_member
//   TripNotifier.notifyListeners();
//   tripData.putAt(index, value);
// }