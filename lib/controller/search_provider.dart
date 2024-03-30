// import 'package:flutter/material.dart';

// class SearchProvider extends ChangeNotifier{
//   String _searchText = '';

//   String get searchText => _searchText;

//   void setSearchText(String newText){
//     _searchText = newText;
//     notifyListeners();
//   }
// }

import 'package:flutter/material.dart';
import 'package:travel_app/functions/functions.dart';
import 'package:travel_app/model/tripmodel/trip_model.dart'; // Import TripOperations if needed

class SearchProvider extends ChangeNotifier {
  List<TripModel> trips = [];
  List<TripModel> filteredTrips = [];

  void searchTrips(String searchText) {
    final searchedTrips = TripOperations.searchTrips(trips, searchText);
    filteredTrips = searchedTrips;
    notifyListeners();
  }
}
