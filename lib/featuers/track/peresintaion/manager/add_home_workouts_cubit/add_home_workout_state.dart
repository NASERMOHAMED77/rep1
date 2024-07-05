// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';


abstract class AddHomeWorkoutStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddHomeWorkoutInit extends AddHomeWorkoutStates {}

class AddHomeWorkoutLoading extends AddHomeWorkoutStates {}

class AddHomeWorkoutSuccess extends AddHomeWorkoutStates {
 
}

class AddHomeWorkoutFailure extends AddHomeWorkoutStates {
  final String msg;

  AddHomeWorkoutFailure(this.msg);
}
