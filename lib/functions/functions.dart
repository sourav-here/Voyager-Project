import 'package:hive/hive.dart';
import 'package:travel_app/model/tripmodel/trip_model.dart';

class TripOperations {

  static Future<void> addTrip(TripModel trip) async {
    final tripBox = await Hive.openBox<TripModel>('tripBox');
    await tripBox.add(trip);
  }

  static Future<void> deleteTrip(int index) async {
    final tripBox = await Hive.openBox<TripModel>('tripBox');
    await tripBox.deleteAt(index);
    fetchTrips();
  }
  
    static Future<void> updateTrip(int index, TripModel updatedTrip) async {
    final tripBox = await Hive.openBox<TripModel>('tripBox');
    await tripBox.putAt(index, updatedTrip);
  }

  static Future<List<TripModel>> fetchTrips() async {
    final tripBox = await Hive.openBox<TripModel>('tripBox');
    final trips = tripBox.values.toList();
    return trips;
  }

  static List<TripModel> searchTrips(List<TripModel> trips, String searchText) {
    return trips
        .where((trip) =>
            trip.destination.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
  }
}
