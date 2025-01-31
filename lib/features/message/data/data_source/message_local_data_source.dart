// import 'package:fanpulse/core/network/hive_service.dart';
// import 'package:fanpulse/features/message/data/data_source/message_data_source.dart';
// import 'package:fanpulse/features/message/data/model/message_hive_model.dart';
// import 'package:fanpulse/features/message/domain/entity/message_entity.dart';

// class MessageLocalDataSource implements IMessageDataSource {
//   final HiveService hiveService;

//   MessageLocalDataSource({required this.hiveService});

//   @override
//   Future<void> createMessage(MessageEntity message) async {
//     try {
//       // Convert BatchEntity to BatchHiveModel
//       final messageHiveModel = MessageHiveModel.fromEntity(message);
//       await hiveService.addMessage(messageHiveModel);
//     } catch (e) {
//       throw Exception(e);
//     }
//   }

//   @override
//   Future<void> deleteMessage(String id) async {
//     try {
//       await hiveService.deleteMessage(id);
//     } catch (e) {
//       throw Exception(e);
//     }
//   }

//   Future<List<MessageHiveModel>> getMessage() {
//     try {
//       return hiveService.getAllMessages(
//         (value) {
//           return value.map((e) => e.toEntity()).toList();
//         },
//       );
//     } catch (e) {
//       throw Exception(e);
//     }
//   }

//   @override
//   Future<List<MessageEntity>> getMessages() {
//     // TODO: implement getMessages
//     throw UnimplementedError();
//   }
// }
