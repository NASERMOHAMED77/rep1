import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:rep1/core/colors.dart';
import 'package:rep1/featuers/explore/peresintaion/manager/get_workouts_cubit/get_workouts_cubit.dart';
import 'package:rep1/featuers/explore/peresintaion/view/explore_widgets/workout_step/workout_view.dart';

class WorkoutStepWidget extends StatelessWidget {
  const WorkoutStepWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 210.h,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: BlocProvider.of<GetWorkoutsCubit>(context)
                .workouts[0]
                .workouts!
                .length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50.h,
                  child: LinearPercentIndicator(
                    lineHeight: 50.h,
                    barRadius: const Radius.circular(25),
                    percent: .0,
                    backgroundColor: Colors.white,
                    progressColor: ColorManager.orangeWithOp10Color,
                    center: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(25)),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WorkoutView(x: index)));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Day ${index + 1}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                              Row(
                                children: [
                                  Text(
                                    BlocProvider.of<GetWorkoutsCubit>(context)
                                        .workouts[0]
                                        .workouts![index]
                                        .muscleGroup![0]
                                        .toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 8.sp,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    child: SvgPicture.asset(
                                      "assets/svgs/logo.svg",
                                      height: 20.h,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
