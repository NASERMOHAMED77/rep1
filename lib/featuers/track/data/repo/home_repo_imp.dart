import 'package:hive/hive.dart';

import 'package:rep1/featuers/track/data/model/workout_track_model.dart';
import 'package:rep1/featuers/track/data/repo/home_repo.dart';

class HomeRepoImp extends HomeRepo {
  @override
  List<WorkoutTrackModel> getMyWorkouts() {
    try {
      final hiveRef = Hive.box<WorkoutTrackModel>("Workouts");
      List<WorkoutTrackModel> myWorkouts = hiveRef.values.toList();

      return myWorkouts;
    } catch (e) {
      // print(e.toString());
      rethrow;
    }
  }

  @override
  void addWorkout(WorkoutTrackModel workoutTrackModel) {
    final hiveRef = Hive.box<WorkoutTrackModel>("Workouts");
    hiveRef.add(workoutTrackModel);
  }
}
