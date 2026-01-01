import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:parafeed/common/app_color.dart';
import 'package:parafeed/common/app_const.dart';
import 'package:provider/provider.dart';

import '../../provider/news/news_provider.dart';
import '../news_detail_screen.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({super.key});

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  int currentIndex = 0;

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
              onTap: (index){
                // if(index != currentIndex){
                //
                // }

                Provider.of<NewsProvider>(
                  context,
                  listen: false,
                ).loadNews(refresh: true,query: AppConst.paranormalCategories[index]);
              },
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
                        return const Center(
                          child: Text("No news found"),
                        );
                      }

                  return RefreshIndicator(
                    color: primary,
                    onRefresh: () async {
                      await Provider.of<NewsProvider>(
                        context,
                        listen: false,
                      ).loadNews(refresh: true);
                    },
                    child: ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: value.articles.length,
                        itemBuilder: (context, index) {

                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => NewsDetailScreen(
                                    article: value.articles[index],
                                  ),
                                ),
                              );
                            },
                            child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Stack(
                                    children: [
                                      Hero(
                                        tag: value.articles[index].urlToImage ?? index,
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.vertical(
                                            top: Radius.circular(16),
                                          ),
                                          child: Image.network(
                                            value.articles[index].urlToImage ??
                                                "https://via.placeholder.com/400",
                                            height: 220,
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),

                                      Positioned(
                                        top: 12,
                                        left: 12,
                                        child: Container(
                                          padding:
                                          const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                          decoration: BoxDecoration(
                                            color: Colors.redAccent,
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          child: const Text(
                                            "NEWS",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  // CONTENT
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        // DATE / AUTHOR
                                        Text(
                                          "${value.articles[index].publishedAt?.substring(0, 10) ?? ""}  •  ${value.articles[index].author ?? "Unknown"}",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey.shade600,
                                          ),
                                        ),

                                        const SizedBox(height: 8),

                                        // TITLE
                                        Text(
                                          value.articles[index].title ?? "",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                        const SizedBox(height: 8),

                                        // SUMMARY
                                        Text(
                                          value.articles[index].description ?? "",
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey.shade700,
                                          ),
                                        ),

                                        const SizedBox(height: 12),

                                        // READ MORE
                                        Row(
                                          children: const [
                                            Text(
                                              "Read more",
                                              style: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(width: 4),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              size: 14,
                                              color: Colors.blue,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                    }
                      ),
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