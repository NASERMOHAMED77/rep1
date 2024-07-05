import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rep1/core/colors.dart';

import 'package:rep1/featuers/track/peresintaion/manager/get_home_workouts_cubit/get_home_workouts_cubit.dart';
import 'package:rep1/featuers/track/peresintaion/manager/get_home_workouts_cubit/get_home_workouts_states.dart';
import 'package:rep1/featuers/track/peresintaion/view/home_view_widgets/row_bar_text_widget.dart';

class WorkoutsListViewWidget extends StatelessWidget {
  const WorkoutsListViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<GetHomeWorkoutCubit, GetHomeWorkoutStates>(
        builder: (context, state) {
          if (state is GetHomeWorkoutLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorManager.orangeAppColor,
              ),
            );
          } else if (state is GetHomeWorkoutSuccess) {
            return ListView.builder(
                itemCount: state.workouts.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 120.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: ColorManager.orangeWithOp10Color),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            MealDetailsRowWidget(
                              info: state.workouts[index].workout.toString(),
                              title: "Workout: ",
                            ),
                            MealDetailsRowWidget(
                              info: state.workouts[index].workoutSet.toString(),
                              title: "Workout: ",
                            ),
                            MealDetailsRowWidget(
                              info: state.workouts[index].sets.toString(),
                              title: "sets: ",
                            ),
                            MealDetailsRowWidget(
                              info: state.workouts[index].reps.toString(),
                              title: "Reps: ",
                            ),
                            MealDetailsRowWidget(
                              info: state.workouts[index].rest.toString(),
                              title: "rest: ",
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorManager.orangeAppColor,
              ),
            );
          }
        },
      ),
    );
  }
}
