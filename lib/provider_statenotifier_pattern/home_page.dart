import 'package:flutter/material.dart';
import 'package:flutter_state_management/provider_statenotifier_pattern/view/home_view.dart';

class TopPage extends StatelessWidget {
  const TopPage({Key? key}):super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Provider + StateNotifier Pattern')),
      body: const HomePage(),
    );
  }
}