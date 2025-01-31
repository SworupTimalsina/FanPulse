import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fanpulse/app/usecase/usecase.dart';
import 'package:fanpulse/core/error/failure.dart';
import 'package:fanpulse/features/message/domain/entity/message_entity.dart';
import 'package:fanpulse/features/message/domain/repository/message_repository.dart';

class CreateMessageParams extends Equatable {
  final String messageName;

  const CreateMessageParams({required this.messageName});

  // Empty constructor
  const CreateMessageParams.empty() : messageName = '_empty.string';

  @override
  List<Object?> get props => [messageName];
}

class CreateMessageUsecase
    implements UsecaseWithParams<void, CreateMessageParams> {
  final IMessageRepository messageRepository;

  CreateMessageUsecase({required this.messageRepository});

  @override
  Future<Either<Failure, void>> call(CreateMessageParams params) async {
    return await messageRepository.createMessage(
      MessageEntity(
        messageName: params.messageName,
      ),
    );
  }
}
