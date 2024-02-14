import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:tictactoe_project/game/provider/game_provider.dart';

class GameFunction {
  static void exitCurrentGame({required context, required WidgetRef ref}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          child: IntrinsicHeight(
            child: Column(
              children: [
                SizedBox(height: (16 / 760 * 100).h),
                Text(
                  '게임을 종료 하시겠습니까?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: (16 / 760 * 100).h),
                Text(
                  '게임 내용은 저장되지 않습니다.',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: (16 / 760 * 100).h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('취소')),
                      ),
                      SizedBox(width: (16 / 760 * 100).w),
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              ref.read(gameProvider.notifier).reset(ref: ref);
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            child: Text('나가기')),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: (16 / 760 * 100).h)
              ],
            ),
          ),
        );
      },
    );
  }

  static void winCurrentGame(
      {required context, required WidgetRef ref, required int winner}) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Dialog(
            child: IntrinsicHeight(
              child: Column(
                children: [
                  SizedBox(height: (16 / 760 * 100).h),
                  Text(
                    winner == 1 ? 'Player1 승리!' : 'Player2 승리!',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: (16 / 760 * 100).h),
                  Text(
                    '다시 한번 하시겠습니까?',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: (16 / 760 * 100).h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                ref.read(gameProvider.notifier).reset(ref: ref);
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              child: Text('나가기')),
                        ),
                        SizedBox(width: (16 / 760 * 100).w),
                        Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                ref.read(gameProvider.notifier).reset(ref: ref);
                                Navigator.pop(context);
                              },
                              child: Text('다시 한 번 하기')),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: (16 / 760 * 100).h)
                ],
              ),
            ),
          );
        });
  }

  static void drawCurrentGame({required context, required WidgetRef ref}) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Dialog(
            child: IntrinsicHeight(
              child: Column(
                children: [
                  SizedBox(height: (16 / 760 * 100).h),
                  Text(
                    '무승부 입니다!',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: (16 / 760 * 100).h),
                  Text(
                    '다시 한번 하시겠습니까?',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: (16 / 760 * 100).h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                ref.read(gameProvider.notifier).reset(ref: ref);
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              child: Text('나가기')),
                        ),
                        SizedBox(width: (16 / 760 * 100).w),
                        Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                ref.read(gameProvider.notifier).reset(ref: ref);
                                Navigator.pop(context);
                              },
                              child: Text('다시 한 번 하기')),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: (16 / 760 * 100).h)
                ],
              ),
            ),
          );
        });
  }
}
