// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TripModelAdapter extends TypeAdapter<TripModel> {
  @override
  final int typeId = 1;

  @override
  TripModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TripModel(
      destination: fields[0] as String,
      wayofTravel: fields[1] as String,
      budget: fields[2] as int,
      date: fields[3] as int,
      totalDay: fields[4] as int,
      image: fields[5] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, TripModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.destination)
      ..writeByte(1)
      ..write(obj.wayofTravel)
      ..writeByte(2)
      ..write(obj.budget)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.totalDay)
      ..writeByte(5)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TripModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
