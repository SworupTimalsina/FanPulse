import 'package:dartz/dartz.dart';
import 'package:fanpulse/app/usecase/usecase.dart';
import 'package:fanpulse/core/error/failure.dart';
import 'package:fanpulse/features/message/domain/entity/message_entity.dart';
import 'package:fanpulse/features/message/domain/repository/message_repository.dart';

class GetAllMessageUsecase
    implements UsecaseWithoutParams<List<MessageEntity>> {
  final IMessageRepository messageRepository;

  GetAllMessageUsecase({required this.messageRepository});

  @override
  Future<Either<Failure, List<MessageEntity>>> call() {
    return messageRepository.getMessagees();
  }
}
