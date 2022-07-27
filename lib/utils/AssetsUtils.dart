
import 'package:flutter/services.dart';

class AssetsUtils{

  Future<String> loadAsset() async{
    return await rootBundle.loadString("assets/json/config.json");
  }
}