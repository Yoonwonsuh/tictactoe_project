import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:tictactoe_project/setting/provider/setting_provider.dart';

class SettingChooseFirst extends ConsumerStatefulWidget {
  const SettingChooseFirst({Key? key}) : super(key: key);

  @override
  ConsumerState<SettingChooseFirst> createState() => _SettingChooseFirstState();
}

class _SettingChooseFirstState extends ConsumerState<SettingChooseFirst> {
  @override
  Widget build(BuildContext context) {
    final firstPlayer = ref.watch(settingFirstPlayer);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('선공'),
        SizedBox(
          height: (16 / 760 * 100).h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: (){
                ref.watch(settingFirstPlayer.notifier).update((state) => 0);
              },
              child: Row(
                children: [
                  Icon(firstPlayer == 0
                      ? Icons.check_box_outlined
                      : Icons.check_box_outline_blank_outlined),
                  SizedBox(width: (5/360*100).w),
                  Text('Random'),
                ],
              ),
            ),
            InkWell(
              onTap: (){
                ref.watch(settingFirstPlayer.notifier).update((state) => 1);
              },
              child: Row(
                children: [
                  Icon(firstPlayer == 1
                      ? Icons.check_box_outlined
                      : Icons.check_box_outline_blank_outlined),
                  SizedBox(width: (5/360*100).w),
                  Text('Player1'),
                ],
              ),
            ),
            InkWell(
              onTap: (){
                ref.watch(settingFirstPlayer.notifier).update((state) => 2);
              },
              child: Row(
                children: [
                  Icon(firstPlayer == 2
                      ? Icons.check_box_outlined
                      : Icons.check_box_outline_blank_outlined),
                  SizedBox(width: (5/360*100).w),
                  Text('Player2'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
