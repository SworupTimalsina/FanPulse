// import 'package:dartz/dartz.dart';
// import 'package:fanpulse/core/error/failure.dart';
// import 'package:fanpulse/features/message/data/data_source/message_local_data_source.dart';
// import 'package:fanpulse/features/message/domain/entity/message_entity.dart';
// import 'package:fanpulse/features/message/domain/repository/message_repository.dart';

// class MessageLocalRepository implements IMessageRepository {
//   final MessageLocalDataSource _messageLocalDataSource;

//   MessageLocalRepository(
//       {required MessageLocalDataSource messageLocalDataSource})
//       : _messageLocalDataSource = messageLocalDataSource;

//   @override
//   Future<Either<Failure, void>> createMessage(MessageEntity message) {
//     try {
//       _messageLocalDataSource.createMessage(message);
//       return Future.value(Right(null));
//     } catch (e) {
//       return Future.value(Left(LocalDatabaseFailure(message: e.toString())));
//     }
//   }

//   @override
//   Future<Either<Failure, void>> deleteMessage(String id) {
//     try {
//       _messageLocalDataSource.deleteMessage(id);
//       return Future.value(Right(null));
//     } catch (e) {
//       return Future.value(Left(LocalDatabaseFailure(message: e.toString())));
//     }
//   }

//   @override
//   Future<Either<Failure, List<MessageEntity>>> getMessagees() {
//     try {
//       return _messageLocalDataSource.getMessages().then(
//         (value) {
//           return Right(value);
//         },
//       );
//     } catch (e) {
//       return Future.value(Left(LocalDatabaseFailure(message: e.toString())));
//     }
//   }
// }
