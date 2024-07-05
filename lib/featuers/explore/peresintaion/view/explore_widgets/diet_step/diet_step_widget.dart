// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:rep1/core/colors.dart';
import 'package:rep1/core/styles.dart';
import 'package:rep1/featuers/explore/peresintaion/manager/get_diat_cubit/get_diat_cubit.dart';
import 'package:rep1/featuers/explore/peresintaion/view/explore.dart';

class DietStepWidget extends StatelessWidget {
  const DietStepWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DaitViewWidget(
                            protin: BlocProvider.of<GetDiatPlansCubit>(context)
                                .daitPlans[3]
                                .breakfast!
                                .protein
                                .toString(),
                            fat: BlocProvider.of<GetDiatPlansCubit>(context)
                                .daitPlans[3]
                                .breakfast!
                                .fat
                                .toString(),
                            carb: BlocProvider.of<GetDiatPlansCubit>(context)
                                .daitPlans[3]
                                .breakfast!
                                .carbohydrates
                                .toString(),
                            cal: BlocProvider.of<GetDiatPlansCubit>(context)
                                .daitPlans[3]
                                .breakfast!
                                .calories
                                .toString(),
                            text: BlocProvider.of<GetDiatPlansCubit>(context)
                                .daitPlans[3]
                                .breakfast!
                                .description!
                                .en
                                .toString(),
                            image: BlocProvider.of<GetDiatPlansCubit>(context)
                                .daitPlans[3]
                                .breakfast!
                                .image
                                .toString(),
                          )));
            },
            child: MealRowWidget(
              mealTitle: "Berakfast",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {},
            child: MealRowWidget(
              mealTitle: "Mid Morning snack",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DaitViewWidget(
                            protin: BlocProvider.of<GetDiatPlansCubit>(context)
                                .daitPlans[3]
                                .lunch!
                                .protein
                                .toString(),
                            fat: BlocProvider.of<GetDiatPlansCubit>(context)
                                .daitPlans[3]
                                .lunch!
                                .fat
                                .toString(),
                            carb: BlocProvider.of<GetDiatPlansCubit>(context)
                                .daitPlans[3]
                                .lunch!
                                .carbohydrates
                                .toString(),
                            cal: BlocProvider.of<GetDiatPlansCubit>(context)
                                .daitPlans[3]
                                .lunch!
                                .calories
                                .toString(),
                            text: BlocProvider.of<GetDiatPlansCubit>(context)
                                .daitPlans[3]
                                .lunch!
                                .description!
                                .en
                                .toString(),
                            image: BlocProvider.of<GetDiatPlansCubit>(context)
                                .daitPlans[3]
                                .lunch!
                                .image
                                .toString(),
                          )));
            },
            child: MealRowWidget(
              mealTitle: "Launch",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DaitViewWidget(
                            protin: BlocProvider.of<GetDiatPlansCubit>(context)
                                .daitPlans[3]
                                .snack!
                                .protein
                                .toString(),
                            fat: BlocProvider.of<GetDiatPlansCubit>(context)
                                .daitPlans[3]
                                .snack!
                                .fat
                                .toString(),
                            carb: BlocProvider.of<GetDiatPlansCubit>(context)
                                .daitPlans[3]
                                .snack!
                                .carbohydrates
                                .toString(),
                            cal: BlocProvider.of<GetDiatPlansCubit>(context)
                                .daitPlans[3]
                                .snack!
                                .calories
                                .toString(),
                            text: BlocProvider.of<GetDiatPlansCubit>(context)
                                .daitPlans[3]
                                .snack!
                                .description!
                                .en
                                .toString(),
                            image: BlocProvider.of<GetDiatPlansCubit>(context)
                                .daitPlans[3]
                                .snack!
                                .image
                                .toString(),
                          )));
            },
            child: MealRowWidget(
              mealTitle: "Snack",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DaitViewWidget(
                            protin: BlocProvider.of<GetDiatPlansCubit>(context)
                                .daitPlans[3]
                                .dinner!
                                .protein
                                .toString(),
                            fat: BlocProvider.of<GetDiatPlansCubit>(context)
                                .daitPlans[3]
                                .dinner!
                                .fat
                                .toString(),
                            carb: BlocProvider.of<GetDiatPlansCubit>(context)
                                .daitPlans[3]
                                .dinner!
                                .carbohydrates
                                .toString(),
                            cal: BlocProvider.of<GetDiatPlansCubit>(context)
                                .daitPlans[3]
                                .dinner!
                                .calories
                                .toString(),
                            text: BlocProvider.of<GetDiatPlansCubit>(context)
                                .daitPlans[3]
                                .dinner!
                                .description!
                                .en
                                .toString(),
                            image: BlocProvider.of<GetDiatPlansCubit>(context)
                                .daitPlans[3]
                                .dinner!
                                .image
                                .toString(),
                          )));
            },
            child: MealRowWidget(
              mealTitle: "Dinner",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            child: MealRowWidget(
              mealTitle: "Evening snack",
            ),
          ),
        ),
      ],
    );
  }
}

class DaitViewWidget extends StatelessWidget {
  const DaitViewWidget({
    Key? key,
    required this.image,
    required this.text,
    required this.protin,
    required this.carb,
    required this.fat,
    required this.cal,
  }) : super(key: key);
  final String image;
  final String text;
  final String protin;
  final String carb;
  final String fat;
  final String cal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
              width: double.infinity.w,
              height: 400,
              foregroundDecoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.white.withOpacity(.0),
                    Colors.white.withOpacity(.1),
                    Colors.white.withOpacity(.3),
                    Colors.white.withOpacity(.6),
                    Colors.white.withOpacity(1),
                  ])),
              child: Image.network(
                image,
                fit: BoxFit.fill,
                height: 400.h,
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: Styles.textStyle10w700.copyWith(fontSize: 15.sp),
                ),
                SizedBox(
                  height: 100.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CalViewWidget(
                      color: ColorManager.orangeAppColor,
                      text: protin + " Protin",
                      textcolor: Colors.grey,
                    ),
                    CalViewWidget(
                      color: ColorManager.orangeAppColor,
                      text: carb + " Carb",
                      textcolor: Colors.grey,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CalViewWidget(
                      color: ColorManager.orangeAppColor,
                      text: fat + " Fat",
                      textcolor: Colors.grey,
                    ),
                    CalViewWidget(
                      color: ColorManager.orangeAppColor,
                      text: cal + " Calories",
                      textcolor: Colors.grey,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CalViewWidget extends StatelessWidget {
  const CalViewWidget({
    Key? key,
    required this.text,
    required this.color,
    required this.textcolor,
  }) : super(key: key);
  final String text;
  final Color color;
  final Color textcolor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        height: 40.h,
        width: 120.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey)),
        child: Text(
          text,
          style: Styles.textStyle10w700
              .copyWith(color: ColorManager.orangeAppColor),
        ),
      ),
    );
  }
}
