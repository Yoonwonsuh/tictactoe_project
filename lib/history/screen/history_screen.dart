import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:tictactoe_project/history/component/history_card.dart';
import 'package:tictactoe_project/history/model/history_game_model.dart';

class HistoryScreen extends ConsumerStatefulWidget {
  const HistoryScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends ConsumerState<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    final historyList =
        Hive.box<HistoryRecord>('historyRecords').values.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('지난 게임 기록'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.chevron_left),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: GridView.builder(
          itemCount: historyList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5),
          itemBuilder: (context, index) {
            return Card(
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: HistoryCard.fromModel(model: historyList[index]),
                ));
          },
        ),
      ),
    );
  }
}
