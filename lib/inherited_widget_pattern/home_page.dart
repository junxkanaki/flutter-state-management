import 'package:flutter/material.dart';

class TopPage extends StatelessWidget {
  const TopPage({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('InheritedWidget Pattern')),
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
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('InheritedWidgetをビルド');
    return HomePageInheritedWidget(
      data: this,
      counter: counter,
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

class HomePageInheritedWidget extends InheritedWidget {
  const HomePageInheritedWidget({
    Key? key,
    required Widget child,
    required this.data,
    required this.counter
  }):super(key: key, child: child);

  final HomePageState data;
  final int counter;

  static HomePageState of(BuildContext context, {bool listen = true}) {
    if (listen) {
      return (context.dependOnInheritedWidgetOfExactType<HomePageInheritedWidget>())!.data;
    } else {
      return (context.getElementForInheritedWidgetOfExactType<HomePageInheritedWidget>()!.widget as HomePageInheritedWidget).data;
    }
  }

  @override
  bool updateShouldNotify(HomePageInheritedWidget oldWidget) {
    return counter != oldWidget.counter;
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
  const WidgetB({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomePageState state = HomePageInheritedWidget.of(context);
    print('WidgetBをビルド');
    return Text(
      '${state.counter}',
      style: Theme.of(context).textTheme.headline4
    );
  }
}

class WidgetC extends StatelessWidget {
  const WidgetC({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomePageState state = HomePageInheritedWidget.of(context, listen: false);
    print('WidgetCをビルド');
    return ElevatedButton(
      onPressed: () => state.incrementCounter(),
      child: Text('Count')
    );
  }
}