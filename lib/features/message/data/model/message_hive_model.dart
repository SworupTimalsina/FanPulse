import 'package:equatable/equatable.dart';
import 'package:fanpulse/app/constants/hive_table_constant.dart';
import 'package:fanpulse/features/message/domain/entity/message_entity.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:uuid/uuid.dart';

part 'message_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.messageTableId)
class MessageHiveModel extends Equatable {
  @HiveField(0)
  final String? messageId;
  @HiveField(1)
  final String messageName;

  MessageHiveModel({
    String? messageId,
    required this.messageName,
  }) : messageId = messageId ?? const Uuid().v4();

  // Initail Constructor
  const MessageHiveModel.initial()
      : messageId = '',
        messageName = '';

  // From Entity
  factory MessageHiveModel.fromEntity(MessageEntity entity) {
    return MessageHiveModel(
      messageId: entity.messageId,
      messageName: entity.messageName,
    );
  }

  // To Entity
  MessageEntity toEntity() {
    return MessageEntity(
      messageId: messageId,
      messageName: messageName,
    );
  }

  @override
  List<Object?> get props => [messageId, messageName];
}



  // // // From Entity List
  // // static List<BmessageHiveModel> fromEntityList(List<BmessageEntity> entityList) {
  // //   return entityList
  // //       .map((entity) => BmessageHiveModel.fromEntity(entity))
  // //       .toList();
  // // }

  // // To Entity List
  // static List<BmessageEntity> toEntityList(List<BmessageHiveModel> hiveList) {
  //   return hiveList.map((hive) => hive.toEntity()).toList();
  // }