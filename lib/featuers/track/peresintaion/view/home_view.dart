import 'package:flutter/material.dart';
import 'package:rep1/core/shared_widget/calender_bar_widget.dart';
import 'package:rep1/featuers/track/peresintaion/view/home_view_widgets/workout_floating_widget.dart';
import 'package:rep1/featuers/track/peresintaion/view/home_view_widgets/workout_listview_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        floatingActionButton: WorkoutFloatingButtunWidget(),
        body: SafeArea(
            child: Column(
          children: [
            CalenderBarWidget(),
            WorkoutsListViewWidget()
          ],
        )));
  }
}
