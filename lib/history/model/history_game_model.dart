import 'package:hive/hive.dart';

part 'history_game_model.g.dart';

@HiveType(typeId: 0)
class HistoryRecord extends HiveObject{
  @HiveField(0)
  List<int?> board;

  @HiveField(1)
  List<int?> order;

  @HiveField(2)
  int currentPlayer;

  @HiveField(3)
  bool isGameOver;

  @HiveField(4)
  int? winner;

  @HiveField(5)
  Map<int, int> cancelCount;

  @HiveField(6)
  int player1IconIndex;

  @HiveField(7)
  int player2IconIndex;

  @HiveField(8)
  String player1Color;

  @HiveField(9)
  String player2Color;

  @HiveField(10)
  String endTime;

  HistoryRecord({
    required this.board,
    required this.order,
    required this.currentPlayer,
    required this.isGameOver,
    this.winner,
    required this.cancelCount,
    required this.player1IconIndex,
    required this.player2IconIndex,
    required this.player1Color,
    required this.player2Color,
    required this.endTime,
  });
}