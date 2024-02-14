import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tictactoe_project/history/model/history_game_model.dart';

class HistoryDatabase {
  static Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(HistoryRecordAdapter());
    await Hive.openBox<HistoryRecord>('historyRecords');
  }

  static Box<HistoryRecord> getGameRecordsBox() {
    return Hive.box<HistoryRecord>('historyRecords');
  }
}