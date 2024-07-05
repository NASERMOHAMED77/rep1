// ignore_for_file: non_constant_identifier_names, must_be_immutable, prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rep1/core/colors.dart';
import 'package:rep1/core/styles.dart';
import 'package:rep1/featuers/track/data/model/workout_track_model.dart';
import 'package:rep1/featuers/track/peresintaion/manager/add_home_workouts_cubit/add_home_workout_cubit.dart';
import 'package:rep1/featuers/track/peresintaion/manager/get_home_workouts_cubit/get_home_workouts_cubit.dart';
import 'package:rep1/featuers/track/peresintaion/view/home_view_widgets/add_workouts_widgets/dropdown_workoutSet_widget.dart';
import 'package:rep1/featuers/track/peresintaion/view/home_view_widgets/add_workouts_widgets/dropdown_workout_widget.dart';
import 'package:rep1/featuers/track/peresintaion/view/home_view_widgets/add_workouts_widgets/row_reps_sets_widget.dart';

class WorkoutFloatingButtunWidget extends StatelessWidget {
  const WorkoutFloatingButtunWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerSets = TextEditingController();
    TextEditingController controllerReps = TextEditingController();
    TextEditingController controllerRest = TextEditingController();

    final _key = GlobalKey<FormState>();
    return FloatingActionButton(
      shape: const CircleBorder(),
      backgroundColor: ColorManager.orangeAppColor,
      onPressed: () {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  backgroundColor: Colors.white,
                  content: SizedBox(
                    height: 300.h,
                    width: double.infinity.w,
                    child: Form(
                      key: _key,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Add new Workout',
                            style: Styles.textStyle10w700,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          DropDownWorkoutWidget(),
                          DropDownSetWidget(),
                          SizedBox(
                            height: 5.h,
                          ),
                          RepsAndSetsWidget(
                              controllerSets: controllerSets,
                              controllerReps: controllerReps),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text.rich(TextSpan(
                                      text: 'Rest',
                                      style: Styles.textStyle10w700.copyWith(
                                          fontSize: 10.h,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                            text: '  (S)',
                                            style: TextStyle(fontSize: 6.sp))
                                      ])),
                                  SizedBox(
                                    height: 40.h,
                                    width: 120.w,
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'this must\'nt be Empty';
                                        }
                                        return null;
                                      },
                                      controller: controllerRest,
                                      onChanged: (value) {},
                                      cursorColor: ColorManager.orangeAppColor,
                                      decoration: InputDecoration(
                                        enabled: true,
                                        filled: true,
                                        contentPadding: EdgeInsets.all(10),
                                        fillColor:
                                            ColorManager.orangeWithOp10Color,
                                        floatingLabelAlignment:
                                            FloatingLabelAlignment.center,
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 0, color: Colors.white)),
                                        enabledBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 0, color: Colors.white)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.h),
                                child: TextButton(
                                    style: const ButtonStyle(
                                        textStyle: MaterialStatePropertyAll(
                                            TextStyle(color: Colors.white)),
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                          ColorManager.orangeAppColor,
                                        )),
                                    onPressed: () {
                                      if (_key.currentState!.validate()) {
                                        BlocProvider.of<AddHomeWorkoutCubit>(
                                                context)
                                            .addWorkout(WorkoutTrackModel(
                                                workoutSet: BlocProvider.of<
                                                            ChangeDropDownSetCubit>(
                                                        context)
                                                    .state,
                                                workout: BlocProvider.of<
                                                            ChangeDropDownWorkoutCubit>(
                                                        context)
                                                    .state,
                                                sets: controllerSets.text,
                                                reps: controllerReps.text,
                                                rest: controllerRest.text,
                                                day: BlocProvider.of<
                                                            GetHomeWorkoutCubit>(
                                                        context)
                                                    .selectedday
                                                    .toString()
                                                    .split(" ")[0]));
                                        BlocProvider.of<GetHomeWorkoutCubit>(
                                          context,
                                        ).getWorkoutHomeData(
                                            day: BlocProvider.of<
                                                        GetHomeWorkoutCubit>(
                                                    context)
                                                .selectedday
                                                .toString()
                                                .split(" ")[0]);
                                        Navigator.pop(context);
                                      }
                                    },
                                    child: Text(
                                      "Done",
                                      style: Styles.textStyle10w700
                                          .copyWith(color: Colors.white),
                                    )),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ));

        // showModalBottomSheet(
        //   shape: const RoundedRectangleBorder(
        //     borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
        //   ),
        //   backgroundColor: Colors.white,
        //   context: context,
        //   builder: (context) {
        //     return SizedBox(
        //       width: double.infinity,
        //       height: 100.h,
        //       child: Padding(
        //         padding: const EdgeInsets.symmetric(horizontal: 20),
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.spaceAround,
        //           children: [
        //             AddWorkoutWidget(),
        //              AddMealWidget(),
        //           ],
        //         ),
        //       ),
        //     );
        //   },
        // );
      },
      child: Icon(
        Icons.add,
        size: 25.h,
        color: Colors.white,
      ),
    );
  }
}


                      //   alignment: Alignment.centerLeft,
                      //   value: item,
                      //   child: Text(
                      //     item,
                      //     style: Styles.textStyle10w700,
                      //   ),
                      // );
                  //   }
                  // }).toList()