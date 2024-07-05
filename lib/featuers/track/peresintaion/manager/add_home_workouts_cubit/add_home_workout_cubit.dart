import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rep1/featuers/track/data/model/workout_track_model.dart';
import 'package:rep1/featuers/track/data/repo/home_repo.dart';
import 'package:rep1/featuers/track/peresintaion/manager/add_home_workouts_cubit/add_home_workout_state.dart';

class AddHomeWorkoutCubit extends Cubit<AddHomeWorkoutStates> {
  AddHomeWorkoutCubit(this.homeRepo) : super(AddHomeWorkoutInit());
  HomeRepo homeRepo;
  // ignore: prefer_typing_uninitialized_variables
  var selectedvalue;
  addWorkout(WorkoutTrackModel workout) {
    try {
      homeRepo.addWorkout(workout);
      // print("add");
      emit(AddHomeWorkoutSuccess());
    } catch (e) {
      emit(AddHomeWorkoutFailure(e.toString()));
    }
  }
}

class ChangeDropDownWorkoutCubit extends Cubit<String> {
  ChangeDropDownWorkoutCubit() : super('Bench');

  List<String> workoutItem = [
    'Select Workout',
    'Incline Bar Bench Press',
    'Decline Bar Bench Press',
    'Incline Dumbel Bench Press',
    'Decline Dumbel Bench Press',
    'Bench Fly',
    'Incline Machine Bench Press',
    'Back Pull Ups',
    'Back Lat Pull Down',
    'Back Seated Row',
  ];

  void selectItem(String item) => emit(item);

  changeList() {
    if (state == "Bench") {
      workoutItem = [
        'Select Workout',
        'Incline Bar Bench Press,',
        'Decline Bar Bench Press',
        'Incline Dumbel Bench Press',
        'Decline Dumbel Bench Press',
        'Bench Fly',
        'Incline Machine Bench Press',
      ];
    } else if (state == "Back") {
      workoutItem = [
        'Select Workout',
        'Back Pull Ups',
        'Back Lat Pull Down',
        'Back Seated Row',
      ];
    } else if (state == "Shoulder") {
      workoutItem = [
        'Select Workout',
        'Back Pull Ups',
        'Back Lat Pull Down',
        'Back Seated Row',
      ];
    } else if (state == "Leg") {
      workoutItem = [
        'Select Workout',
        'Back Pull Ups',
        'Back Lat Pull Down',
        'Back Seated Row',
      ];
    }
  }
}

class ChangeDropDownSetCubit extends Cubit<String> {
  ChangeDropDownSetCubit() : super('Select Workout');

  void selectItem(String item) => emit(item);
}
