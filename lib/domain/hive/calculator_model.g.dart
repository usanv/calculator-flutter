// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculator_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveCalculatorModelAdapter extends TypeAdapter<HiveCalculatorModel> {
  @override
  final int typeId = 0;

  @override
  HiveCalculatorModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveCalculatorModel(
      firstLength: fields[0] as String,
      result: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveCalculatorModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.firstLength)
      ..writeByte(1)
      ..write(obj.result);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveCalculatorModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
