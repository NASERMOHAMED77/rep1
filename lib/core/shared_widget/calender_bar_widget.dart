// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rep1/featuers/track/peresintaion/manager/get_home_workouts_cubit/get_home_workouts_cubit.dart';
import 'package:rep1/featuers/track/peresintaion/manager/get_home_workouts_cubit/get_home_workouts_states.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:rep1/core/colors.dart';

// ignore: must_be_immutable
class CalenderBarWidget extends StatelessWidget {
  const CalenderBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        child: BlocBuilder<GetHomeWorkoutCubit, GetHomeWorkoutStates>(
          builder: (context, state) {
            return TableCalendar(
              calendarFormat: CalendarFormat.week,
              rowHeight: 45,
              headerStyle: const HeaderStyle(
                  leftChevronIcon: Icon(
                    Icons.chevron_left,
                    color: ColorManager.orangeAppColor,
                  ),
                  rightChevronIcon: Icon(
                    Icons.chevron_right,
                    color: ColorManager.orangeAppColor,
                  ),
                  titleTextStyle: TextStyle(
                      color: ColorManager.orangeAppColor,
                      fontWeight: FontWeight.w500),
                  decoration: BoxDecoration(color: Colors.white),
                  formatButtonVisible: false,
                  titleCentered: true),
              availableGestures: AvailableGestures.all,
              firstDay: DateTime.utc(2010, 10, 16),
              daysOfWeekHeight: 30,
              daysOfWeekStyle: const DaysOfWeekStyle(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  weekdayStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                  weekendStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500)),
              calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black.withOpacity(.8),
                      shape: BoxShape.rectangle),
                  selectedDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white.withOpacity(.8),
                      border: Border.all(color: ColorManager.orangeAppColor),
                      shape: BoxShape.rectangle),
                  //color of the row of containers of the day

                  weekendDecoration: BoxDecoration(
                      color: ColorManager.orangeAppColor,
                      borderRadius: BorderRadius.circular(5)),
                  defaultDecoration: BoxDecoration(
                      color: ColorManager.orangeAppColor,
                      borderRadius: BorderRadius.circular(5)),
                  outsideDaysVisible: true,
                  selectedTextStyle:
                      const TextStyle(color: ColorManager.orangeAppColor),
                  //color of the row of number of the day
                  rowDecoration: const BoxDecoration(color: Colors.white),
                  outsideTextStyle: const TextStyle(color: Colors.white),
                  weekendTextStyle: const TextStyle(color: Colors.white),
                  todayTextStyle: const TextStyle(color: Colors.white),
                  defaultTextStyle: const TextStyle(color: Colors.white)),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay:
                  BlocProvider.of<GetHomeWorkoutCubit>(context).selectedday,
              selectedDayPredicate: (day) {
                return isSameDay(day,
                    BlocProvider.of<GetHomeWorkoutCubit>(context).selectedday);
              },
              onDaySelected: (DateTime day, DateTime foucedDay) {
                context.read<GetHomeWorkoutCubit>().selectedday = day;

                BlocProvider.of<GetHomeWorkoutCubit>(
                  context,
                ).getWorkoutHomeData(
                    day: BlocProvider.of<GetHomeWorkoutCubit>(context)
                        .selectedday
                        .toString()
                        .split(" ")[0]);
              },
            );
          },
        ),
      ),
    );
  }
}
