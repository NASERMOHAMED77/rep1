// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_track_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkoutTrackModelAdapter extends TypeAdapter<WorkoutTrackModel> {
  @override
  final int typeId = 0;

  @override
  WorkoutTrackModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkoutTrackModel(
      workoutSet: fields[6] as String,
      workout: fields[0] as String,
      sets: fields[1] as String,
      reps: fields[2] as String,
      rest: fields[3] as String,
      day: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WorkoutTrackModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.workout)
      ..writeByte(1)
      ..write(obj.sets)
      ..writeByte(2)
      ..write(obj.reps)
      ..writeByte(3)
      ..write(obj.rest)
      ..writeByte(4)
      ..write(obj.day)
      ..writeByte(6)
      ..write(obj.workoutSet);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkoutTrackModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
