import 'package:flutter/material.dart';
import 'package:flutter_neonate/state_simple/widgets_tapbox.dart';

class StateApp extends StatefulWidget {
  const StateApp({super.key});

  @override
  State<StatefulWidget> createState() => _StateAppState();
}

class _StateAppState extends State<StateApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'neonate',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('state demo'),
        ),
        body: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [TapboxA(), ParentWidgetB(), ParentWidgetC()]),
      ),
    );
  }
}
