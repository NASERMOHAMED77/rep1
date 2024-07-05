// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class GetWorkoutsStates {}

class GetWorkoutsInit extends GetWorkoutsStates {}

class GetWorkoutsSucess extends GetWorkoutsStates {}

class ChangestepsSucess extends GetWorkoutsStates {
  String steps;
  ChangestepsSucess({
    required this.steps,
  });
}

class ChangestepsFail extends GetWorkoutsStates {
  String steps;
  ChangestepsFail({
    required this.steps,
  });

}

class GetWorkoutsLoading extends GetWorkoutsStates {}

class GetWorkoutfialure extends GetWorkoutsStates {
  String msg;
  GetWorkoutfialure({
    required this.msg,
  });
}
