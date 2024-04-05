import 'package:flutter/material.dart';
import 'package:travel_app/functions/functions.dart';
import 'package:travel_app/model/tripmodel/trip_model.dart';

class TripProvider extends ChangeNotifier {
  List<TripModel> _trips = [];
  List<TripModel> filteredTrips = [];
  final List<int> _tripSum = [];

  List<TripModel> get trips => filteredTrips;

  List<int> get tripSum => _tripSum;

  Future<void> fetchTrips() async {
    final fetchedTrips = await TripOperations.fetchTrips();
    _trips = fetchedTrips.reversed.toList();
    filteredTrips = _trips;
    notifyListeners();
  }

  void searchTrips(String searchText) {
    final searchedTrips = TripOperations.searchTrips(_trips, searchText);
    filteredTrips = searchedTrips;
    notifyListeners();
  }

  Future<void> deleteTrip(int index) async {
    await TripOperations.deleteTrip(index);
    await fetchTrips();
  }
}
