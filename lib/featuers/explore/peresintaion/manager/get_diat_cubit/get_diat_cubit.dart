import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rep1/featuers/explore/data/model/diat_plan_model.dart';
import 'package:rep1/featuers/explore/data/repo/repo.dart';
import 'package:rep1/featuers/explore/peresintaion/manager/get_diat_cubit/get_diat_states.dart';

class GetDiatPlansCubit extends Cubit<GetDiatPlansStates> {
  GetDiatPlansCubit(this.exploreRepo) : super(GetDiatPlansInit());
  ExploreRepo exploreRepo;
  List<DiatPlanModel> daitPlans = [];
  

  getDaitPlans() async {
    try {
      emit(GetDiatPlansLoading());
      daitPlans = await exploreRepo.getDaitPlansData();
      emit(GetDiatPlansSucess(daitplans: daitPlans));
    } catch (e) {
      emit(GetDiatPlansfialure(msg: e.toString()));
    }
  }
}
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);

  void decrement() => emit(state - 1);

  void setValue(int newValue) => emit(newValue);
}