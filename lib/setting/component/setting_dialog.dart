import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:tictactoe_project/game/screen/game_screen.dart';
import 'package:tictactoe_project/setting/component/setting_choose_first.dart';
import 'package:tictactoe_project/setting/component/setting_player_icon.dart';
import 'package:tictactoe_project/setting/component/setting_size.dart';
import 'package:tictactoe_project/setting/function/setting_function.dart';

class SettingDialog extends ConsumerStatefulWidget {
  const SettingDialog({Key? key}) : super(key: key);

  @override
  ConsumerState<SettingDialog> createState() => _SettingDialogState();
}

class _SettingDialogState extends ConsumerState<SettingDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: IntrinsicHeight(
        child: Container(
          height: 80.h,
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            shrinkWrap: true,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text('게임 설정', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              ),
              SizedBox(
                height: (16 / 760 * 100).h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('게임판의 크기'),
                  SizedBox(height: (8 / 760 * 100).h),
                  SettingSize()
                ],
              ),
              SizedBox(
                height: (16 / 760 * 100).h,
              ),
              SettingChooseFirst(),
              SizedBox(
                height: (16 / 760 * 100).h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Player1 아이콘'),
                      SizedBox(width: (10/360*100).w),
                      ElevatedButton(onPressed: (){
                        SettingFunction.changeSettingColorFunction(context: context, ref: ref, player: 1);
                      }, child: Text('색상 변경')),
                    ],
                  ),
                  SizedBox(height: (8 / 760 * 100).h),
                  SettingPlayerIcon(isPlayer1: true)
                ],
              ),
              SizedBox(
                height: (16 / 760 * 100).h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Player2 아이콘'),
                      SizedBox(width: (10/360*100).w),
                      ElevatedButton(onPressed: (){
                        SettingFunction.changeSettingColorFunction(context: context, ref: ref, player: 2);
                      }, child: Text('색상 변경')),
                    ],
                  ),
                  SizedBox(height: (8 / 760 * 100).h),
                  SettingPlayerIcon(isPlayer1: false)
                ],
              ),
              SizedBox(
                height: (16 / 760 * 100).h,
              ),
              Container(
                  width: 80.w,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GameScreen()));
                      },
                      child: Text('게임 시작하기'))),
              SizedBox(
                height: (16 / 760 * 100).h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
