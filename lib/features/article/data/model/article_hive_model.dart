// import 'package:equatable/equatable.dart';
// import 'package:fanpulse/app/constants/hive_table_constant.dart';
// import 'package:fanpulse/features/article/domain/entity/article_entity.dart';
// import 'package:hive_flutter/adapters.dart';
// import 'package:uuid/uuid.dart';

// part 'article_hive_model.g.dart';

// @HiveType(typeId: HiveTableConstant.articleTableId)
// class ArticleHiveModel extends Equatable {
//   @HiveField(0)
//   final String? articleId;

//   @HiveField(1)
//   final String articleName;

//   ArticleHiveModel({
//     String? articleId,
//     required this.articleName,
//   }) : articleId = articleId ?? const Uuid().v4();

//   // Initial Constructor
//   const ArticleHiveModel.initial()
//       : articleId = '',
//         articleName = '';

//   // From Entity
//   factory ArticleHiveModel.fromEntity(ArticleEntity entity) {
//     return ArticleHiveModel(
//       articleId: entity.articleId,
//       articleName: entity.articleName,
//     );
//   }

//   // To Entity
//   ArticleEntity toEntity() {
//     return ArticleEntity(
//       articleId: articleId,
//       articleName: articleName,
//     );
//   }

//   // To Entity List
//   static List<ArticleEntity> toEntityList(List<ArticleHiveModel> entityList) {
//     return entityList.map((data) => data.toEntity()).toList();
//   }

//   // From entity list
//   static List<ArticleHiveModel> fromEntityList(List<ArticleEntity> entityList) {
//     return entityList
//         .map((entity) => ArticleHiveModel.fromEntity(entity))
//         .toList();
//   }

//   @override
//   List<Object?> get props => [articleId, articleName];
// }
