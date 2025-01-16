import 'package:fanpulse/app/constants/hive_table_constant.dart';
import 'package:fanpulse/features/article/data/model/article_hive_model.dart';
import 'package:fanpulse/features/auth/data/model/auth_hive_model.dart';
import 'package:fanpulse/features/message/data/model/message_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  static Future<void> init() async {
    // Initialize the database
    var directory = await getApplicationDocumentsDirectory();
    var path = '${directory.path}softwarica_user_management.db';

    Hive.init(path);

    // Register Adapters
    Hive.registerAdapter(ArticleHiveModelAdapter());
    Hive.registerAdapter(MessageHiveModelAdapter());
    Hive.registerAdapter(AuthHiveModelAdapter());
  }

  // Message Queries
  Future<void> addMessage(MessageHiveModel message) async {
    var box =
        await Hive.openBox<MessageHiveModel>(HiveTableConstant.messageBox);
    await box.put(message.messageId, message);
  }

  Future<void> deleteMessage(String id) async {
    var box =
        await Hive.openBox<MessageHiveModel>(HiveTableConstant.messageBox);
    await box.delete(id);
  }

  Future<List<MessageHiveModel>> getAllMessages() async {
    // Sort by MessageName
    var box =
        await Hive.openBox<MessageHiveModel>(HiveTableConstant.messageBox);
    return box.values.toList()
      ..sort((a, b) => a.messageName.compareTo(b.messageName));
  }

  // Article Queries
  Future<void> addArticle(ArticleHiveModel article) async {
    var box =
        await Hive.openBox<ArticleHiveModel>(HiveTableConstant.articleBox);
    await box.put(article.articleId, article);
  }

  Future<void> deleteArticle(String id) async {
    var box =
        await Hive.openBox<ArticleHiveModel>(HiveTableConstant.articleBox);
    await box.delete(id);
  }

  Future<List<ArticleHiveModel>> getAllArticles() async {
    var box =
        await Hive.openBox<ArticleHiveModel>(HiveTableConstant.articleBox);
    return box.values.toList();
  }

/*
  register box
  {
    fname : "asd",
    lname : "asd",
    message : {messageId : 1, messageName : "Message 1"},
    articles : [{articleId : 1, articleName : "Article 1"}, {articleId : 2, articleName : "Article 2"}],
  }
*/

// OR

/*
 {
    fname : "asd",
    lname : "asd",
    message : 1,
    articles : [1,3,4],
  }
*/

  // Auth Queries
  Future<void> register(AuthHiveModel auth) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    await box.put(auth.userId, auth);
  }

  Future<void> deleteAuth(String id) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    await box.delete(id);
  }

  Future<List<AuthHiveModel>> getAllAuth() async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    return box.values.toList();
  }

  // Login using username and password
  Future<AuthHiveModel?> login(String username, String password) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    var user = box.values.firstWhere((element) =>
        element.username == username && element.password == password);
    box.close();
    return user;
  }

  Future<void> clearAll() async {
    await Hive.deleteBoxFromDisk(HiveTableConstant.messageBox);
    await Hive.deleteBoxFromDisk(HiveTableConstant.articleBox);
    await Hive.deleteBoxFromDisk(HiveTableConstant.userBox);
  }

  // Clear User Box
  Future<void> clearUserBox() async {
    await Hive.deleteBoxFromDisk(HiveTableConstant.userBox);
  }

  Future<void> close() async {
    await Hive.close();
  }
}
