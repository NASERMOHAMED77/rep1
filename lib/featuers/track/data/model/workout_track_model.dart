import 'package:hive/hive.dart';
part 'workout_track_model.g.dart';

@HiveType(typeId: 0)
class WorkoutTrackModel extends HiveObject {
  @HiveField(0)
  final String workout;
  @HiveField(1)
  final String sets;
  @HiveField(2)
  final String reps;
  @HiveField(3)
  final String rest;
  @HiveField(4)
  final String day;
  @HiveField(6)
  final String workoutSet;
  WorkoutTrackModel({
    required this.workoutSet,
    required this.workout,
    required this.sets,
    required this.reps,
    required this.rest,
    required this.day,
  });

  // @override
  // List<Object?> get props {
  //   return [workout, sets, reps, rest];
  // }

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'workout': workout,
  //     'sets': sets,
  //     'reps': reps,
  //     'rest': rest,
  //     'day': day,
  //   };
  // }

  // factory WorkoutTrackModel.fromMap(Map<String, dynamic> map) {
  //   return WorkoutTrackModel(
  //     workout: map['Workout'] as String,
  //     sets: map['Sets'] as String,
  //     reps: map['Rep'] as String,
  //     rest: map['Rest'] as String,
  //     day: map['Day'] as String,
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory WorkoutTrackModel.fromJson(String source) =>
  //     WorkoutTrackModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
