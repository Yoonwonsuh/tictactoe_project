import 'dart:ui';

import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../setting/provider/setting_provider.dart';
import 'dart:math' as math;

class GameState {
  final List<int?> board;
  final List<int?> order;
  final int currentPlayer;
  final bool isGameOver;
  final int? winner;
  final Map<int, int> cancelCount;

  GameState({
    required this.board,
    required this.order,
    this.currentPlayer = 1,
    this.isGameOver = false,
    this.winner,
    required this.cancelCount,
  });

  factory GameState.initial({required int size, required int startingPlayer}) {
    return GameState(
        board: List.filled(size * size, null),
        order: List.filled(size*size, null),
        currentPlayer: startingPlayer,
        isGameOver: false,
        winner: null,
        cancelCount: {1: 3, 2: 3});
  }
}

final gameProvider = StateNotifierProvider<GameNotifier, GameState>((ref) {
  final gameSize = ref.watch(settingSize);
  final firstPlayerSetting = ref.watch(settingFirstPlayer);
  final random = math.Random();
  final startingPlayer = firstPlayerSetting == 0
      ? random.nextBool()
          ? 1
          : 2
      : firstPlayerSetting;

  return GameNotifier(gameSize, startingPlayer);
});

class GameNotifier extends StateNotifier<GameState> {
  GameNotifier(int size, int startingPlayer)
      : super(GameState.initial(size: size, startingPlayer: startingPlayer));
  List<GameState> gameHistory = [];
  int orderNum = 1;

  void markCell(int index) {
    if (state.board[index] != null || state.isGameOver) return;

    gameHistory.add(state);
    final newBoard = List<int?>.from(state.board);
    final newOrder = List<int?>.from(state.order);
    newBoard[index] = state.currentPlayer;
    newOrder[index] = orderNum;
    orderNum++;

    final int? winner =
        checkWinner(newBoard, state.currentPlayer, index, state.board.length);
    final bool isBoardFull = !newBoard.contains(null);

    state = GameState(
      board: newBoard,
      order: newOrder,
      currentPlayer: state.currentPlayer == 1 ? 2 : 1,
      isGameOver: winner != null || isBoardFull,
      winner: winner,
      cancelCount: Map.from(state.cancelCount),
    );
  }

  int? checkWinner(
      List<int?> board, int currentPlayer, int lastIndex, int size) {
    final int n = math.sqrt(board.length).toInt();
    final int row = lastIndex ~/ n;
    final int col = lastIndex % n;

    if (checkLine(board, row * n, 1, n, currentPlayer) ||
        checkLine(board, col, n, n, currentPlayer) ||
        (row == col && checkLine(board, 0, n + 1, n, currentPlayer)) ||
        (row + col == n - 1 &&
            checkLine(board, n - 1, n - 1, n, currentPlayer))) {
      gameHistory.clear();
      orderNum = 1;
      return currentPlayer;
    }

    bool isBoardFull = board.every((cell) => cell != null);
    if (isBoardFull) {
      state = GameState(
        board: state.board,
        order: state.order,
        currentPlayer: state.currentPlayer,
        isGameOver: true,
        winner: null,
        cancelCount: Map.from(state.cancelCount),
      );
      orderNum = 1;
      gameHistory.clear();
    }

    return null;
  }

  bool checkLine(List<int?> board, int start, int step, int count, int player) {
    for (int i = 0; i < count; i++) {
      if (board[start + step * i] != player) {
        return false;
      }
    }
    return true;
  }

  void reset({required WidgetRef ref}) {
    gameHistory.clear();
    orderNum = 1;
    final random = math.Random();
    state = GameState.initial(
        size: math.sqrt(state.board.length).toInt(),
        startingPlayer: ref.watch(settingFirstPlayer) == 0
            ? random.nextBool()
                ? 1
                : 2
            : ref.watch(settingFirstPlayer));
  }

  void cancelHistory() {
    if (state.cancelCount[state.currentPlayer]! > 0 &&
        gameHistory.length >= 2) {
      final Map<int, int> updatedCancelCount = Map.from(state.cancelCount)
        ..update(state.currentPlayer, (value) => value - 1);
      orderNum --;
      orderNum --;
      gameHistory.removeLast();
      final previousState = gameHistory.removeLast();
      state = GameState(
        board: previousState.board,
        order: previousState.order,
        currentPlayer: previousState.currentPlayer,
        isGameOver: previousState.isGameOver,
        winner: previousState.winner,
        cancelCount: updatedCancelCount,
      );
    }
  }
}
