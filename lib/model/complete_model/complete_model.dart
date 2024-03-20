import 'package:hive/hive.dart';
part 'complete_model.g.dart';

@HiveType(typeId: 2)
class CompleteModel {
  @HiveField(0)
  final String? destination;

  @HiveField(1)
  final String extraDay;

  @HiveField(2)
  final int extraMoney;

  @HiveField(3)
  final dynamic image;

  CompleteModel(  
      {required this.destination,
      required this.extraDay,
      required this.extraMoney,
      this.image,
      });
}