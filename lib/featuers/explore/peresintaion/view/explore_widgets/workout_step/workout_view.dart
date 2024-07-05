// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:rep1/core/colors.dart';
import 'package:rep1/core/styles.dart';
import 'package:rep1/featuers/explore/peresintaion/manager/get_workouts_cubit/get_workouts_cubit.dart';
import 'package:rep1/featuers/explore/peresintaion/view/explore.dart';
import 'package:rep1/featuers/explore/peresintaion/view/explore_widgets/workout_step/workout_buttun.dart';
import 'package:rep1/featuers/track/data/model/workout_track_model.dart';
import 'package:rep1/featuers/track/peresintaion/manager/add_home_workouts_cubit/add_home_workout_cubit.dart';
import 'package:rep1/featuers/track/peresintaion/manager/get_home_workouts_cubit/get_home_workouts_cubit.dart';

class WorkoutView extends StatelessWidget {
  const WorkoutView({
    Key? key,
    required this.x,
  }) : super(key: key);
  final int x;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(8.0.h),
        child: BlocBuilder<CounterWorkoutCubit, int>(
          builder: (context, state) {
            return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const LogoWidget(),
                      SizedBox(
                        height: 100.h,
                        child: Text(
                          BlocProvider.of<GetWorkoutsCubit>(context)
                              .workouts[0]
                              .workouts![x]
                              .exercises![
                                  BlocProvider.of<CounterWorkoutCubit>(context)
                                      .state]
                              .exercise
                              .toString(),
                          textAlign: TextAlign.center,
                          style: Styles.textStyleTitle.copyWith(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 350.h,
                        child: Image.network(
                          BlocProvider.of<GetWorkoutsCubit>(context)
                              .workouts[0]
                              .workouts![x]
                              .exercises![
                                  BlocProvider.of<CounterWorkoutCubit>(context)
                                      .state]
                              .gif
                              .toString(),
                          width: double.infinity.w,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 100.h,
                    width: double.infinity.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          WorkoutViewButtun(
                            textcolor: Colors.grey,
                            color: Colors.grey,
                            text: "Back",
                            onpressed: () {
                              if (BlocProvider.of<CounterWorkoutCubit>(context)
                                      .state >
                                  0) {
                                BlocProvider.of<CounterWorkoutCubit>(context)
                                    .decrement();
                              } else {}
                            },
                            containerColor: Colors.white,
                          ),
                          WorkoutViewButtun(
                            textcolor: Colors.white,
                            color: ColorManager.orangeAppColor,
                            containerColor: ColorManager.orangeAppColor,
                            text: "Track",
                            onpressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return WorkoutViewDailog(
                                      x: x,
                                    );
                                  });
                            },
                          ),
                          WorkoutViewButtun(
                            textcolor: ColorManager.orangeAppColor,
                            color: ColorManager.orangeAppColor,
                            containerColor: Colors.white,
                            text: "Next",
                            onpressed: () {
                              if (BlocProvider.of<CounterWorkoutCubit>(context)
                                      .state <
                                  BlocProvider.of<GetWorkoutsCubit>(context)
                                          .workouts[0]
                                          .workouts![x]
                                          .exercises!
                                          .length -
                                      1) {
                                BlocProvider.of<CounterWorkoutCubit>(context)
                                    .increment();
                              } else {
                                // BlocProvider.of<CounterWorkoutCubit>(context)
                                //     .zeroit();
                              }
                            },
                          )
                        ]),
                  )
                ]);
          },
        ),
      )),
    );
  }
}

class WorkoutViewDailog extends StatelessWidget {
  WorkoutViewDailog({
    super.key,
    required this.x,
  });
  final int x;
  TextEditingController repscontrollar = TextEditingController();
  TextEditingController wightscontrollar = TextEditingController();
  TextEditingController restcontrollar = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: SizedBox(
        height: 300.h,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Wights*",
              style: Styles.textStyle10w700.copyWith(fontSize: 15),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 40.h,
                child: TextFormField(
                  controller: wightscontrollar,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'this must\'nt be Empty';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                  cursorColor: ColorManager.orangeAppColor,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabled: true,
                    filled: true,
                    hintStyle:
                        Styles.textStyle10w700.copyWith(color: Colors.grey),
                    hintText: "20kg,30kg,35kg",
                    contentPadding: const EdgeInsets.all(10),
                    fillColor: Colors.white,
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 0, color: Colors.white)),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 0, color: Colors.white)),
                  ),
                ),
              ),
            ),
            Text(
              "Reps*",
              style: Styles.textStyle10w700.copyWith(fontSize: 15),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 40.h,
                child: TextFormField(
                  controller: repscontrollar,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'this must\'nt be Empty';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                  cursorColor: ColorManager.orangeAppColor,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabled: true,
                    filled: true,
                    hintStyle:
                        Styles.textStyle10w700.copyWith(color: Colors.grey),
                    hintText: "8,10,12",
                    contentPadding: const EdgeInsets.all(10),
                    fillColor: Colors.white,
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 0, color: Colors.white)),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 0, color: Colors.white)),
                  ),
                ),
              ),
            ),
            Text(
              "Rest*",
              style: Styles.textStyle10w700.copyWith(fontSize: 15),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 40.h,
                child: TextFormField(
                  controller: restcontrollar,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'this must\'nt be Empty';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                  cursorColor: ColorManager.orangeAppColor,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabled: true,
                    filled: true,
                    hintStyle:
                        Styles.textStyle10w700.copyWith(color: Colors.grey),
                    hintText: "60,60,60",
                    contentPadding: const EdgeInsets.all(10),
                    fillColor: Colors.white,
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 0, color: Colors.white)),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 0, color: Colors.white)),
                  ),
                ),
              ),
            ),
            WorkoutViewButtun(
                onpressed: () {
                  BlocProvider.of<AddHomeWorkoutCubit>(context).addWorkout(
                      WorkoutTrackModel(
                          workoutSet: BlocProvider.of<GetWorkoutsCubit>(context)
                              .workouts[0]
                              .workouts![x]
                              .exercises![
                                  BlocProvider.of<CounterWorkoutCubit>(context)
                                      .state]
                              .exercise
                              .toString(),
                          sets: BlocProvider.of<GetWorkoutsCubit>(context)
                              .workouts[0]
                              .workouts![x]
                              .exercises![
                                  BlocProvider.of<CounterWorkoutCubit>(context)
                                      .state]
                              .sets
                              .toString(),
                          reps: restcontrollar.text,
                          rest: repscontrollar.text,
                          day: BlocProvider.of<GetHomeWorkoutCubit>(context)
                              .selectedday
                              .toString()
                              .split(" ")[0],
                          workout: BlocProvider.of<GetWorkoutsCubit>(context)
                              .workouts[0]
                              .workouts![x]
                              .muscleGroup
                              .toString()));
                  BlocProvider.of<GetHomeWorkoutCubit>(
                    context,
                  ).getWorkoutHomeData(
                      day: BlocProvider.of<GetHomeWorkoutCubit>(context)
                          .selectedday
                          .toString()
                          .split(" ")[0]);
                  Navigator.pop(context);
                },
                text: "track it",
                color: Colors.white,
                containerColor: ColorManager.orangeAppColor,
                textcolor: Colors.white)
          ]),
        ),
      ),
    );
  }
}
