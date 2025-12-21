import 'package:flutter/cupertino.dart';
import 'package:parafeed/network/models/news_data_response.dart';
import 'package:parafeed/network/news_repo.dart';

class NewsProvider extends ChangeNotifier {
  final NewsRepo _newsRepo = NewsRepo();

  List<Articles> articles = [];
  bool isLoading = false;
  int page = 1;
  String currentQuery = "paranormal";

  Future<void> loadNews({String? query, bool loadMore = false}) async {
    if (isLoading) return;

    isLoading = true;
    notifyListeners();


    final newArticles = await _newsRepo.fetchNews(
      query: currentQuery,
    );

    articles = newArticles;

    isLoading = false;
    notifyListeners();
  }
}