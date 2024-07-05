import 'package:flutter/material.dart';
import 'package:rep1/core/routing/routes.dart';
import 'package:rep1/featuers/on_boarding/onboarding_screen.dart';
import 'package:rep1/featuers/track/peresintaion/view/main_view.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoarding());
      case Routes.mainScreen:
        return MaterialPageRoute(builder: (_) => const MyWidget());
        // case Routes.workoutScreen:
        // return MaterialPageRoute(builder: (_)=>const WorkoutView());

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(child: Text("مفيش مكان تروحوه")),
                ));
    }
  }
}
