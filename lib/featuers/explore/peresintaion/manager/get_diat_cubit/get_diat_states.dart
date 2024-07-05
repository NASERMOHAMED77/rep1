// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:rep1/featuers/explore/data/model/diat_plan_model.dart';

abstract class GetDiatPlansStates {}

class GetDiatPlansInit extends GetDiatPlansStates {
  
}

class GetDiatPlansSucess extends GetDiatPlansStates {
  List<DiatPlanModel> daitplans;
  GetDiatPlansSucess({
    required this.daitplans,
  });
}

class GetDiatPlansLoading extends GetDiatPlansStates {}

class GetDiatPlansfialure extends GetDiatPlansStates {
  String msg;
  GetDiatPlansfialure({
    required this.msg,
  });
}
