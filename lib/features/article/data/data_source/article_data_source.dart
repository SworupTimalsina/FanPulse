import 'package:fanpulse/features/article/domain/entity/article_entity.dart';


abstract interface class IArticleDataSource {
  Future<List<ArticleEntity>> getArticles();
  Future<void> createArticle(ArticleEntity article);
  Future<void> deleteArticle(String id, String? token);
}
