import 'package:rep1/featuers/explore/data/model/home_workout_model.dart';

abstract class GetMainWorkoutsStates {}

class GetMainWorkoutsInit extends GetMainWorkoutsStates {}

class GetMainWorkoutsSucess extends GetMainWorkoutsStates {
  final List<HomeWorkoutModel> workouts;

  GetMainWorkoutsSucess({required this.workouts});
}

class GetMainWorkoutsFail extends GetMainWorkoutsStates {
  final String msg;
  GetMainWorkoutsFail(this.msg);
}
