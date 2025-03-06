     // GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MessageHiveModelAdapter extends TypeAdapter<MessageHiveModel> {
  @override
  final int typeId = 1;

  @override
  MessageHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MessageHiveModel(
      messageId: fields[0] as String?,
      messageName: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MessageHiveModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.messageId)
      ..writeByte(1)
      ..write(obj.messageName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
