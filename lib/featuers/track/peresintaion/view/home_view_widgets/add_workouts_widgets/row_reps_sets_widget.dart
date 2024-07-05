import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rep1/core/colors.dart';
import 'package:rep1/core/styles.dart';

class RepsAndSetsWidget extends StatelessWidget {
  const RepsAndSetsWidget({
    super.key,
    required this.controllerSets,
    required this.controllerReps,
  });

  final TextEditingController controllerSets;
  final TextEditingController controllerReps;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(TextSpan(
                text: 'Sets',
                style: Styles.textStyle10w700
                    .copyWith(fontSize: 10.h, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(text: '  (4)', style: TextStyle(fontSize: 6.sp))
                ])),
            SizedBox(
              height: 40.h,
              width: 80.w,
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'this must\'nt be Empty';
                  }
                  return null;
                },
                controller: controllerSets,
                onChanged: (value) {},
                cursorColor: ColorManager.orangeAppColor,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  enabled: true,
                  filled: true,
                  contentPadding: const EdgeInsets.all(10),
                  fillColor: ColorManager.orangeWithOp10Color,
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 0, color: Colors.white)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 0, color: Colors.white)),
                ),
              ),
            ),
      
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(TextSpan(
                text: 'Reps',
                style: Styles.textStyle10w700
                    .copyWith(fontSize: 10.h, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                      text: '  (8,10,12,18)', style: TextStyle(fontSize: 6.sp))
                ])),
            SizedBox(
              height: 40.h,
              width: 120.w,
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'this must\'nt be Empty';
                  }
                  return null;
                },
                controller: controllerReps,
                onChanged: (value) {},
                cursorColor: ColorManager.orangeAppColor,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  enabled: true,
                  filled: true,
                  fillColor: ColorManager.orangeWithOp10Color,
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 0, color: Colors.white)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 0, color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
