import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:tictactoe_project/history/model/history_game_model.dart';
import 'dart:math' as math;

import 'package:tictactoe_project/history/screen/history_detail_screen.dart';

class HistoryCard extends ConsumerStatefulWidget {
  HistoryCard(
      {Key? key,
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
      required this.model})
      : super(key: key);
  final List board;
  final List order;
  final int currentPlayer;
  final bool isGameOver;
  final int? winner;
  final Map<int, int> cancelCount;
  final int player1IconIndex;
  final int player2IconIndex;
  final String player1Color;
  final String player2Color;
  final String endTime;
  final HistoryRecord model;

  factory HistoryCard.fromModel({required HistoryRecord model}) {
    return HistoryCard(
      board: model.board,
      order: model.order,
      winner: model.winner,
      currentPlayer: model.currentPlayer,
      isGameOver: model.isGameOver,
      cancelCount: model.cancelCount,
      player1IconIndex: model.player1IconIndex,
      player2IconIndex: model.player2IconIndex,
      player1Color: model.player1Color,
      player2Color: model.player2Color,
      endTime: model.endTime,
      model: model,
    );
  }

  @override
  ConsumerState<HistoryCard> createState() => _HistoryCardState();
}

class _HistoryCardState extends ConsumerState<HistoryCard> {
  List<Widget> playerIcon = [
    Icon(Icons.circle_outlined),
    Icon(Icons.change_history_outlined),
    Icon(Icons.square_outlined),
    Icon(Icons.close_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HistoryDetailScreen.fromModel(
                      model: widget.model,
                    )));
      },
      child: Container(
          color: Colors.transparent,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                    width: (160 / 360 * 100).w,
                    height: (160 / 360 * 100).w,
                    child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              math.sqrt(widget.board.length).toInt(),
                          childAspectRatio: 1,
                          crossAxisSpacing: 1,
                          mainAxisSpacing: 1,
                        ),
                        itemCount: widget.board.length,
                        itemBuilder: (context, index) {
                          final cellValue = widget.board[index];
                          Widget icon = cellValue != null
                              ? IconTheme(
                                  data: IconThemeData(
                                      color: cellValue == 1
                                          ? colorFromHex(widget.player1Color)
                                          : colorFromHex(widget.player2Color)),
                                  child: cellValue == 1
                                      ? playerIcon[widget.player1IconIndex]
                                      : playerIcon[widget.player2IconIndex],
                                )
                              : Container();
                          return Container(
                            color: Colors.white,
                            child: Center(
                              child: icon,
                            ),
                          );
                        })),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '승리자 : ${widget.winner == null ? '무승부' : widget.winner == 1 ? 'Player1' : 'Player2'}',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      '종료시간 : ${widget.endTime}',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      '게임크기 : ${math.sqrt(widget.board.length).toInt()}x${math.sqrt(widget.board.length).toInt()}',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
