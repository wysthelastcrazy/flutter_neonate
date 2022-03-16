import 'package:flutter/material.dart';
import 'package:flutter_neonate/Echo.dart';

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
      body: const Echo(text: "text"),
    );
  }

}