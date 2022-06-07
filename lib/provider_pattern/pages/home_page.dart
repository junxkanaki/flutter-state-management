import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopPage extends StatelessWidget {
  const TopPage({Key? key}):super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Provider Pattern')),
      body: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    print('buildメソッド実行');
    return ChangeNotifierProvider(
      create: (context) => HomePageState(),
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
    final int counter = context.watch<HomePageState>().counter;
    return Text(
      '$counter',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class WidgetC extends StatelessWidget {
  const WidgetC({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    print('WidgetCをビルド');
    final Function increment = context.read<HomePageState>().increment;
    return ElevatedButton(
      onPressed: () => increment(),
      child: Text('Count')
    );
  }
}

class HomePageState extends ChangeNotifier {
  int counter = 0;

  void increment() {
    counter++;
    notifyListeners();
  }
}