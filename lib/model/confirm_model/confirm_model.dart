import 'package:hive/hive.dart';
part 'confirm_model.g.dart';

@HiveType(typeId: 2)
class ConfirmModel {
  @HiveField(0)
  final String? destination;

  @HiveField(1)
  final String wayofTravel;

  @HiveField(2)
  final int budget;

  @HiveField(3)
  final String date;

  @HiveField(4)
  final String totalDay;

  @HiveField(5)
  final dynamic image;

  ConfirmModel(  
      {required this.destination,
      required this.wayofTravel,
      required this.budget,
      required this.date,
      required this.totalDay,
      this.image,
      });
}