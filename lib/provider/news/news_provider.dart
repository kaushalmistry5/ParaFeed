import 'package:flutter/cupertino.dart';
import 'package:parafeed/common/app_const.dart';
import 'package:parafeed/network/models/news_data_response.dart';
import 'package:parafeed/network/news_repo.dart';

class NewsProvider extends ChangeNotifier {
  final NewsRepo _newsRepo = NewsRepo();

  List<Articles> articles = [];
  bool isLoading = false;

  String currentQuery = "paranormal";
  int page = 1;

  Future<void> loadNews({bool refresh = false ,String? query}) async {
    currentQuery = AppConst.paranormalCategoryQuery[query] ?? currentQuery;
    if (isLoading) return;

    if (refresh) {
      page = DateTime.now().millisecondsSinceEpoch % 5 + 1;
    }

    isLoading = true;
    notifyListeners();

    try {
      final newArticles = await _newsRepo.fetchNews(
        query: currentQuery,
        page: page,
      );

      articles = newArticles;
    } catch (e) {
      debugPrint("Error fetching news: $e");
    }

    isLoading = false;
    notifyListeners();
  }
}