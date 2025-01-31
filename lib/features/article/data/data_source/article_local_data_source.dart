// import 'package:fanpulse/core/error/failure.dart';
// import 'package:fanpulse/core/network/hive_service.dart';
// import 'package:fanpulse/features/article/data/data_source/article_data_source.dart';
// import 'package:fanpulse/features/article/data/model/article_hive_model.dart';
// import 'package:fanpulse/features/article/domain/entity/article_entity.dart';

// class ArticleLocalDataSource implements IArticleDataSource {
//   final HiveService _hiveService;

//   ArticleLocalDataSource({required HiveService hiveService})
//       : _hiveService = hiveService;

//   @override
//   Future<void> createArticle(ArticleEntity article) async {
//     try {
//       // Convert article entity to article model
//       final articleHiveModel = ArticleHiveModel.fromEntity(article);
//       _hiveService.addArticle(articleHiveModel);
//     } catch (e) {
//       throw LocalDatabaseFailure(message: e.toString());
//     }
//   }

//   @override
//   Future<void> deleteArticle(String id) async {
//     try {
//       _hiveService.deleteArticle(id);
//     } catch (e) {
//       throw LocalDatabaseFailure(message: e.toString());
//     }
//   }

//   @override
//   Future<List<ArticleEntity>> getArticles() async {
//     try {
//       final articleHiveModelList = await _hiveService.getAllArticles();
//       return ArticleHiveModel.toEntityList(articleHiveModelList);
//     } catch (e) {
//       throw LocalDatabaseFailure(message: e.toString());
//     }
//   }
// }
