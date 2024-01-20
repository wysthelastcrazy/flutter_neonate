import 'package:flutter/material.dart';
import 'package:flutter_neonate/http/screens/homePage.dart';

import 'data/Album.dart';
import 'models/AlbumModel.dart';

///http测试页面
class HttpApp extends StatefulWidget {
  const HttpApp({super.key});

  @override
  State<StatefulWidget> createState() => _SocketAppState();
}

///使用http包获取数据
class _HttpAppState extends State<HttpApp> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = AlbumModel.fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.title);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

///使用webSocket
class _SocketAppState extends State<HttpApp> {
  static const title = 'WebSocket Demo';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: title,
        home: MyHomePage(
          title: title,
        ));
  }
}
