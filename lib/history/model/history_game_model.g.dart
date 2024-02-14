// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_game_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HistoryRecordAdapter extends TypeAdapter<HistoryRecord> {
  @override
  final int typeId = 0;

  @override
  HistoryRecord read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HistoryRecord(
      board: (fields[0] as List).cast<int?>(),
      order: (fields[1] as List).cast<int?>(),
      currentPlayer: fields[2] as int,
      isGameOver: fields[3] as bool,
      winner: fields[4] as int?,
      cancelCount: (fields[5] as Map).cast<int, int>(),
      player1IconIndex: fields[6] as int,
      player2IconIndex: fields[7] as int,
      player1Color: fields[8] as String,
      player2Color: fields[9] as String,
      endTime: fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HistoryRecord obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.board)
      ..writeByte(1)
      ..write(obj.order)
      ..writeByte(2)
      ..write(obj.currentPlayer)
      ..writeByte(3)
      ..write(obj.isGameOver)
      ..writeByte(4)
      ..write(obj.winner)
      ..writeByte(5)
      ..write(obj.cancelCount)
      ..writeByte(6)
      ..write(obj.player1IconIndex)
      ..writeByte(7)
      ..write(obj.player2IconIndex)
      ..writeByte(8)
      ..write(obj.player1Color)
      ..writeByte(9)
      ..write(obj.player2Color)
      ..writeByte(10)
      ..write(obj.endTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HistoryRecordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
