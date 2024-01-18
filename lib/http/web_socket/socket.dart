import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketUtils {
  static late WebSocketChannel _channel;

  static WebSocketChannel connectServer() {
    _channel =
        WebSocketChannel.connect(Uri.parse('wss://echo.websocket.events'));
    return _channel;
  }

  static sendMessage(String message) {
    _channel.sink.add(message);
  }

  static disConnectServer() {
    _channel.sink.close();
  }
}
