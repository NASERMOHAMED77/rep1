import 'package:rep1/featuers/explore/data/model/article_model.dart';

abstract class GetArticlesStates {}

class GetArticlesInit extends GetArticlesStates {
  
}

class GetArticlesSucess extends GetArticlesStates {
  List<ArticleModel> articles;
  GetArticlesSucess({
    required this.articles,
  });
}

class GetArticlesLoading extends GetArticlesStates {}

class GetArticlesfialure extends GetArticlesStates {
  String msg;
  GetArticlesfialure({
    required this.msg,
  });
}
