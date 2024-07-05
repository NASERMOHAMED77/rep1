import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:rep1/featuers/explore/data/model/article_model.dart';
import 'package:rep1/featuers/explore/data/model/diat_plan_model.dart';
import 'package:rep1/featuers/explore/data/model/home_workout_model.dart';
import 'package:rep1/featuers/explore/data/model/workout_model.dart';
import 'package:rep1/featuers/explore/data/repo/repo.dart';

class ExploreRepoImp extends ExploreRepo {
  @override
  getExploreData() async {
    List<WorkoutModel> x = [];
    try {
      final String response =
          await rootBundle.loadString('assets/workouts.json');

      List data = await json.decode(response)["workouts_plan"];
      for (var element in data) {
        x.add(WorkoutModel.fromJson(element));
      }

      return x;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<DiatPlanModel>> getDaitPlansData() async {
    List<DiatPlanModel> x = [];

    try {
      final String response =
          await rootBundle.loadString('assets/workouts.json');

      List data = await json.decode(response)["diet_plans"];
      for (var element in data) {
        x.add(DiatPlanModel.fromJson(element));
      }

      return x;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<ArticleModel>> getArticleData() async {
    List<ArticleModel> x = [];

    try {
      final String response =
          await rootBundle.loadString('assets/workouts.json');

      List data = await json.decode(response)["articles"];
      for (var element in data) {
        x.add(ArticleModel.fromJson(element));
      }

      return x;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<HomeWorkoutModel>> getHomeWorkoutData(String workout) async {
    List<HomeWorkoutModel> x = [];

    try {
      final String response =
          await rootBundle.loadString('assets/workouts.json');
      print("object");

      ;
      x.add(HomeWorkoutModel.fromJson(await json.decode(response)[workout]));

      return x;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
