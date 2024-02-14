import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:tictactoe_project/setting/provider/setting_provider.dart';

class SettingPlayerIcon extends ConsumerStatefulWidget {
  SettingPlayerIcon({Key? key, required this.isPlayer1}) : super(key: key);
  bool isPlayer1;

  @override
  ConsumerState<SettingPlayerIcon> createState() => _SettingPlayerIconState();
}

class _SettingPlayerIconState extends ConsumerState<SettingPlayerIcon> {
  @override
  Widget build(BuildContext context) {
    final player1check = ref.watch(settingPlayer1Icon);
    final player2check = ref.watch(settingPlayer2Icon);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () {
            if (widget.isPlayer1) {
              ref.watch(settingPlayer1Icon.notifier).update((state) => 0);
            } else {
              ref.watch(settingPlayer2Icon.notifier).update((state) => 0);
            }
          },
          child: Column(
            children: [
              Icon(
                Icons.circle_outlined,
                color: widget.isPlayer1 ? ref.watch(settingPlayer1Color):ref.watch(settingPlayer2Color),
                size: 10.w,
              ),
              Icon(widget.isPlayer1 && player1check == 0
                  ? Icons.check_box_outlined
                  : !widget.isPlayer1 && player2check == 0
                      ? Icons.check_box_outlined
                      : Icons.check_box_outline_blank_outlined)
            ],
          ),
        ),
        InkWell(
          onTap: () {
            if (widget.isPlayer1) {
              ref.watch(settingPlayer1Icon.notifier).update((state) => 1);
            } else {
              ref.watch(settingPlayer2Icon.notifier).update((state) => 1);
            }
          },
          child: Column(
            children: [
              Icon(
                Icons.change_history_outlined,
                color: widget.isPlayer1 ?  ref.watch(settingPlayer1Color):ref.watch(settingPlayer2Color),
                size: 10.w,
              ),
              Icon(widget.isPlayer1 && player1check == 1
                  ? Icons.check_box_outlined
                  : !widget.isPlayer1 && player2check == 1
                      ? Icons.check_box_outlined
                      : Icons.check_box_outline_blank_outlined)
            ],
          ),
        ),
        InkWell(
          onTap: () {
            if (widget.isPlayer1) {
              ref.watch(settingPlayer1Icon.notifier).update((state) => 2);
            } else {
              ref.watch(settingPlayer2Icon.notifier).update((state) => 2);
            }
          },
          child: Column(
            children: [
              Icon(
                Icons.square_outlined,
                color: widget.isPlayer1 ?  ref.watch(settingPlayer1Color):ref.watch(settingPlayer2Color),
                size: 10.w,
              ),
              Icon(widget.isPlayer1 && player1check == 2
                  ? Icons.check_box_outlined
                  : !widget.isPlayer1 && player2check == 2
                      ? Icons.check_box_outlined
                      : Icons.check_box_outline_blank_outlined)
            ],
          ),
        ),
        InkWell(
          onTap: () {
            if (widget.isPlayer1) {
              ref.watch(settingPlayer1Icon.notifier).update((state) => 3);
            } else {
              ref.watch(settingPlayer2Icon.notifier).update((state) => 3);
            }
          },
          child: Column(
            children: [
              Icon(
                Icons.close_outlined,
                color: widget.isPlayer1 ?  ref.watch(settingPlayer1Color):ref.watch(settingPlayer2Color),
                size: 10.w,
              ),
              Icon(widget.isPlayer1 && player1check == 3
                  ? Icons.check_box_outlined
                  : !widget.isPlayer1 && player2check == 3
                      ? Icons.check_box_outlined
                      : Icons.check_box_outline_blank_outlined)
            ],
          ),
        )
      ],
    );
  }
}
