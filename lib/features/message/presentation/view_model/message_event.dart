part of 'message_bloc.dart';

sealed class MessageEvent extends Equatable {
  const MessageEvent();

  @override
  List<Object> get props => [];
}

class MessageLoad extends MessageEvent {}

class CreateMessage extends MessageEvent {
  final String messageName;

  const CreateMessage({required this.messageName});

  @override
  List<Object> get props => [messageName];
}

class DeleteMessage extends MessageEvent {
  final String id;

  const DeleteMessage({required this.id});

  @override
  List<Object> get props => [id];
}
