import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe_project/setting/provider/setting_provider.dart';

class SettingSize extends ConsumerStatefulWidget {
  const SettingSize({Key? key}) : super(key: key);

  @override
  ConsumerState<SettingSize> createState() => _SettingSizeState();
}

class _SettingSizeState extends ConsumerState<SettingSize> {
  Widget buildGrid({required int grid}) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: grid,
          childAspectRatio: 1,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1),
      itemCount: grid * grid,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.white,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectSize = ref.watch(settingSize);

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          childAspectRatio: 1),
      itemCount: 4,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: (){
            ref.watch(settingSize.notifier).update((state) => index+3);
          },
          child: Stack(
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: index == selectSize-3 ? Colors.green : Colors.black),
                  child: buildGrid(grid: index + 3),
                ),
              ),
              Center(
                  child: Text(
                '${index + 3}X${index + 3}',
                style: TextStyle(
                    color: index == selectSize-3 ? Colors.green : Colors.black),
              )),
            ],
          ),
        );
      },
    );
  }
}
