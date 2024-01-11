import 'package:flutter/material.dart';
import 'package:flutter_neonate/provider_shopper/models/catalog.dart';

class CartModel extends ChangeNotifier {
  late CatalogModel _catalog;

  //内部，私有状态的购物车。存储每个元素。
  final List<Item> _items = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
    notifyListeners();
  }

  List<Item> get items => _items;

  int get totalPrice {
    return _items.fold(0, (total, current) => total + current.price);
  }

  void add(Item item) {
    // if(_items.contains(item))
    _items.add(item);
    notifyListeners();
  }

  void remove(Item item) {
    _items.remove(item);
    notifyListeners();
  }
}
