import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rep1/featuers/explore/data/model/article_model.dart';
import 'package:rep1/featuers/explore/data/repo/repo.dart';
import 'package:rep1/featuers/explore/peresintaion/manager/get_articles_cubit/get_articles_states.dart';
class GetArticlesCubit extends Cubit<GetArticlesStates> {
  GetArticlesCubit(this.exploreRepo) : super(GetArticlesInit());
   ExploreRepo exploreRepo;
  List<ArticleModel> articles = [];

 

  getArticles() async {
    try {
      emit(GetArticlesLoading());
      articles = await exploreRepo.getArticleData();
      emit(GetArticlesSucess(articles: articles));
    } catch (e) {
      emit(GetArticlesfialure(msg: e.toString()));
    }
  }
}


class CounterArticlesCubit extends Cubit<int> {
  CounterArticlesCubit() : super(0);

  void increment() => emit(state + 1);

  void decrement() => emit(state - 1);

  void setValue(int newValue) => emit(newValue);
}