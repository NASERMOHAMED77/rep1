import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:rep1/core/notifications_services.dart';
import 'package:rep1/core/routing/app_router.dart';
import 'package:rep1/core/service_locetor.dart';
import 'package:rep1/featuers/explore/data/repo/repo_imp.dart';
import 'package:rep1/featuers/explore/peresintaion/manager/get_articles_cubit/get_articles_cubit.dart';
import 'package:rep1/featuers/explore/peresintaion/manager/get_diat_cubit/get_diat_cubit.dart';
import 'package:rep1/featuers/explore/peresintaion/manager/get_home_workouts.dart/get_home_workouts_cubit.dart';
import 'package:rep1/featuers/explore/peresintaion/manager/get_workouts_cubit/get_workouts_cubit.dart';
import 'package:rep1/featuers/profile/data/repo/repo_imp.dart';
import 'package:rep1/featuers/profile/peresention/manager/profile_cubit/profile_cubit.dart';
import 'package:rep1/featuers/track/data/model/workout_track_model.dart';
import 'package:rep1/featuers/track/data/repo/home_repo_imp.dart';
import 'package:rep1/featuers/track/peresintaion/manager/add_home_workouts_cubit/add_home_workout_cubit.dart';
import 'package:rep1/featuers/track/peresintaion/manager/get_home_workouts_cubit/get_home_workouts_cubit.dart';
import 'package:rep1/rep_app.dart';
import 'package:workmanager/workmanager.dart';

@pragma(
    'vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {
    NotificationsServices.createNotifications(
        title: "Rep1", body: "It\'s time to drink");
    //simpleTask will be emitted here.
    return Future.value(true);
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
  Workmanager().registerPeriodicTask("my remainder", "water",
      frequency: const Duration(minutes: 70));
  await NotificationsServices.awesomeNotifications();
  await Hive.initFlutter();
  Hive.registerAdapter(WorkoutTrackModelAdapter());
  await Hive.openBox<WorkoutTrackModel>("Workouts");
  setupService();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => ChangeDropDownWorkoutCubit()),
      BlocProvider(create: (context) => ChangeDropDownSetCubit()),
      BlocProvider(create: (context) => CounterCubit()),
      BlocProvider(create: (context) => CounterWorkoutCubit()),
      BlocProvider(create: (context) => CounterArticlesCubit()),
      BlocProvider(create: (context) => CounterMainWorkoutCubit()),
      BlocProvider(
          create: (context) => GetWorkoutsCubit(getIt.get<ExploreRepoImp>())),
      BlocProvider(
          create: (context) => ProfileCubit(getIt.get<ProfileRepoImp>())),
      BlocProvider(
          create: (context) => GetArticlesCubit(getIt.get<ExploreRepoImp>())),
      BlocProvider(
          create: (context) => GetDiatPlansCubit(getIt.get<ExploreRepoImp>())),
      BlocProvider(
          create: (context) =>
              GetMainWorkoutCubit(getIt.get<ExploreRepoImp>())),
      BlocProvider(
          create: (context) => GetHomeWorkoutCubit(getIt.get<HomeRepoImp>())),
      BlocProvider(
          create: (context) => AddHomeWorkoutCubit(getIt.get<HomeRepoImp>())),
    ],
    child: RepApp(
      appRouter: AppRouter(),
    ),
  ));
}
