import 'dart:convert';

import 'package:fanpulse/features/article/domain/entity/article_entity.dart';
import 'package:fanpulse/features/article/presentation/view/article_detail_view.dart';
import 'package:fanpulse/features/article/presentation/view_model/article_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key});

  bool isBase64(String image) {
    return image.startsWith('data:image');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Articles'),
      ),
      body: BlocBuilder<ArticleBloc, ArticleState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.error != null) {
            return Center(child: Text('Error: ${state.error}'));
          } else if (state.articles.isEmpty) {
            return const Center(child: Text('No articles available.'));
          }

          return ListView.builder(
            itemCount: state.articles.length,
            itemBuilder: (context, index) {
              final ArticleEntity article = state.articles[index];
              Widget leadingWidget = const Icon(Icons.article);

              if (article.image != null) {
                if (isBase64(article.image!)) {
                  String base64Image = article.image!.split(',')[1];
                  leadingWidget = Image.memory(
                    base64Decode(base64Image),
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  );
                } else {
                  leadingWidget = Image.network(
                    article.image!,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.broken_image),
                  );
                }
              }

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ArticleDetailPage(article: article),
                    ),
                  );
                },
                child: Card(
                  margin: const EdgeInsets.all(8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (article.image != null) leadingWidget,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          article.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        child: Text(
                          article.content,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to article creation page (Implement as needed)
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
