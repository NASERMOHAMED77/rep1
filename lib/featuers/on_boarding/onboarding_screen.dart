// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rep1/core/colors.dart';
import 'package:rep1/core/routing/routes.dart';
import 'package:rep1/core/styles.dart';
import 'package:rep1/generated/l10n.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: ScreenUtilInit(
        child: Padding(
          padding: EdgeInsets.all(8.0.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/svgs/logo.svg",
                    height: 40,
                  ),
                  const Text(
                    ' Rep1',
                    style: Styles.textStyleTitle,
                  ),
                ],
              ),
              Container(
                
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
                  child: Image.asset('assets/images/onBoarding3.png')),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text.rich(
                  TextSpan(
                      text: S().des1,
                      children: [
                        const TextSpan(
                            text: ' Rep1',
                            style:
                                TextStyle(color: ColorManager.orangeAppColor)),
                        TextSpan(text: "${S().des2} "),
                        TextSpan(
                            text: S().des3,
                            style: const TextStyle(
                                color: ColorManager.orangeAppColor)),
                        TextSpan(text: S().des4),
                      ],
                      style: Styles.textStyle10w700),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: SizedBox(
                  width: double.infinity.w,
                  child: TextButton(
                      style: const ButtonStyle(
                          textStyle: MaterialStatePropertyAll(
                              TextStyle(color: Colors.white)),
                          backgroundColor: MaterialStatePropertyAll(
                            ColorManager.orangeAppColor,
                          )),
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.mainScreen);
                      },
                      child: Text(
                        S().start,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp),
                      )),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
