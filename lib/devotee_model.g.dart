// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'devotee_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DevoteeModelAdapter extends TypeAdapter<DevoteeModel> {
  @override
  final int typeId = 1;

  @override
  DevoteeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DevoteeModel(
      date: fields[0] as DateTime?,
      id: fields[1] as String?,
      firstName: fields[2] as String?,
      lastName: fields[3] as String?,
      email: fields[4] as String?,
      mobileNumber: fields[5] as String?,
      inGroup: fields[6] as String?,
      joinGroup: fields[7] as String?,
      picturesForSocialMedia: fields[8] as String?,
      volunteering: fields[9] as String?,
      volunteeringService: (fields[10] as List?)
          ?.map((dynamic e) => (e as Map).cast<String, dynamic>())
          .toList(),
      sendToCloud: fields[11] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, DevoteeModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.firstName)
      ..writeByte(3)
      ..write(obj.lastName)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.mobileNumber)
      ..writeByte(6)
      ..write(obj.inGroup)
      ..writeByte(7)
      ..write(obj.joinGroup)
      ..writeByte(8)
      ..write(obj.picturesForSocialMedia)
      ..writeByte(9)
      ..write(obj.volunteering)
      ..writeByte(10)
      ..write(obj.volunteeringService)
      ..writeByte(11)
      ..write(obj.sendToCloud);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DevoteeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
