import 'package:equatable/equatable.dart';

class MessageEntity extends Equatable {
  final String? messageId;
  final String messageName;

  const MessageEntity({
    this.messageId,
    required this.messageName,
  });

  @override
  List<Object?> get props => [messageId, messageName];
}
