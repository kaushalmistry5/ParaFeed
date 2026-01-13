import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:parafeed/common/app_const.dart';
import 'package:parafeed/network/models/news_data_response.dart';

class NewsRepo {
  static const String _baseUrl = "https://newsapi.org/v2/everything";

  Future<List<Articles>> fetchNews({
    required String query,
    required int page,
  })
  async {
    print("api calling start");

    // final url = Uri.parse(
    print("my query is $query");
    final url = Uri.parse(
      "$_baseUrl?q=$query&sortBy=publishedAt&page=$page&pageSize=10&apiKey=${AppConst.newsApi}",
    );

    final response = await http.get(url);


    print("response :: ${response.body}");
    if (response.statusCode == 200) {
      final  data = json.decode(response.body);
      List articles = data["articles"];
      return  articles.map((e) => Articles.fromJson(e)).toList();
    } else {
      print("error");
      throw Exception("Failed to load news");
    }
  }
}