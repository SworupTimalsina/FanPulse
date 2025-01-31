import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fanpulse/app/usecase/usecase.dart';
import 'package:fanpulse/core/error/failure.dart';
import 'package:fanpulse/features/message/domain/repository/message_repository.dart';

class DeleteMessageParams extends Equatable {
  final String id;

  const DeleteMessageParams({required this.id});

  const DeleteMessageParams.empty() : id = '_empty.string';

  @override
  List<Object?> get props => [
        id,
      ];
}

class DeleteMessageUsecase
    implements UsecaseWithParams<void, DeleteMessageParams> {
  final IMessageRepository messageRepository;

  DeleteMessageUsecase({required this.messageRepository});

  @override
  Future<Either<Failure, void>> call(DeleteMessageParams params) async {
    return await messageRepository.deleteMessage(params.id);
  }
}
