import 'package:state_notifier/state_notifier.dart';
import 'package:flutter_state_management/provider_statenotifier_pattern/state/home_state.dart';

/// 状態を変更するロジッククラス
class HomePageStateNotifier extends StateNotifier<HomePageState> {
  HomePageStateNotifier():super(const HomePageState());

  void increment() {
    /// 新しい状態をセットすることで変更が通知される
    state = state.copyWith(state.counter + 1);
  }
}