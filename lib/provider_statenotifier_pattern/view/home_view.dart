import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_state_management/provider_statenotifier_pattern/logic/home_logic.dart';
import 'package:flutter_state_management/provider_statenotifier_pattern/state/home_state.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build実行');
    /// StateNotifierProviderで変更通知可能な状態を、下位Widgetで受け取れるようにする。
    return StateNotifierProvider<HomePageStateNotifier,HomePageState>(
      create: (context) => HomePageStateNotifier(),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              WidgetA(),
              WidgetB(),
              WidgetC(),
            ],
          ),
        ),
      ),
    );
  }
}


class WidgetA extends StatelessWidget {
  const WidgetA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('WidgetAをビルド');
    return Text(
      'You have pushed the button this many times:',
    );
  }
}

class WidgetB extends StatelessWidget {
  const WidgetB({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    print('WidgetBをビルド');
    /// context.watch<T>()を利用して状態を受け取る。
    // final int counter = context.watch<HomePageState>().counter;
    /// Provider.of<T>()を利用して状態を受け取る。引数のlistenを指定しないため、状態に変更があった時にリビルドされる
    final state = Provider.of<HomePageState>(context);
    return Text(
      '${state.counter}',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class WidgetC extends StatelessWidget {
  const WidgetC({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    print('WidgetCをビルド');
    /// context.read<T>()を利用してロジックを受け取る。
    // final Function increment = context.read<HomePageStateNotifier>().increment;
    /// Provider.of<T>()を利用して状態を受け取る。引数のlistenを指定しているため、状態に変更があった時でもリビルドが行われない。
    final state = Provider.of<HomePageStateNotifier>(context, listen: false);
    return ElevatedButton(
      onPressed: () => state.increment(),
      child: Text('Count')
    );
  }
}