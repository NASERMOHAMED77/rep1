import 'package:get_it/get_it.dart';
import 'package:rep1/featuers/explore/data/repo/repo_imp.dart';
import 'package:rep1/featuers/track/data/repo/home_repo_imp.dart';

var getIt = GetIt.instance;

void setupService() {
  getIt.registerSingleton<HomeRepoImp>(HomeRepoImp());
  getIt.registerSingleton<ExploreRepoImp>(ExploreRepoImp());
}
