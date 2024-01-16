import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../data/Album.dart';

class AlbumModel {
  static Future<Album> fetchAlbum() async {
    final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
        //添加认证授权header
        headers: {
          HttpHeaders.authorizationHeader: 'Basic your_api_token_here'
        });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
