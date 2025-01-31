part of 'message_bloc.dart';

class MessageState extends Equatable {
  final bool isLoading;
  final List<MessageEntity> messages;
  final String error;

  const MessageState({
    required this.isLoading,
    required this.messages,
    required this.error,
  });

  factory MessageState.initial() {
    return MessageState(
      isLoading: false,
      messages: const [],
      error: '',
    );
  }

  MessageState copyWith({
    bool? isLoading,
    List<MessageEntity>? messages,
    String? error,
  }) {
    return MessageState(
      isLoading: isLoading ?? this.isLoading,
      messages: messages ?? this.messages,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [isLoading, messages, error];
}
