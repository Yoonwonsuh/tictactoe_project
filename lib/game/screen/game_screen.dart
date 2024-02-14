import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tictactoe_project/game/component/game_state.dart';
import 'package:tictactoe_project/game/function/game_function.dart';
import 'package:tictactoe_project/game/provider/game_provider.dart';
import 'package:tictactoe_project/history/database/history_database.dart';
import 'package:tictactoe_project/history/model/history_game_model.dart';
import 'package:tictactoe_project/setting/provider/setting_provider.dart';

class GameScreen extends ConsumerStatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends ConsumerState<GameScreen> {
  List<Widget> playerIcon = [
    Icon(Icons.circle_outlined),
    Icon(Icons.change_history_outlined),
    Icon(Icons.square_outlined),
    Icon(Icons.close_outlined),
  ];

  Color playerColor(int player) {
    return player == 1
        ? ref.watch(settingPlayer1Color)
        : ref.watch(settingPlayer2Color);
  }

  String formatDateTime(DateTime dateTime) {
    final koreaTime = dateTime.toUtc().add(Duration(hours: 9));
    final formatter = DateFormat('yyyy.MM.dd HH:mm');
    return formatter.format(koreaTime);
  }

  @override
  Widget build(BuildContext context) {
    final player1Icon = ref.watch(settingPlayer1Icon);
    final player2Icon = ref.watch(settingPlayer2Icon);
    final gameState = ref.watch(gameProvider);
    final gameSize = ref.watch(settingSize);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (gameState.isGameOver && gameState.winner != null) {
        final prefs = await HistoryDatabase.getGameRecordsBox();
        final DateTime now = DateTime.now();
        final String formattedEndTime = formatDateTime(now);

        final historyRecord = HistoryRecord(
            board: gameState.board,
            order: gameState.order,
            currentPlayer: gameState.currentPlayer,
            isGameOver: gameState.isGameOver,
            cancelCount: gameState.cancelCount,
            winner: gameState.winner,
            player1IconIndex: ref.read(settingPlayer1Icon),
            player2IconIndex: ref.read(settingPlayer2Icon),
            player1Color: colorToHex(ref.read(settingPlayer1Color)),
            player2Color: colorToHex(ref.read(settingPlayer2Color)),
            endTime: formattedEndTime);
        await prefs.add(historyRecord);
        GameFunction.winCurrentGame(
            context: context, ref: ref, winner: gameState.winner!);
      } else if (gameState.isGameOver && gameState.winner == null) {
        final prefs = await HistoryDatabase.getGameRecordsBox();
        final DateTime now = DateTime.now();
        final String formattedEndTime = formatDateTime(now);

        final historyRecord = HistoryRecord(
            board: gameState.board,
            order: gameState.order,
            currentPlayer: gameState.currentPlayer,
            isGameOver: gameState.isGameOver,
            cancelCount: gameState.cancelCount,
            winner: gameState.winner,
            player1IconIndex: ref.read(settingPlayer1Icon),
            player2IconIndex: ref.read(settingPlayer2Icon),
            player1Color: colorToHex(ref.read(settingPlayer1Color)),
            player2Color: colorToHex(ref.read(settingPlayer2Color)),
            endTime: formattedEndTime);
        await prefs.add(historyRecord);
        GameFunction.drawCurrentGame(context: context, ref: ref);
      }
    });
    return Scaffold(
        appBar: AppBar(
          title: Text('Game'),
          centerTitle: true,
          leading: InkWell(
              onTap: () {
                GameFunction.exitCurrentGame(context: context, ref: ref);
              },
              child: Icon(Icons.chevron_left)),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                    childAspectRatio: 1,
                    crossAxisCount: gameSize),
                itemCount: (gameSize * gameSize),
                itemBuilder: (context, index) {
                  final cellValue = gameState.board[index];
                  Widget icon = cellValue != null
                      ? IconTheme(
                          data: IconThemeData(
                            color: cellValue == 1
                                ? playerColor(1)
                                : playerColor(2),
                          ),
                          child: cellValue == 1
                              ? playerIcon[player1Icon]
                              : playerIcon[player2Icon],
                        )
                      : Container();

                  return InkWell(
                    onTap: () =>
                        ref.read(gameProvider.notifier).markCell(index),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                      ),
                      child: Center(
                        child: icon,
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: GameStateComponent(),
            ),
          ],
        ));
  }
}
