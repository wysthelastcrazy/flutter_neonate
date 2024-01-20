import 'package:flutter/material.dart';
import 'package:flutter_neonate/news_simple/screens/newsDetailPage.dart';

class NewsApp extends StatefulWidget {
  const NewsApp({super.key});

  @override
  State<StatefulWidget> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'neonate',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Material(
        child: NewsDetailPage(),
      ),
    );
  }
}
