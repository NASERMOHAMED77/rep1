import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:rep1/core/colors.dart';
import 'package:rep1/core/styles.dart';
import 'package:rep1/featuers/explore/peresintaion/manager/get_home_workouts.dart/get_home_workouts_cubit.dart';
import 'package:rep1/featuers/explore/peresintaion/manager/get_home_workouts.dart/get_home_workouts_states.dart';
import 'package:rep1/featuers/explore/peresintaion/view/explore.dart';

import 'package:rep1/featuers/explore/peresintaion/view/explore_chalanges/walk.dart';
import 'package:rep1/featuers/explore/peresintaion/view/explore_widgets/workout_step/workout_buttun.dart';

class ContainersViewChanallageWidget extends StatelessWidget {
  const ContainersViewChanallageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FeaturesRowCircleWidget(
                  function: () {
                    BlocProvider.of<CounterMainWorkoutCubit>(context).zeroit();
                    BlocProvider.of<GetMainWorkoutCubit>(context)
                        .getHomeWorkouts("Warm");

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FeaturesView()));
                  },
                  svg: 'assets/svgs/stretchess.svg',
                  text: "Warm up",
                  color: const Color.fromARGB(255, 209, 187, 233)),
              FeaturesRowCircleWidget(
                function: () {
                  BlocProvider.of<GetMainWorkoutCubit>(context)
                      .getHomeWorkouts("Core");
                  BlocProvider.of<CounterMainWorkoutCubit>(context).zeroit();

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FeaturesView()));
                },
                svg: 'assets/svgs/abs.svg',
                text: "Abs",
                color: Colors.amber,
              ),
              FeaturesRowCircleWidget(
                  function: () {
                    BlocProvider.of<CounterMainWorkoutCubit>(context).zeroit();
                    BlocProvider.of<GetMainWorkoutCubit>(context)
                        .getHomeWorkouts("Forearms");

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FeaturesView()));
                  },
                  svg: 'assets/svgs/logo.svg',
                  text: "Wrist",
                  color: const Color(0xffE9C46A)),
              FeaturesRowCircleWidget(
                  function: () {
                    BlocProvider.of<GetMainWorkoutCubit>(context)
                        .getHomeWorkouts("UpperBodyBeg");

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FeaturesView()));
                  },
                  svg: 'assets/svgs/upperbody.svg',
                  text: "Upper",
                  color: const Color.fromARGB(205, 197, 233, 106)),
              FeaturesRowCircleWidget(
                  function: () {
                    BlocProvider.of<CounterMainWorkoutCubit>(context).zeroit();
                    BlocProvider.of<GetMainWorkoutCubit>(context)
                        .getHomeWorkouts("LowerBody");

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FeaturesView()));
                  },
                  svg: 'assets/svgs/leg.svg',
                  text: "Lower",
                  color: const Color.fromARGB(169, 106, 233, 106)),
              FeaturesRowCircleWidget(
                  function: () {
                    BlocProvider.of<CounterMainWorkoutCubit>(context).zeroit();
                    BlocProvider.of<GetMainWorkoutCubit>(context)
                        .getHomeWorkouts("FullBody");

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FeaturesView()));
                  },
                  svg: 'assets/svgs/fullbody.svg',
                  text: "Full body",
                  color: const Color.fromARGB(255, 187, 233, 219)),
            ],
          ),
        ),
      ),
    );
  }
}

class FeaturesView extends StatefulWidget {
  const FeaturesView({super.key});

  @override
  State<FeaturesView> createState() => _FeaturesViewState();
}

