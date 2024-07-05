// ignore_for_file: unused_field

import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rep1/featuers/explore/data/model/workout_model.dart';
import 'package:rep1/featuers/explore/data/repo/repo.dart';
import 'package:rep1/featuers/explore/peresintaion/manager/get_workouts_cubit/get_workouts_states.dart';

class GetWorkoutsCubit extends Cubit<GetWorkoutsStates> {
  GetWorkoutsCubit(this.exploreRepo) : super(GetWorkoutsInit());
  ExploreRepo exploreRepo;
  List<WorkoutModel> workouts = [];
  late Stream<StepCount> _stepCountStream;

  late Stream<PedestrianStatus> _pedestrianStatusStream;

  String _status = ' ', steps = '?';

  void onStepCount(StepCount event) {
    steps = event.steps.toString();
    emit(ChangestepsSucess(steps: steps));
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    _status = event.status;
  }

  void onPedestrianStatusError(error) {
    _status = 'Pedestrian Status not available';
  }

  void onStepCountError(error) {
    steps = 'Step Count not available';
    emit(ChangestepsFail(steps: steps));
  }

  void initPlatformState() async {
    if (await Permission.activityRecognition.request().isGranted) {
      _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
      _pedestrianStatusStream
          .listen(onPedestrianStatusChanged)
          .onError(onPedestrianStatusError);

      _stepCountStream = Pedometer.stepCountStream;
      _stepCountStream.listen(onStepCount).onError(onStepCountError);
    } else {}
  }

  getWoekouts() async {
    try {
      emit(GetWorkoutsLoading());
      workouts = await exploreRepo.getExploreData();
      emit(GetWorkoutsSucess());
    } catch (e) {
      emit(GetWorkoutfialure(msg: e.toString()));
    }
  }
}

class CounterWorkoutCubit extends Cubit<int> {
  CounterWorkoutCubit() : super(0);

  void increment() => emit(state + 1);

  void decrement() => emit(state - 1);
  void zeroit() => emit(0);
  void setValue(int newValue) => emit(newValue);
}
