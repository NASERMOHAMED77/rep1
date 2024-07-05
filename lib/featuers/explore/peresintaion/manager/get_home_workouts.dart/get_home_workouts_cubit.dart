import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rep1/featuers/explore/data/model/home_workout_model.dart';
import 'package:rep1/featuers/explore/data/repo/repo.dart';
import 'package:rep1/featuers/explore/peresintaion/manager/get_home_workouts.dart/get_home_workouts_states.dart';

class GetMainWorkoutCubit extends Cubit<GetMainWorkoutsStates> {
  GetMainWorkoutCubit(this.exploreRepo) : super(GetMainWorkoutsInit());
  ExploreRepo exploreRepo;
  List<HomeWorkoutModel> workouts = [];

  getHomeWorkouts(String workout) async {
    try {
      emit(GetMainWorkoutsInit());
      workouts = await exploreRepo.getHomeWorkoutData(workout);
      print(workouts);
      emit(GetMainWorkoutsSucess(workouts: workouts));
    } catch (e) {
      emit(GetMainWorkoutsFail(e.toString()));
    }
  }
}

class CounterMainWorkoutCubit extends Cubit<int> {
  CounterMainWorkoutCubit() : super(0);

  void increment() => emit(state + 1);

  void decrement() => emit(state - 1);
  void zeroit() => emit(0);
  void setValue(int newValue) => emit(newValue);
}
class StopwatchCubit extends Cubit<StopwatchState> {
  Timer? _timer;
  int _seconds = 0;

  StopwatchCubit() : super(StopwatchState.initial());

  void start() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        _seconds++;
        emit(StopwatchState.running(_seconds));
      },
    );
  }

  void stop() {
    _timer?.cancel();
    emit(StopwatchState.stopped(_seconds));
  }

  void reset() {
    _seconds = 0;
    emit(StopwatchState.initial());
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}

// Stopwatch State
class StopwatchState {
  final int seconds;
  final bool isRunning;

  StopwatchState({required this.seconds, required this.isRunning});

  factory StopwatchState.initial() => StopwatchState(seconds: 0, isRunning: false);
  factory StopwatchState.running(int seconds) => StopwatchState(seconds: seconds, isRunning: true);
  factory StopwatchState.stopped(int seconds) => StopwatchState(seconds: seconds, isRunning: false);
}

// // Timer Cubit
// class TimerCubit extends Cubit<int> {
//   Timer? _timer;

//   TimerCubit() : super(30);

//   void initTimer(int x) {
//     emit(x);
//     _timer = Timer.periodic(
//       const Duration(seconds: 1),
//       (timer) {
//         emit(state - 1);
//         if (state == 0) {
//           _timer?.cancel();
//         }
//       },
//     );
//   }
// void stop(int x) {
//     emit(x);
//     _timer = Timer.periodic(
//       const Duration(seconds: 1),
//       (timer) {
//         emit(state - 1);
//         if (state == 0) {
//           _timer?.cancel();
//         }
//       },
//     );
//   }

//   @override
//   Future<void> close() {
//     _timer?.cancel();
//     return super.close();
//   }
// }
