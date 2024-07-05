import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:rep1/core/colors.dart';
import 'package:rep1/core/styles.dart';

class PushUpWidget extends StatelessWidget {
  const PushUpWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100.h,
        width: 80.w,
        child: Column(
          children: [
            CircularPercentIndicator(
              radius: 40,
              center: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 135, 218, 190),
                radius: 35,
                child: SvgPicture.asset(
                  'assets/svgs/pushups-svgrepo-com.svg',
                  color: Colors.black,
                  height: 30,
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
              "PushUps",
              style: Styles.textStyle10w700.copyWith(fontSize: 8.sp),
            ),
          ],
        ));
  }
}
