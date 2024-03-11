import 'package:hive/hive.dart';
part 'trip_model.g.dart';

@HiveType(typeId: 1)
class TripModel {
  @HiveField(0)
  final String destination;

  @HiveField(1)
  final String wayofTravel;

  @HiveField(2)
  final int budget;

  @HiveField(3)
  final int date;

  @HiveField(4)
  final int totalDay;

  @HiveField(5)
  final dynamic image;

  TripModel(  
      {required this.destination,
      required this.wayofTravel,
      required this.budget,
      required this.date,
      required this.totalDay,
      this.image,
      });
}