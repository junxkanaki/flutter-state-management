import 'package:flutter/material.dart';
import 'stateful_widget_pattern/home_page.dart' as stateful_widget_pattern;
import 'provider_pattern/home_page.dart' as provider_pattern;
import 'inherited_widget_pattern/home_page.dart' as inherited_widget_pattern;
import 'bloc_pattern/home_page.dart' as bloc_pattern;
import 'provider_statenotifier_pattern/home_page.dart' as provider_statenotifier_pattern;

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
        // primaryColor: Colors.red,
        primaryColor: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const stateful_widget_pattern.TopPage(),
        '/statefulWidgetPattern': (context) => const stateful_widget_pattern.TopPage(),
        '/p':(context) => const provider_pattern.TopPage(),
        '/inheritedWidgetPattern':(context) => const inherited_widget_pattern.TopPage(),
        '/blocPattern':(context) => const bloc_pattern.TopPage(),
        '/providerStatenotifierPattern':(context) => const provider_statenotifier_pattern.TopPage(),
      },
    );
  }
}