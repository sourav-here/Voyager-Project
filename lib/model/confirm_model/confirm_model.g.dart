// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConfirmModelAdapter extends TypeAdapter<ConfirmModel> {
  @override
  final int typeId = 2;

  @override
  ConfirmModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ConfirmModel(
      destination: fields[0] as String?,
      wayofTravel: fields[1] as String,
      budget: fields[2] as int,
      date: fields[3] as String,
      totalDay: fields[4] as String,
      image: fields[5] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, ConfirmModel obj) {
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
      other is ConfirmModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
