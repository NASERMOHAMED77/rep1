import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rep1/featuers/profile/data/repo/repo.dart';

class ProfileCubit extends Cubit<String> {
  ProfileCubit(this.profileRepo) : super("done");
  ProfileRepo profileRepo;
  x() {
    profileRepo.generatePdf();
  }
}

class CalorieCubit extends Cubit<double> {
  CalorieCubit() : super(0);
  void calculateCal(double x) {
    emit(x);
  }
}
class ChangeDropDownCalCubit extends Cubit<String> {
  ChangeDropDownCalCubit() : super('Select Workout');

  void selectItem(String item) => emit(item);
}
