
import 'package:flutter/material.dart';
import 'package:rep1/core/styles.dart';

class MealDetailsRowWidget extends StatelessWidget {
  const MealDetailsRowWidget(
      {super.key, required this.title, required this.info});
  final String title;
  final String info;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Styles.textStyle10w700,
        ),
        Text(
          info,
          style: Styles.textStyle10w700,
        ),
      ],
    );
  }
}
