import 'package:flutter/material.dart';
import 'package:flutter_neonate/gesture_simple/widgets/widget_tap.dart';
import 'package:flutter_neonate/state_simple/widgets_tapbox.dart';

class GestureApp extends StatefulWidget {
  const GestureApp({super.key});

  @override
  State<StatefulWidget> createState() => _GestureAppState();
}

class _GestureAppState extends State<GestureApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'neonate',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('state demo'),
          ),
          body: const Center(
            child: CustomButton(),
          )),
    );
  }
}
