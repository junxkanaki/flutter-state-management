import 'package:flutter_state_management/bloc_pattern/home_page.dart';
import 'package:state_notifier/state_notifier.dart';

import 'package:state_notifier/state_notifier.dart';
import 'package:flutter_state_management/provider_statenotifier_pattern/state/home_state.dart';

class HomePageStateNotifier extends StateNotifier<HomePageState> {
  HomePageStateNotifier():super(const HomePageState());

  void increment() {
    state = state.copyWith(state.counter + 1);
  }
}