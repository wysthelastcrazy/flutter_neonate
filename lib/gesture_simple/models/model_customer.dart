import 'package:flutter/material.dart';

@immutable
class Item {
  final int totalPriceCents;
  final String name;
  final String uid;
  final ImageProvider imageProvider;

  const Item(
      {required this.totalPriceCents,
      required this.name,
      required this.uid,
      required this.imageProvider});

  String get formattedTotalItemPrice =>
      '\$${(totalPriceCents / 100.0).toStringAsFixed(2)}';
}

class Customer {
  final String name;
  final ImageProvider imageProvider;
  final List<Item> items;

  Customer({required this.name, required this.imageProvider, List<Item>? items})
      : items = items ?? [];

  String get formattedTotalItemPrice {
    final totalPriceCents = items.fold<int>(
        0, (previousValue, element) => previousValue + element.totalPriceCents);

    return '\$${(totalPriceCents / 100.0).toStringAsFixed(2)}';
  }
}
