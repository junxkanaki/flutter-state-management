import 'package:flutter/cupertino.dart';

/// 状態を保持するクラス
@immutable
class HomePageState {
  const HomePageState({this.counter = 0});
  final int counter;

  HomePageState copyWith(int counter) => HomePageState(counter: counter);
}