// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:travel_app/model/tripmodel/trip_model.dart';

// ValueNotifier<List<TripModel>> tripNotifier = ValueNotifier([]);

// void addTrip(TripModel value) {
//   final tripList = Hive.box('tripDb');

//   tripList.add(value);
//   tripNotifier.value.add(value);
//   tripNotifier.notifyListeners();
// }


// void updateTrip(index, TripModel value) {
//   final tripData = Hive.box('tripDb');
//   tripNotifier.notifyListeners();
//   tripData.putAt(index, value);
// }

// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:travel_app/model/confirm_model/confirm_model.dart';
// import 'package:travel_app/model/tripmodel/trip_model.dart';
// import 'package:travel_app/view/subscreens/add_page.dart';

// ValueNotifier<List<TripModel>> tripNotifier = ValueNotifier([]);
// ValueNotifier<List<TripModel>> confirmNotifier = ValueNotifier([]);

// Future<Box<dynamic>> openAllBox(DataBases dataBase) async {
//   switch (dataBase) {
//     case DataBases.tripData:
//       return await Hive.openBox<TripModel>('tripDb');
//     case DataBases.confirmData:
//       return await Hive.openBox<ConfirmModel>('confirmDb');
//   }
// }

// Future<void> addTrip(DataBases dataBase, value) async {
//   final tripBox = await openAllBox(dataBase);
//   await tripBox.add(value);
//   getAllList(dataBase);
// }

// Future<void> getAllList(DataBases dataBase) async {
//   final box = await openAllBox(dataBase);
//   clearnotifier(dataBase);
//   addAllList(dataBase, box.values.toList());
// }

// void addAllList(DataBases dataBase, List<dynamic> values) {
//   switch (dataBase) {
//     case DataBases.tripData:
//       tripNotifier.value.addAll(values.cast<TripModel>());
//       tripNotifier.notifyListeners();
//       break;
//     case DataBases.confirmData:
//       confirmNotifier.value.addAll(values.cast<ConfirmModel>() as Iterable<TripModel>);
//       confirmNotifier.notifyListeners();
//       break;
//   }
// }

// void clearnotifier(DataBases dataBase) {
//   switch (dataBase) {
//     case DataBases.tripData:
//       tripNotifier.value.clear();
//       tripNotifier.notifyListeners();
//       break;
//     case DataBases.confirmData:
//       confirmNotifier.value.clear();
//       confirmNotifier.notifyListeners();
//       break;
//   }
// }

// Future<void> deleteTrip(DataBases dataBase, int index) async {
//   final box = await openAllBox(dataBase);
//   await box.deleteAt(index);
//   getAllList(dataBase);
// }


// Future<void> updateTrip(DataBases dataBase, int index, dynamic value) async {
//   final box = await openAllBox(dataBase);

//   box.putAt(index, value);
//   getAllList(dataBase);
// }


// ValueNotifier<List<TripModel>> tripListNotifier = ValueNotifier([]);

// Future<void> addTrip<TripModel>(Box<TripModel> tripDb, TripModel value) async {
//   await tripDb.add(value);
//   getAllList(tripDb, tripListNotifier);
// }

// void clearNotifier<TripModel>(ValueNotifier<List<TripModel>> listNotifier) {
//   listNotifier.value.clear();
//   listNotifier.notifyListeners();
// }

// void addAllList<TripModel>(Box<TripModel> tripDb, List<TripModel> values, ValueNotifier<List<TripModel>> listNotifier) {
//   listNotifier.value.addAll(values);
//   listNotifier.notifyListeners();
// }

// Future<void> getAllList<TripModel>(Box<TripModel> tripDb, ValueNotifier<List<TripModel>> listNotifier) async {
//   clearNotifier(listNotifier);
//   addAllList(tripDb, tripDb.values.toList(), listNotifier);
// }

// Future<void> delete<TripModel>(Box<TripModel> tripDb, int index) async {
//   await tripDb.deleteAt(index);
//   getAllList(tripDb, tripListNotifier);
// }

// Future<void> updateTrip<TripModel>(Box<TripModel> tripDb, int index, TripModel value) async {
//   tripDb.putAt(index, value);
//   getAllList(tripDb, tripListNotifier);
// }
