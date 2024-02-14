import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sizer/sizer.dart';
import 'package:tictactoe_project/history/database/history_database.dart';
import 'package:tictactoe_project/history/model/history_game_model.dart';
import 'package:tictactoe_project/home/screen/home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await HistoryDatabase.initHive();
  await Hive.openBox<HistoryRecord>('historyRecords');
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientaion, devicetype) {
      return MaterialApp(
        home: HomeScreen(),
      );
    });
  }
}
