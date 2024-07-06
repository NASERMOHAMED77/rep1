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
        'Incline Bar Bench Press',
        'Decline Bar Bench Press',
        'Incline Dumbel Bench Press',
        'Decline Dumbel Bench Press',
        'Incline Machine Bench Press',
        'Close-Grip Bench Press',
        'Cable crossover',
        'Bench Fly',
      ];
    } else if (state == "Back") {
      workoutItem = [
        'Select Workout',
        'Pull Ups',
        'Back Pull Ups',
        'Seated Cable Rows',
        'Barbell rowing underhand grip',
        'Back Lat Pull Down',
        'Back Seated Row',
        'One-arm dumbbell row',
        'Deadlifts',
      ];
    } else if (state == "Shoulder") {
      workoutItem = [
        'Select Workout',
        'Military Press',
        'Lateral Raises',
        'dumbbell lateral raise',
        'Buttefly Reverse Machine',
      ];
    } else if (state == "Triesips") {
      workoutItem = [
        'Select Workout',
        'Triceps Overhead Extensions',
        'Triceps Pushdowns',
        'Dips',
        'dumbbell triceps kickback',
      ];
    } else if (state == "Biceps") {
      workoutItem = [
        'Select Workout',
        'Bicep Curls',
        'Biceps Curls Device',
        'Scott curls seated dumbbell',
        'Hammer curl dumbbell',
      ];
    } else if (state == "Leg") {
      workoutItem = [
        'Select Workout',
        'Squats',
        'Lunge',
        "45 degree leg press  machine",
        'Leg Curls machine',
        'Lever Seated Calf Raise',
      ];
    }
  }
}

class ChangeDropDownSetCubit extends Cubit<String> {
  ChangeDropDownSetCubit() : super('Select Workout');

  void selectItem(String item) => emit(item);
}
