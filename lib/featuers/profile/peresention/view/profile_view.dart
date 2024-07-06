// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rep1/core/colors.dart';
import 'package:rep1/core/styles.dart';
import 'package:rep1/featuers/explore/peresintaion/view/explore.dart';
import 'package:rep1/featuers/profile/peresention/manager/bmi_cubit/bmi_cubit.dart';
import 'package:rep1/featuers/profile/peresention/manager/profile_cubit/profile_cubit.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LogoWidget(),
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: ColorManager.orangeWithOp10Color,
                      radius: 60,
                      child: SvgPicture.asset(
                        'assets/svgs/fullbody.svg',
                        color: Colors.black,
                        height: 90,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text.rich(TextSpan(
                          text: "Hi",
                          style: Styles.textStyle10w700.copyWith(fontSize: 22),
                          children: [
                            TextSpan(
                                text: " NSR :)",
                                style: Styles.textStyle10w700.copyWith(
                                    color: ColorManager.orangeAppColor,
                                    fontSize: 18))
                          ])),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              ProfileRowWidget(
                function: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BmiCalculateView()));
                },
                text: "Bmi",
                svg: "assets/svgs/bmi.svg",
              ),
              ProfileRowWidget(
                function: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CaloriesCalculateView()));
                },
                text: "Calories",
                svg: "assets/svgs/cal.svg",
              ),

              ProfileRowWidget(
                function: () {
                  BlocProvider.of<ProfileCubit>(context).x();
                },
                text: "Tracking",
                svg: "assets/svgs/logo.svg",
              ),
              // SfPdfViewer.asset(
              //   '/storage/emulated/0/Android/data/com.example.rep1/files/example.pdf',
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileRowWidget extends StatelessWidget {
  const ProfileRowWidget({
    super.key,
    required this.svg,
    required this.text,
    required this.function,
  });
  final String svg;
  final String text;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: ColorManager.orangeWithOp10Color))),
        child: InkWell(
          onTap: () {
            function();
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: Styles.textStyle10w700,
                    ),
                    SvgPicture.asset(
                      svg,
                      height: 30,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BmiCalculateView extends StatelessWidget {
  const BmiCalculateView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _heightController = TextEditingController();
    final TextEditingController _weightController = TextEditingController();
    void calculateBMI() {}

    double _result;
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => BmiCubit(),
          child: BlocBuilder<BmiCubit, double>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const LogoWidget(),
                    Column(
                      children: [
                        TextField(
                          controller: _heightController,
                          decoration: const InputDecoration(
                            labelText: 'Height in cm',
                            icon: Icon(Icons.trending_up),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: _weightController,
                          decoration: const InputDecoration(
                            labelText: 'Weight in kg',
                            icon: Icon(Icons.line_weight),
                          ),
                        ),
                        const SizedBox(height: 15),
                        InkWell(
                          onTap: () {
                            double height =
                                double.parse(_heightController.text) / 100;
                            double weight =
                                double.parse(_weightController.text);

                            double heightSquare = height * height;
                            double result = weight / heightSquare;

                            context.read<BmiCubit>().calculateBMI(result);
                          },
                          child: Container(
                            width: 100.w,
                            height: 50.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: ColorManager.orangeAppColor),
                                borderRadius: BorderRadius.circular(25)),
                            child: const Text(
                              "Calculate",
                              style: Styles.textStyle10w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Column(
                      children: [
                        Text(
                          state != null
                              ? "Your BMI is: ${state.toStringAsFixed(2)}"
                              : "Result will be here",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 19.4,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Builder(builder: (context) {
                          if (state < 18.5 && state > 0) {
                            return Text(
                              "Underweight: BMI < 18.5",
                              style:
                                  Styles.textStyle10w700.copyWith(fontSize: 12),
                            );
                          } else if (state >= 18.5 && state <= 24.9) {
                            return Text(
                              "Normal weight: BMI = 18.5-24.9",
                              style:
                                  Styles.textStyle10w700.copyWith(fontSize: 12),
                            );
                          } else if (state >= 25 && state <= 29.9) {
                            return Text(
                              "Overweight: BMI = 25-29.9",
                              style:
                                  Styles.textStyle10w700.copyWith(fontSize: 12),
                            );
                          } else if (state >= 30) {
                            return Text(
                              "Obese: BMI ≥ 30",
                              style:
                                  Styles.textStyle10w700.copyWith(fontSize: 12),
                            );
                          } else
                            return Text(
                              "",
                              style:
                                  Styles.textStyle10w700.copyWith(fontSize: 12),
                            );
                        })
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class CaloriesCalculateView extends StatefulWidget {
  const CaloriesCalculateView({super.key});

  @override
  State<CaloriesCalculateView> createState() => _CaloriesCalculateViewState();
}

class _CaloriesCalculateViewState extends State<CaloriesCalculateView> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _ageController = TextEditingController();
    final TextEditingController _weightController = TextEditingController();
    final TextEditingController _heightController = TextEditingController();
    final TextEditingController _activityLevelController =
        TextEditingController();
    final _key = GlobalKey<FormState>();
    return Scaffold(
      body: Form(
        key: _key,
        child: SafeArea(
          child: BlocProvider(
            create: (context) => CalorieCubit(),
            child: BlocBuilder<CalorieCubit, double>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      const LogoWidget(),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "this must\'nt be empty";
                          }
                          return null;
                        },
                        controller: _ageController,
                        decoration: InputDecoration(
                          labelText: 'Age',
                          labelStyle:
                              Styles.textStyle10w700.copyWith(fontSize: 12),
                          icon: Icon(Icons.calendar_today),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "this must\'nt be empty";
                          }
                          return null;
                        },
                        controller: _weightController,
                        decoration: InputDecoration(
                          labelText: 'Weight (kg)',
                          labelStyle:
                              Styles.textStyle10w700.copyWith(fontSize: 12),
                          icon: Icon(Icons.line_weight),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "this should't be empty";
                          }
                          return null;
                        },
                        controller: _heightController,
                        decoration: InputDecoration(
                          labelText: 'Height (cm)',
                          labelStyle:
                              Styles.textStyle10w700.copyWith(fontSize: 12),
                          icon: Icon(Icons.trending_up),
                        ),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        height: 80,
                        child: DropdownButtonFormField(
                          elevation: 0,
                          style: Styles.textStyle10w700.copyWith(fontSize: 12),
                          isExpanded: true,
                          borderRadius: BorderRadius.circular(10),
                          decoration: const InputDecoration(
                            icon: Icon(Icons.directions_run),
                          ),
                          value: 'Actiety level',
                          onChanged: (value) {
                            _activityLevelController.text = value!;
                          },
                          items: [
                            'Actiety level',
                            'Sedentary',
                            'Lightly active',
                            'Moderately active',
                            'Very active',
                            'Extremely active',
                          ].map((e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                          child: Container(
                            width: 100.w,
                            height: 50.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: ColorManager.orangeAppColor),
                                borderRadius: BorderRadius.circular(25)),
                            child: const Text(
                              "Calculate",
                              style: Styles.textStyle10w700,
                            ),
                          ),
                          onTap: () {
                            if (_key.currentState!.validate()) {
                              int age = int.parse(_ageController.text);
                              double weight =
                                  double.parse(_weightController.text);
                              double height =
                                  double.parse(_heightController.text);
                              String activityLevel =
                                  _activityLevelController.text;

                              double bmr;
                              if (activityLevel == 'Sedentary') {
                                bmr = ((66 +
                                    (10 * weight) +
                                    (6.25 * height) -
                                    (5 * age) +
                                    5));
                                bmr = bmr * 1.2;
                              } else if (activityLevel == 'Lightly active') {
                                bmr = ((66 +
                                    (10 * weight) +
                                    (6.25 * height) -
                                    (5 * age) +
                                    5));
                                bmr *= 1.375;
                              } else if (activityLevel == 'Moderately active') {
                                bmr = ((66 +
                                    (10 * weight) +
                                    (6.25 * height) -
                                    (5 * age) +
                                    5));
                                bmr *= 1.55;
                              } else if (activityLevel == 'Very active') {
                                bmr = ((66 +
                                    (10 * weight) +
                                    (6.25 * height) -
                                    (5 * age) +
                                    5));
                                bmr *= 1.725;
                              } else if (activityLevel == 'Extremely active') {
                                bmr = ((66 +
                                    (10 * weight) +
                                    (6.25 * height) -
                                    (5 * age) +
                                    5));
                                bmr *= 1.9;
                              } else if (activityLevel == "Activity level") {
                                bmr = 0;
                              } else {
                                bmr = 0;
                              }
                              context.read<CalorieCubit>().calculateCal(bmr);
                            }
                          }),
                      const SizedBox(height: 20),
                      Text(
                        state != null
                            ? "Your daily calories need is: ${state.toStringAsFixed(2)}"
                            : "Result will be here",
                        style: const TextStyle(
                          color: ColorManager.orangeAppColor,
                          fontSize: 15.4,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
