// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:travel_app/model/confirm_model/confirm_model.dart';
// import 'package:travel_app/model/tripmodel/trip_model.dart';

// ValueNotifier<List<TripModel>> tripListNotifier = ValueNotifier([]);
// ValueNotifier<List<ConfirmModel>> confirmListNotifier = ValueNotifier([]);


// Future<Box<dynamic>> openAllBox(DataBases dataBase) async {
//   switch (dataBase) {
//     case DataBases.tripDataBase:
//       return await Hive.openBox<TripModel>('carDb');
//     case DataBases.confirmDataBase:
//       return await Hive.openBox<ConfirmModel>('bikeDb');
//   }
// }

// Future<void> add(DataBases dataBase, value) async {
//   final box = await openAllBox(dataBase);
//   await box.add(value);
//   getAllList(dataBase);
// }

// Future<void> getAllList(DataBases dataBase) async {
//   final box = await openAllBox(dataBase);
//   addAllList(dataBase, box.values.toList());
// }


// Future<void> delete(DataBases dataBase, int index) async {
//   final box = await openAllBox(dataBase);
//   await box.deleteAt(index);
//   getAllList(dataBase);
// }


// Future<void> edit(DataBases dataBase, int index, dynamic value) async {
//   final box = await openAllBox(dataBase);

//   box.putAt(index, value);
//   getAllList(dataBase);
// }

// import 'package:hive/hive.dart';
// import 'package:travel_app/model/tripmodel/trip_model.dart';

// Future<List<TripModel>> fetchTrips() async {
//   final tripBox = await Hive.openBox<TripModel>('tripBox');
//   return tripBox.values.toList();
// }

// Future<void> deleteTrip(int index) async {
//   final tripBox = await Hive.openBox<TripModel>('tripBox');
//   await tripBox.deleteAt(index);
// }



