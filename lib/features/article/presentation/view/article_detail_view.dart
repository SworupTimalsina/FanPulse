import 'dart:convert';
import 'package:fanpulse/features/article/domain/entity/article_entity.dart';
import 'package:flutter/material.dart';

class ArticleDetailPage extends StatelessWidget {
  final ArticleEntity article;

  const ArticleDetailPage({super.key, required this.article});

  bool isBase64(String image) {
    return image.startsWith('data:image');
  }

  @override
  Widget build(BuildContext context) {
    Widget articleImage = const SizedBox.shrink();

    if (article.image != null) {
      if (isBase64(article.image!)) {
        String base64Image = article.image!.split(',')[1];
        articleImage = Image.memory(
          base64Decode(base64Image),
          width: double.infinity,
          height: 250,
          fit: BoxFit.cover,
        );
      } else {
        articleImage = Image.network(
          article.image!,
          width: double.infinity,
          height: 250,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.broken_image, size: 100),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article.image != null) articleImage,
            const SizedBox(height: 16),
            Text(
              article.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              article.content,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
