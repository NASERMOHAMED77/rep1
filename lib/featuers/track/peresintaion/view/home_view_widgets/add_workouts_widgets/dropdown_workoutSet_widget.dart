// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rep1/core/colors.dart';
import 'package:rep1/core/styles.dart';
import 'package:rep1/featuers/track/peresintaion/manager/add_home_workouts_cubit/add_home_workout_cubit.dart';
class DropDownWorkoutWidget extends StatelessWidget {
  const DropDownWorkoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeDropDownWorkoutCubit, String>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Wokout",
              style: TextStyle(fontSize: 10.h, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 40.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: ColorManager.orangeWithOp10Color,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: DropdownButton<String>(
                  elevation: 0,
                  value: state,
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(10),
                  onChanged: (value) {
                    context
                        .read<ChangeDropDownWorkoutCubit>()
                        .selectItem(value.toString());
                    context.read<ChangeDropDownWorkoutCubit>().changeList();
                  },
                  underline: const Text(""),
                  items: [
                    'Bench',
                    'Back',
                    'Shoulder',
                    'Arm',
                    'Leg',
                  ].map((item) {
                    return DropdownMenuItem<String>(
                      alignment: Alignment.centerLeft,
                      value: item,
                      child: Text(
                        item,
                        style: Styles.textStyle10w700,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
