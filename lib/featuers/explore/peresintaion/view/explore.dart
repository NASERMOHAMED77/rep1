// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:rep1/core/colors.dart';
import 'package:rep1/core/styles.dart';
import 'package:rep1/featuers/explore/peresintaion/manager/get_articles_cubit/get_articles_cubit.dart';
import 'package:rep1/featuers/explore/peresintaion/manager/get_diat_cubit/get_diat_cubit.dart';
import 'package:rep1/featuers/explore/peresintaion/manager/get_workouts_cubit/get_workouts_cubit.dart';
import 'package:rep1/featuers/explore/peresintaion/view/explor_widgets/explor_view_fea.dart';
import 'package:rep1/featuers/explore/peresintaion/view/explore_widgets/Record_step/record_step_widget.dart';
import 'package:rep1/featuers/explore/peresintaion/view/explore_widgets/article_step/article_step_widget.dart';
import 'package:rep1/featuers/explore/peresintaion/view/explore_widgets/diet_step/diet_step_widget.dart';
import 'package:rep1/featuers/explore/peresintaion/view/explore_widgets/water_step/water_widget.dart';
import 'package:rep1/featuers/explore/peresintaion/view/explore_widgets/workout_step/workout_step_widget.dart';
import 'package:rep1/featuers/profile/peresention/manager/bmi_cubit/bmi_cubit.dart';

class ExploreViewFea extends StatefulWidget {
  const ExploreViewFea({super.key});

  @override
  State<ExploreViewFea> createState() => _ExploreViewFeaState();
}

class _ExploreViewFeaState extends State<ExploreViewFea> {
  int currentStep = 0;
  @override
  void initState() {
    BlocProvider.of<GetWorkoutsCubit>(context).getWoekouts();
    BlocProvider.of<GetWorkoutsCubit>(context).initPlatformState();
    BlocProvider.of<GetArticlesCubit>(context).getArticles();
    BlocProvider.of<GetDiatPlansCubit>(context).getDaitPlans();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const LogoWidget(),
            const ContainersViewChanallageWidget(),
            SizedBox(
              height: 230.h,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ContainerHumanDetailsWidget(
                            text: BlocProvider.of<GetWorkoutsCubit>(context)
                                .steps
                                .toString(),
                            svg: 'assets/svgs/steps.svg',
                            title: "Steps",
                            he: 110.h,
                            linewe: 50.w,
                            we: 150.w,
                            color: Colors.white,
                            linecolor: ColorManager.orangeAppColor,
                          ),
                          BlocProvider(
                            create: (context) => BmiCubit(),
                            child: BlocBuilder<BmiCubit, double>(
                              builder: (context, state) {
                                return ContainerHumanDetailsWidget(
                                  title: "Bmi",
                                  svg: "assets/svgs/bmi.svg",
                                  text: "25",
                                  he: 110.h,
                                  linewe: 50.w,
                                  we: 150.w,
                                  color: Colors.white,
                                  linecolor: ColorManager.orangeAppColor,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    ContainerHumanDetailsWidget(
                      title: "Calories need",
                      svg: "assets/svgs/cal.svg",
                      text: "2000 Cal",
                      he: 110.h,
                      linecolor: Colors.white,
                      linewe: 110.w,
                      we: double.infinity,
                      color: ColorManager.orangeAppColor,
                    ),
                  ],
                ),
              ),
            ),
            Stepper(
                physics: const NeverScrollableScrollPhysics(),
                onStepTapped: (val) {
                  currentStep = val;
                  setState(() {});
                },
                currentStep: currentStep,
                controlsBuilder: (context, details) {
                  return const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [],
                  );
                },
                steps: [
                  Step(
                      isActive: currentStep == 0,
                      title: Text(
                        "Workout",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700),
                      ),
                      subtitle: Text(
                        BlocProvider.of<GetWorkoutsCubit>(context)
                            .workouts[0]
                            .title
                            .toString(),
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 8,
                            fontWeight: FontWeight.w700),
                      ),
                      content: const WorkoutStepWidget()),
                  Step(
                      isActive: currentStep == 1,
                      title: Text(
                        "Diet",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700),
                      ),
                      subtitle: const Text(
                        "1500Cal",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 8,
                            fontWeight: FontWeight.w700),
                      ),
                      content: const SizedBox(
                        width: double.infinity,
                        child: DietStepWidget(),
                      )),
                  Step(
                      isActive: currentStep == 2,
                      title: Text(
                        "Water",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700),
                      ),
                      subtitle: const Text(
                        "4 liters",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 8,
                            fontWeight: FontWeight.w700),
                      ),
                      content: const WaterStepWidget()),
                  Step(
                      isActive: currentStep == 3,
                      title: Text(
                        "Records",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700),
                      ),
                      subtitle: const Text(
                        "Challanges",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 8,
                            fontWeight: FontWeight.w700),
                      ),
                      content: const RecordStepWidget()),
                  Step(
                      isActive: currentStep == 4,
                      title: Text(
                        "Articles",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700),
                      ),
                      subtitle: const Text(
                        "Knowladge",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 8,
                            fontWeight: FontWeight.w700),
                      ),
                      content: const ArticleStepWidget()),
                ])
          ],
        ),
      )),
    );
  }
}

