import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tictactoe_project/common/layout/default_screen.dart';
import 'package:tictactoe_project/history/screen/history_screen.dart';
import 'package:tictactoe_project/setting/function/setting_function.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
        title: 'HOME',
        body: Container(
          width: 100.w,
          height: 100.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    SettingFunction.openSettingFunction(context: context);
                  },
                  child: Text('게임시작')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HistoryScreen()));
                  },
                  child: Text('게임기록보기')),
            ],
          ),
        ));
  }
}