class _FeaturesViewState extends State<FeaturesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child:
          BlocBuilder<GetMainWorkoutCubit, GetMainWorkoutsStates>(
              builder: (context, state) {
        if (state is GetMainWorkoutsInit) {
          return const Center(
            child: CircularProgressIndicator(
                backgroundColor: ColorManager.orangeAppColor),
          );
        } else if (state is GetMainWorkoutsSucess) {
          return BlocBuilder<CounterMainWorkoutCubit, int>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const LogoWidget(),
                      Center(
                        child: Text(
                          BlocProvider.of<GetMainWorkoutCubit>(context)
                              .workouts[0]
                              .name
                              .toString(),
                          style:
                              Styles.textStyle10w700.copyWith(fontSize: 16.sp),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 300,
                    child: Image.network(BlocProvider.of<GetMainWorkoutCubit>(
                            context)
                        .workouts[0]
                        .exercises![
                            BlocProvider.of<CounterMainWorkoutCubit>(context)
                                .state]
                        .gif
                        .toString()),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        Text(
                          BlocProvider.of<GetMainWorkoutCubit>(context)
                              .workouts[0]
                              .exercises![
                                  BlocProvider.of<CounterMainWorkoutCubit>(
                                          context)
                                      .state]
                              .exercise
                              .toString(),
                          style: Styles.textStyle10w700.copyWith(fontSize: 18),
                        ),
                        Text(
                          BlocProvider.of<GetMainWorkoutCubit>(context)
                              .workouts[0]
                              .exercises![
                                  BlocProvider.of<CounterMainWorkoutCubit>(
                                          context)
                                      .state]
                              .description
                              .toString(),
                          textAlign: TextAlign.center,
                          style: Styles.textStyle10w700.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  BlocProvider(
                    create: (context) => StopwatchCubit(),
                    child: Column(
                      children: [
                        BlocBuilder<StopwatchCubit, StopwatchState>(
                          builder: (context, state) {
                            return Column(
                              children: [
                                // Center(
                                //   child: GestureDetector(
                                //     onTap: context.read<TimerCubit>().state <= 0
                                //         ? null
                                //         : () => context
                                //             .read<TimerCubit>()
                                //             .initTimer(30),
                                //     child: CircularPercentIndicator(
                                //       radius: 40.w,
                                //       center: Text(state.toString()),
                                //       progressColor:
                                //           ColorManager.orangeAppColor,
                                //       percent: (BlocProvider.of<
                                //                           GetMainWorkoutCubit>(
                                //                       context)
                                //                   .workouts[0]
                                //                   .exercises![BlocProvider.of<
                                //                               CounterMainWorkoutCubit>(
                                //                           context)
                                //                       .state]
                                //                   .reps!
                                //                   .toInt() -
                                //               state) /
                                //           BlocProvider.of<GetMainWorkoutCubit>(
                                //                   context)
                                //               .workouts[0]
                                //               .exercises![BlocProvider.of<
                                //                           CounterMainWorkoutCubit>(
                                //                       context)
                                //                   .state]
                                //               .reps!
                                //               .toInt(),
                                //     ),
                                //   ),
                                // ),
                                Text(
                                  '${state.seconds ~/ 60}:${(state.seconds % 60).toString().padLeft(2, '0')}',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 48),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: context
                                              .read<StopwatchCubit>()
                                              .state
                                              .isRunning
                                          ? null
                                          : () => context
                                              .read<StopwatchCubit>()
                                              .start(),
                                      child: Text(
                                        'Start',
                                        style: Styles.textStyle10w700.copyWith(
                                            color: ColorManager.orangeAppColor),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    ElevatedButton(
                                      onPressed: context
                                              .read<StopwatchCubit>()
                                              .state
                                              .isRunning
                                          ? () => context
                                              .read<StopwatchCubit>()
                                              .stop()
                                          : null,
                                      child: Text(
                                        'Stop',
                                        style: Styles.textStyle10w700
                                            .copyWith(color: Colors.grey),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    ElevatedButton(
                                      onPressed: () => context
                                          .read<StopwatchCubit>()
                                          .reset(),
                                      child: Text(
                                        'Reset',
                                        style: Styles.textStyle10w700.copyWith(
                                            color: ColorManager.orangeAppColor),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        WorkoutViewButtun(
                                          textcolor: Colors.grey,
                                          color: Colors.grey,
                                          text: "Back",
                                          onpressed: () {
                                            context
                                                .read<StopwatchCubit>()
                                                .reset();
                                            context
                                                .read<StopwatchCubit>()
                                                .stop();
                                            if (BlocProvider.of<
                                                            CounterMainWorkoutCubit>(
                                                        context)
                                                    .state >
                                                0) {
                                              BlocProvider.of<
                                                          CounterMainWorkoutCubit>(
                                                      context)
                                                  .decrement();
                                            } else {}
                                          },
                                          containerColor: Colors.white,
                                        ),

                                        // WorkoutViewButtun(
                                        //   textcolor: Colors.white,
                                        //   color: ColorManager.orangeAppColor,
                                        //   containerColor: ColorManager.orangeAppColor,
                                        //   text: "Track",
                                        //   onpressed: () {
                                        //     showDialog(
                                        //         context: context,
                                        //         builder: (context) {
                                        //           return const WorkoutViewDailog();
                                        //         });
                                        //   },
                                        // ),
                                        WorkoutViewButtun(
                                          textcolor:
                                              ColorManager.orangeAppColor,
                                          color: ColorManager.orangeAppColor,
                                          containerColor: Colors.white,
                                          text: "Next",
                                          onpressed: () {
                                            context
                                                .read<StopwatchCubit>()
                                                .reset();
                                            context
                                                .read<StopwatchCubit>()
                                                .stop();
                                            if (BlocProvider.of<
                                                            CounterMainWorkoutCubit>(
                                                        context)
                                                    .state <
                                                BlocProvider.of<GetMainWorkoutCubit>(
                                                            context)
                                                        .workouts[0]
                                                        .exercises!
                                                        .length -
                                                    1) {
                                              BlocProvider.of<
                                                          CounterMainWorkoutCubit>(
                                                      context)
                                                  .increment();
                                            } else {
                                              //               // BlocProvider.of<CounterWorkoutCubit>(context)
                                              //               //     .zeroit();
                                            }
                                          },
                                        )
                                      ]),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        } else {
          return const Center(child: Text("no data"));
        }
      })),
    );
  }
}
