import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rep1/featuers/track/data/model/workout_track_model.dart';
import 'package:rep1/featuers/track/data/repo/home_repo.dart';
import 'package:rep1/featuers/track/peresintaion/manager/get_home_workouts_cubit/get_home_workouts_states.dart';

class GetHomeWorkoutCubit extends Cubit<GetHomeWorkoutStates> {
  GetHomeWorkoutCubit(this.homeRepo) : super(GetHomeWorkoutInit());
  HomeRepo homeRepo;
  DateTime selectedday = DateTime.now();
  List result = [];
  getWorkoutHomeData({required String day}) {
    emit(GetHomeWorkoutLoading());
    try {
      List <WorkoutTrackModel>result = [];

      homeRepo.getMyWorkouts();
      // print(homeRepo.getMyWorkouts().length);
      for (var element in homeRepo.getMyWorkouts()) {
        if (element.day == day) {
          result.add(element);
        }
      }
      // print(result.length);
      emit(GetHomeWorkoutSuccess(workouts: result));
      return result;
    } catch (e) {
      emit(GetHomeWorkoutFailure(e.toString()));
    }
  }
}
