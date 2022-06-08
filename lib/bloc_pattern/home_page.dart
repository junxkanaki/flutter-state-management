import 'dart:async';

import 'package:flutter/material.dart';

class TopPage extends StatelessWidget {
  const TopPage({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BLoC Pattern')),
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
  late HomePageLogic homePageLogic;

  @override
  void initState() {
    super.initState();
    homePageLogic = HomePageLogic();
  }

  @override
  Widget build(BuildContext context) {
    print('build実行');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const WidgetA(),
            WidgetB(homePageLogic),
            WidgetC(homePageLogic),
          ],
        ),
      ),
    );
  }
}

class HomePageLogic {
  HomePageLogic() {
    _counterController.sink.add(_counter);
  }

  final StreamController<int> _counterController = StreamController();
  int _counter = 0;

  Stream<int> get count => _counterController.stream;

  void increment() {
    _counter++;
    _counterController.sink.add(_counter);
  }

  void dispose() {
    _counterController.close();
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
  const WidgetB(this.homePageLogic, {Key? key}):super(key: key);
  final HomePageLogic homePageLogic;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: homePageLogic.count,
      builder: (context, snapshot) {
        print('WidgetBをビルド');
        return Text(
          '${snapshot.data}',
          style: Theme.of(context).textTheme.headline4,
        );
      },
    );
  }
}

class WidgetC extends StatelessWidget {
  const WidgetC(this.homePageLogic, {Key? key}):super(key: key);
  final HomePageLogic homePageLogic;

  @override
  Widget build(BuildContext context) {
    print('WidgetCをビルド');
    return ElevatedButton(
      onPressed: () => homePageLogic.increment(),
      child: Text('Count')
    );
  }
}