import 'package:flutter/material.dart';
import 'stateful_widget_pattern/pages/home_page.dart' as stateful_widget_pattern;
import 'provider_pattern/pages/home_page.dart' as provider_pattern;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State Management',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const stateful_widget_pattern.TopPage(),
        '/statefulWidgetPattern': (context) => const stateful_widget_pattern.TopPage(),
        '/providerPattern':(context) => const provider_pattern.TopPage(),
      },
    );
  }
}