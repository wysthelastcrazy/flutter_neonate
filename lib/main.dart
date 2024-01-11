import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neonate/provider_shopper/common/theme.dart';
import 'package:flutter_neonate/provider_shopper/models/cart.dart';
import 'package:flutter_neonate/provider_shopper/models/catalog.dart';
import 'package:flutter_neonate/provider_shopper/screens/cart.dart';
import 'package:flutter_neonate/provider_shopper/screens/catalog.dart';
import 'package:flutter_neonate/provider_shopper/screens/login.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:window_size/window_size.dart';

void main() {
  setupWindow();
  runApp(const MyApp());
}

const double windowWidth = 400;
const double windowHeight = 800;

void setupWindow() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    WidgetsFlutterBinding.ensureInitialized();
    setWindowTitle('Provider Demo');
    setWindowMinSize(const Size(windowWidth, windowHeight));
    setWindowMaxSize(const Size(windowWidth, windowHeight));
    getCurrentScreen().then((screen) {
      setWindowFrame(Rect.fromCenter(
        center: screen!.frame.center,
        width: windowWidth,
        height: windowHeight,
      ));
    });
  }
}

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
