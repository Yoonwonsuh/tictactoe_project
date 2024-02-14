import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:tictactoe_project/game/provider/game_provider.dart';
import 'package:tictactoe_project/setting/provider/setting_provider.dart';

class GameStateComponent extends ConsumerStatefulWidget {
  const GameStateComponent({Key? key}) : super(key: key);

  @override
  ConsumerState<GameStateComponent> createState() => _GameStateComponentState();
}

class _GameStateComponentState extends ConsumerState<GameStateComponent> {
  List<Widget> playerIcon = [
    Icon(Icons.circle_outlined),
    Icon(Icons.change_history_outlined),
    Icon(Icons.square_outlined),
    Icon(Icons.close_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    final gameState = ref.watch(gameProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    gameState.currentPlayer == 1 ? 'Player1' : 'Player2',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: gameState.currentPlayer == 1
                            ? ref.watch(settingPlayer1Color)
                            : ref.watch(settingPlayer2Color)),
                  ),
                  Text(
                    ' 님의 차례 입니다.',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    width: (16 / 360 * 100).w,
                  ),
                  if (gameState.currentPlayer == 1 &&
                          gameState.cancelCount[1]! > 0 &&
                          ref.watch(gameProvider.notifier).gameHistory.length >=
                              2 ||
                      gameState.currentPlayer == 2 &&
                          gameState.cancelCount[2]! > 0 &&
                          ref.watch(gameProvider.notifier).gameHistory.length >=
                              2)
                    ElevatedButton(
                        onPressed: () {
                          ref.watch(gameProvider.notifier).cancelHistory();
                        },
                        child: Text(
                            '무르기 ${gameState.currentPlayer == 1 ? gameState.cancelCount[1]! : gameState.cancelCount[2]!}')),
                ],
              )
            ],
          ),
          SizedBox(height: (16/760*100).h),
          Row(
            children: [
              Expanded(child: Center(child: Text('Player1',style: TextStyle(fontWeight: FontWeight.bold),))),
              Expanded(child: Center(child: Text('이름'))),
              Expanded(child: Center(child: Text('Player2',style: TextStyle(fontWeight: FontWeight.bold),))),
            ],
          ),
          SizedBox(height: (16/760*100).h),
          Row(
            children: [
              Expanded(child: Center(child: Text('${gameState.cancelCount[1]!}',style: TextStyle(fontWeight: FontWeight.bold),))),
              Expanded(child: Center(child: Text('남은 무르기'))),
              Expanded(child: Center(child: Text('${gameState.cancelCount[2]!}',style: TextStyle(fontWeight: FontWeight.bold),))),
            ],
          ),
          SizedBox(height: (16/760*100).h),
          Row(
            children: [
              Expanded(child: Center(child: playerIcon[ref.watch(settingPlayer1Icon)])),
              Expanded(child: Center(child: Text('마크'))),
              Expanded(child: Center(child: playerIcon[ref.watch(settingPlayer2Icon)])),
            ],
          ),
          SizedBox(height: (16/760*100).h),
          Row(
            children: [
              Expanded(child: Center(child: Container(width:30,height:30,color: ref.watch(settingPlayer1Color),))),
              Expanded(child: Center(child: Text('색상'))),
              Expanded(child: Center(child: Container(width:30,height:30,color: ref.watch(settingPlayer2Color),))),
            ],
          ),

        ],
      ),
    );
  }
}
