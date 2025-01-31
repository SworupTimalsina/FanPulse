import 'package:fanpulse/features/message/domain/entity/message_entity.dart';

abstract interface class IMessageDataSource {
  Future<List<MessageEntity>> getMessages();
  Future<void> createMessage(MessageEntity message);
  Future<void> deleteMessage(String id);
}
