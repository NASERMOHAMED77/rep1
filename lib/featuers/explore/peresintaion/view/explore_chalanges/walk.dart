import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:rep1/core/colors.dart';
import 'package:rep1/core/styles.dart';

// class WalkingWidget extends StatelessWidget {
//   const WalkingWidget({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//        // height: 100.h, width: 80.w, child: FeaturesRowCircleWidget());
//   }
// }

class FeaturesRowCircleWidget extends StatelessWidget {
  const FeaturesRowCircleWidget({
    super.key,
    required this.svg,
    required this.text,
    required this.color,
    required this.function,
  });
  final String svg;
  final String text;
  final Color color;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.h),
      child: Column(
        children: [
          CircularPercentIndicator(
            radius: 40,
            center: InkWell(
              onTap: () {
                function();
              },
              child: CircleAvatar(
                backgroundColor: ColorManager.orangeWithOp10Color,
                radius: 35,
                child: SvgPicture.asset(
                  svg,
                  color: Colors.black,
                  height: 40,
                ),
              ),
            ),
            backgroundColor: Colors.white,
            progressColor: ColorManager.orangeAppColor.withOpacity(1),
            percent: .5,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: Styles.textStyle10w700.copyWith(fontSize: 8.sp),
          ),
        ],
      ),
    );
  }
}
