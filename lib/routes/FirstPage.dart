import 'package:flutter/material.dart';
import 'package:flutter_neonate/widgets/Echo.dart';
import 'package:flutter_neonate/widgets/RandowWordsWidget.dart';
import 'package:flutter_neonate/widgets/Tapbox.dart';

class FirstPage extends StatefulWidget{
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FirstPageState();
}
class _FirstPageState extends State<FirstPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FirstPage'),
      ),
      body: Center(
        child: Column(
          children: const [
            TapboxA(),
            ParentWidgetB(),
            ParentWidgetC(),
            RandomWordsWidget()
          ],
        ),
      )
    );
  }

}