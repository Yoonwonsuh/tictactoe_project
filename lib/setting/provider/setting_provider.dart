import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

final settingSize = StateProvider<int>((ref) => 3);
final settingPlayer1Icon = StateProvider<int>((ref)=>3);
final settingPlayer2Icon = StateProvider<int>((ref)=>0);
final settingPlayer1Color = StateProvider<Color>((ref) => Colors.blue);
final settingPlayer2Color = StateProvider<Color>((ref) => Colors.red);
final settingFirstPlayer = StateProvider<int>((ref) => 0);
