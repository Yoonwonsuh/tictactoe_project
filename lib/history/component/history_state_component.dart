import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:sizer/sizer.dart';
import 'package:tictactoe_project/history/model/history_game_model.dart';

class HistoryStateComponent extends StatefulWidget {
  const HistoryStateComponent(
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

  factory HistoryStateComponent.fromModel({required HistoryRecord model}) {
    return HistoryStateComponent(
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
  State<HistoryStateComponent> createState() => _HistoryStateComponentState();
}

class _HistoryStateComponentState extends State<HistoryStateComponent> {
  List<Widget> playerIcon = [
    Icon(Icons.circle_outlined),
    Icon(Icons.change_history_outlined),
    Icon(Icons.square_outlined),
    Icon(Icons.close_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SizedBox(height: (16 / 760 * 100).h),
          Text(
            '승자 : ${widget.winner == null ? '무승부' : widget.winner == 1 ? 'Player1' : 'Player2'}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: (16 / 760 * 100).h),
          Row(
            children: [
              Expanded(
                  child: Center(
                      child: Text(
                'Player1',
                style: TextStyle(fontWeight: FontWeight.bold),
              ))),
              Expanded(child: Center(child: Text('이름'))),
              Expanded(
                  child: Center(
                      child: Text(
                'Player2',
                style: TextStyle(fontWeight: FontWeight.bold),
              ))),
            ],
          ),
          SizedBox(height: (16 / 760 * 100).h),
          Row(
            children: [
              Expanded(
                  child: Center(
                      child: Text(
                '${widget.cancelCount[1]!}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ))),
              Expanded(child: Center(child: Text('남은 무르기'))),
              Expanded(
                  child: Center(
                      child: Text(
                '${widget.cancelCount[2]!}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ))),
            ],
          ),
          SizedBox(height: (16 / 760 * 100).h),
          Row(
            children: [
              Expanded(
                  child: Center(child: playerIcon[widget.player1IconIndex])),
              Expanded(child: Center(child: Text('마크'))),
              Expanded(
                  child: Center(child: playerIcon[widget.player2IconIndex])),
            ],
          ),
          SizedBox(height: (16 / 760 * 100).h),
          Row(
            children: [
              Expanded(
                  child: Center(
                      child: Container(
                width: 30,
                height: 30,
                color: colorFromHex(widget.player1Color),
              ))),
              Expanded(child: Center(child: Text('색상'))),
              Expanded(
                  child: Center(
                      child: Container(
                width: 30,
                height: 30,
                color: colorFromHex(widget.player2Color),
              ))),
            ],
          ),
        ],
      ),
    );
  }
}
