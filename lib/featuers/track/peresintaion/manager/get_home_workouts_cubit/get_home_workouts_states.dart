// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:rep1/featuers/track/data/model/workout_track_model.dart';

abstract class GetHomeWorkoutStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetHomeWorkoutInit extends GetHomeWorkoutStates {}

class GetHomeWorkoutLoading extends GetHomeWorkoutStates {}

// ignore: must_be_immutable
class GetHomeWorkoutSuccess extends GetHomeWorkoutStates {
  List<WorkoutTrackModel> workouts;
  GetHomeWorkoutSuccess({
    required this.workouts,
  });
}

class GetHomeWorkoutFailure extends GetHomeWorkoutStates {
  final String msg;

  GetHomeWorkoutFailure(this.msg);
}
