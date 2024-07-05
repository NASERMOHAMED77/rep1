import 'package:rep1/featuers/track/data/model/workout_track_model.dart';

abstract class HomeRepo {
  List<WorkoutTrackModel> getMyWorkouts();
  void addWorkout(WorkoutTrackModel workoutTrackModel);
}
