import 'package:flutter/material.dart';

class NewsDetailScreen extends StatefulWidget {
  final dynamic article;

  const NewsDetailScreen({
    super.key,
    required this.article,
  });

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0E0E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // HERO IMAGE
            Hero(
              tag: widget.article.urlToImage ?? widget.article.hashCode,
              child: Image.network(
                widget.article.urlToImage ??
                    "https://via.placeholder.com/400",
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // TITLE
                  Text(
                    widget.article.title ?? "",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      height: 1.3,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // DATE + AUTHOR
                  Text(
                    "${widget.article.publishedAt?.substring(0, 10) ?? ""} • ${widget.article.author ?? "Unknown"}",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade500,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // DESCRIPTION
                  Text(
                    widget.article.description ?? "",
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.6,
                      color: Colors.grey.shade300,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // CONTENT
                  Text(
                    widget.article.content ??
                        "Full article content not available.",
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.6,
                      color: Colors.grey.shade300,
                    ),
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}