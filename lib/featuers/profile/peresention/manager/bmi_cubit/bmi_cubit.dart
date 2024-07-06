import 'package:flutter_bloc/flutter_bloc.dart';

class BmiCubit extends Cubit<double> {
  BmiCubit() : super(0);
  void calculateBMI(double x) {
    print(x);
    emit(x);
  }
}