class ContainerHumanDetailsWidget extends StatelessWidget {
  const ContainerHumanDetailsWidget({
    super.key,
    required this.text,
    required this.svg,
    required this.title,
    required this.he,
    required this.we,
    required this.linewe,
    required this.color,
    required this.linecolor,
  });
  final String text;
  final String svg;
  final String title;
  final Color color;
  final Color linecolor;
  final double he;
  final double we;
  final double linewe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, bottom: 5),
      child: Container(
        height: he,
        width: we,
        decoration: BoxDecoration(
            color: color,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 4,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            border: Border.all(color: const Color.fromARGB(90, 224, 224, 224)),
            borderRadius: BorderRadius.circular(25)),
        child: Padding(
          padding: EdgeInsets.all(8.0.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "   " + title,
                          style:
                              Styles.textStyle10w700.copyWith(fontSize: 8.sp),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        LinearPercentIndicator(
                          width: linewe,
                          progressColor: linecolor,
                          percent: .8,
                          barRadius: const Radius.circular(25),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        text == "Step Count not available"
                            ? " Error"
                            : " " + text,
                        style: Styles.textStyle10w700.copyWith(fontSize: 8.sp),
                      ),
                    ),
                  ]),
              Padding(
                padding: const EdgeInsets.all(16),
                child: SvgPicture.asset(
                  svg,
                  color: Colors.black,
                  height: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Text(
            'Rep 1',
            style: Styles.textStyleTitle
                .copyWith(color: ColorManager.orangeAppColor, fontSize: 20),
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
    );
  }
}

class RecordRowWidget extends StatelessWidget {
  const RecordRowWidget({
    Key? key,
    required this.record,
    required this.color,
  }) : super(key: key);
  final String record;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        height: 30.h,
        width: 120.w,
        decoration: BoxDecoration(
          border: Border.all(color: color, width: 3),
          borderRadius: BorderRadius.circular(5),
        ),
        child: FittedBox(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              record,
              style: Styles.textStyle10w700,
            ),
          ),
        ),
      ),
    );
  }
}

class MealRowWidget extends StatelessWidget {
  MealRowWidget({
    super.key,
    required this.mealTitle,
  });
  final String mealTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              mealTitle,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700),
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: SvgPicture.asset(
                    "assets/svgs/logo.svg",
                    height: 20.h,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class StepCard extends StatelessWidget {
  final int stepNumber;
  final String stepDescription;
  final IconData icon;

  StepCard(
      {required this.stepNumber,
      required this.stepDescription,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text('Step $stepNumber: $stepDescription'),
      ),
    );
  }
}
