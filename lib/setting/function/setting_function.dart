import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:tictactoe_project/setting/component/setting_dialog.dart';
import 'package:tictactoe_project/setting/provider/setting_provider.dart';

class SettingFunction {
  static void openSettingFunction({required context}) {
    showDialog(
      context: context,
      builder: (context) {
        return SettingDialog();
      },
    );
  }

  static void changeSettingColorFunction(
      {required context, required WidgetRef ref, required int player}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  ColorPicker(
                      pickerColor: player == 1
                          ? ref.watch(settingPlayer1Color)
                          : ref.watch(settingPlayer2Color),
                      onColorChanged: (color) {
                        if (player == 1) {
                          ref
                              .watch(settingPlayer1Color.notifier)
                              .update((state) => color);
                        } else {
                          ref
                              .watch(settingPlayer2Color.notifier)
                              .update((state) => color);
                        }
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(onPressed: (){
                        if (player == 1) {
                          ref
                              .watch(settingPlayer1Color.notifier)
                              .update((state) => Colors.blue);
                        } else {
                          ref
                              .watch(settingPlayer2Color.notifier)
                              .update((state) => Colors.red);
                        }
                        Navigator.pop(context);
                      }, child: Text('초기화')),
                      SizedBox(width: (16/360*100).w),
                      ElevatedButton(onPressed: (){
                        Navigator.pop(context);
                      }, child: Text('선택하기')),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
