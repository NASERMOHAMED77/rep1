import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rep1/core/styles.dart';

class WorkoutViewButtun extends StatelessWidget {
  const WorkoutViewButtun({
    Key? key,
    required this.onpressed,
    required this.text,
    required this.color,
    required this.containerColor,
    required this.textcolor,
  }) : super(key: key);
  final Function onpressed;
  final String text;
  final Color color;
  final Color containerColor;
  final Color textcolor;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onpressed();
      },
      child: Container(
        alignment: Alignment.center,
        height: 40.h,
        width: 70.w,
        decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: color)),
        child: Text(
          text,
          style: Styles.textStyle10w700.copyWith(color: textcolor),
        ),
      ),
    );
  }
}
