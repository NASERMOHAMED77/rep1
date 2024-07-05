import 'package:rep1/featuers/explore/data/model/article_model.dart';
import 'package:rep1/featuers/explore/data/model/diat_plan_model.dart';
import 'package:rep1/featuers/explore/data/model/home_workout_model.dart';
import 'package:rep1/featuers/explore/data/model/workout_model.dart';

abstract class ExploreRepo {
  Future<List<WorkoutModel>>getExploreData();
  Future<List<DiatPlanModel>>getDaitPlansData();
  Future<List<ArticleModel>>getArticleData();
  Future<List<HomeWorkoutModel>>getHomeWorkoutData(String workout);
}
