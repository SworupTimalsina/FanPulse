import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fanpulse/features/message/domain/entity/message_entity.dart';
import 'package:fanpulse/features/message/domain/use_case/create_message_usecase.dart';
import 'package:fanpulse/features/message/domain/use_case/delete_message_usecase.dart';
import 'package:fanpulse/features/message/domain/use_case/get_all_message_usecase.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final GetAllMessageUsecase _getAllMessageUsecase;
  final CreateMessageUsecase _createMessageUsecase;
  final DeleteMessageUsecase _deleteMessageUsecase;
  MessageBloc({
    required GetAllMessageUsecase getAllMessageUsecase,
    required CreateMessageUsecase createMessageUsecase,
    required DeleteMessageUsecase deleteMessageUsecase,
  })  : _getAllMessageUsecase = getAllMessageUsecase,
        _createMessageUsecase = createMessageUsecase,
        _deleteMessageUsecase = deleteMessageUsecase,
        super(MessageState.initial()) {
    on<MessageLoad>(_onMessageLoad);
    on<CreateMessage>(_onCreateMessage);
    on<DeleteMessage>(_onDeleteMessage);

    add(MessageLoad());
  }

  Future<void> _onMessageLoad(
    MessageLoad event,
    Emitter<MessageState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _getAllMessageUsecase();
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (messages) =>
          emit(state.copyWith(isLoading: false, messages: messages)),
    );
  }

  Future<void> _onCreateMessage(
    CreateMessage event,
    Emitter<MessageState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _createMessageUsecase(
        CreateMessageParams(messageName: event.messageName));
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (_) {
        emit(state.copyWith(isLoading: false));
        add(MessageLoad());
      },
    );
  }

  Future<void> _onDeleteMessage(
    DeleteMessage event,
    Emitter<MessageState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result =
        await _deleteMessageUsecase(DeleteMessageParams(id: event.id));
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (_) {
        emit(state.copyWith(isLoading: false));
        add(MessageLoad());
      },
    );
  }
}
