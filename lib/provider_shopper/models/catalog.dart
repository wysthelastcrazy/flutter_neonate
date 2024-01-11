import 'package:flutter/material.dart';

///商品目录model
class CatalogModel {
  static List<String> itemNames = [
    'Code Smell',
    'Control Flow',
    'Interpreter',
    'Recursion',
    'Sprint',
    'Heisenbug',
    'Spaghetti',
    'Hydra Code',
    'Off-By-One',
    'Scope',
    'Callback',
    'Closure',
    'Automata',
    'Bit Shift',
    'Currying',
  ];

  ///get item by [id]
  Item getItemById(int id) => Item(id, itemNames[id % itemNames.length]);

  ///get item by its position in the catalog
  Item getItemByPosition(int position) {
    //在这个简单的例子中,item的position就是id
    return getItemById(position);
  }
}

///商品item信息
@immutable
class Item {
  final int id;
  final String name;
  final Color color;
  final int price = 42;

  Item(this.id, this.name)
      : color = Colors.primaries[id % Colors.primaries.length];

  ///重写get hashCode
  @override
  int get hashCode => id;

  ///重写 ‘==’
  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}
