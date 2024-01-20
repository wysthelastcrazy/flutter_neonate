import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'common/theme.dart';
import 'models/cart.dart';
import 'models/catalog.dart';
import 'screens/cart.dart';
import 'screens/catalog.dart';
import 'screens/login.dart';

GoRouter router() {
  return GoRouter(initialLocation: '/login', routes: [
    GoRoute(path: '/login', builder: (context, state) => const MyLogin()),
    GoRoute(
        path: '/catalog',
        builder: (context, state) => const MyCatalog(),
        routes: [
          GoRoute(path: 'cart', builder: (context, state) => const MyCart())
        ])
  ]);
}

class ShopperApp extends StatelessWidget {
  const ShopperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => CatalogModel()),
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
            create: (context) => CartModel(),
            update: (context, catalog, cart) {
              if (cart == null) throw ArgumentError.notNull('cart');
              cart.catalog = catalog;
              return cart;
            })
      ],
      child: MaterialApp.router(
          title: 'provider demo', theme: appTheme, routerConfig: router()),
    );
  }
}
