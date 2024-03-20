// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complete_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CompleteModelAdapter extends TypeAdapter<CompleteModel> {
  @override
  final int typeId = 2;

  @override
  CompleteModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CompleteModel(
      destination: fields[0] as String?,
      extraDay: fields[1] as String,
      extraMoney: fields[2] as int,
      image: fields[3] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, CompleteModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.destination)
      ..writeByte(1)
      ..write(obj.extraDay)
      ..writeByte(2)
      ..write(obj.extraMoney)
      ..writeByte(3)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompleteModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
