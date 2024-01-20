// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neonate/news_simple/newsApp.dart';

void main() {
  // setupWindow();
  ///购物车
  // runApp(const ShopperApp());
  ///http
  // runApp(const HttpApp());
  ///news
  runApp(const NewsApp());
}

const double windowWidth = 400;
const double windowHeight = 800;

// void setupWindow() {
//   if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
//     WidgetsFlutterBinding.ensureInitialized();
//     setWindowTitle('Provider Demo');
//     setWindowMinSize(const Size(windowWidth, windowHeight));
//     setWindowMaxSize(const Size(windowWidth, windowHeight));
//     getCurrentScreen().then((screen) {
//       setWindowFrame(Rect.fromCenter(
//         center: screen!.frame.center,
//         width: windowWidth,
//         height: windowHeight,
//       ));
//     });
//   }
// }
