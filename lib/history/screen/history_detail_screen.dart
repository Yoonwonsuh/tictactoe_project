import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:tictactoe_project/history/component/history_state_component.dart';
import 'package:tictactoe_project/history/model/history_game_model.dart';
import 'dart:math' as math;

class HistoryDetailScreen extends StatefulWidget {
  const HistoryDetailScreen(
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

  factory HistoryDetailScreen.fromModel({required HistoryRecord model}) {
    return HistoryDetailScreen(
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
  State<HistoryDetailScreen> createState() => _HistoryDetailScreenState();
}

class _HistoryDetailScreenState extends State<HistoryDetailScreen> {
  List<Widget> playerIcon = [
    Icon(Icons.circle_outlined),
    Icon(Icons.change_history_outlined),
    Icon(Icons.square_outlined),
    Icon(Icons.close_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '${widget.endTime} 경기',
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.chevron_left),
        ),
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
                  crossAxisCount: math.sqrt(widget.board.length).toInt()),
              itemCount: widget.board.length,
              itemBuilder: (context, index) {
                final cellValue = widget.board[index];
                final orderValue = widget.order[index];
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
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black)),
                  child: Center(
                    child: Stack(
                      children: [
                        Center(child: icon),
                        orderValue != null
                            ? Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  '순서 : ${orderValue}',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ))
                            : Container()
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: HistoryStateComponent.fromModel(model: widget.model),
          ),
        ],
      ),
    );
  }
}
