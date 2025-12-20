import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:parafeed/common/app_color.dart';
import 'package:parafeed/common/app_const.dart';
import 'package:provider/provider.dart';

import '../../provider/news/news_provider.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({super.key});

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((t){
      Provider.of<NewsProvider>(context, listen: false).loadNews();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: AppConst.paranormalCategories.length,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            TabBar(
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              indicatorColor: primary,
              labelColor: primary,
              unselectedLabelColor: Colors.grey,
              labelStyle: TextStyle(fontSize: 14),
              unselectedLabelStyle: TextStyle(fontSize: 14),
              indicatorSize: TabBarIndicatorSize.tab,
              dragStartBehavior: DragStartBehavior.down,
              tabs: List.generate(AppConst.paranormalCategories.length, (index) => Tab(text: AppConst.paranormalCategories[index].toString(),)),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                color: Colors.black.withValues(alpha: 0.20),
                child: Consumer<NewsProvider>(
                    child: Text("hello"),
                    builder: (BuildContext context, NewsProvider value, Widget? child) {

                      if (value.isLoading == true && value.articles.isEmpty) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                     
                      if (value.articles.isEmpty) {
                        return Center(
                          child: Text("No news found"),
                        );
                      }
                  return ListView.builder(
                      itemCount: value.articles.length,
                      itemBuilder: (context, index) {
                        //TODO news card create here and take data using value.articles[index]
                        return Card(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              //create news card here
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 300,
                                  child: Image.network(
                                    value.articles[index].urlToImage ?? "",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(value.articles[index].title ?? ""),
                              ],
                            ),
                          ),
                        );
                  }
                    );
                })

              ),
            )
          ],
        )
      ),
    );
  }
}