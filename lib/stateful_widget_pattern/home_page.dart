import 'package:flutter/material.dart';

class TopPage extends StatelessWidget {
  const TopPage({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('StatefulWidget Pattern')),
      body: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}):super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build実行');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WidgetA(),                    /// Text
            WidgetB(_counter),            /// カウンター値
            WidgetC(_incrementCounter),   /// ボタン
          ],          
        ),
      ),
    );
  }
}

class WidgetA extends StatelessWidget {
  const WidgetA({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    print('WidgetAをビルド');
    return Text('You have pushed the button this many times');
  }
}

class WidgetB extends StatelessWidget {
  const WidgetB(this.counter, {Key? key}):super(key: key);
  final int counter;

  @override
  Widget build(BuildContext context) {
    print('WidgetBをビルド');
    return Text(
      '$counter',
      style: Theme.of(context).textTheme.headline4
    );
  }
}

class WidgetC extends StatelessWidget {
  const WidgetC(this.increment, {Key? key}):super(key: key);
  final Function increment;

  @override
  Widget build(BuildContext context) {
    print('WidgetCをビルド');
    return ElevatedButton(
      onPressed: () => increment(),
      child: Text('Count')
    );
  }
}