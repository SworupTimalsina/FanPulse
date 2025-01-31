import 'package:dartz/dartz.dart';
import 'package:fanpulse/core/error/failure.dart';
import 'package:fanpulse/features/message/domain/entity/message_entity.dart';

abstract interface class IMessageRepository {
  Future<Either<Failure, List<MessageEntity>>> getMessagees();
  Future<Either<Failure, void>> createMessage(MessageEntity message);
  Future<Either<Failure, void>> deleteMessage(String id);
}
