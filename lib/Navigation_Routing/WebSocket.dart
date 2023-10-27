import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void main() => runApp(const MyApp());

/* WebSockets được sử dụng để kết nối với máy chủ giống như gói http .

dependencies:
  flutter:
    sdk: flutter
  web_socket_channel: ^2.4.0
   */
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'WebSocket Demo';
    return const MaterialApp(
      title: title,
      home: MyHomePage(
        title: title,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  //sử dụng thu vien WebSocketChannel để tạo kết nối với máy chủ:
  final _channel = WebSocketChannel.connect(
    Uri.parse('wss://echo.websocket.events'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              child: TextFormField(
                controller: _controller,
                decoration: const InputDecoration(labelText: 'Gửi tin nhắn'),
              ),
            ),
            const SizedBox(height: 24),
            /**Bây giờ chúng tôi đã thiết lập kết nối đến máy chủ, chúng tôi sẽ 
             * gửi một tin nhắn đến nó và nhận được thông báo tương tự như phản hồi: */
            StreamBuilder(
              stream: _channel.stream,
              builder: (context, snapshot) {
                return Text(snapshot.hasData ? '${snapshot.data}' : '');
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: 'Gửi tin nhắn',
        child: const Icon(Icons.send),
      ), // Dấu phẩy ở cuối này giúp định dạng tự động tốt hơn cho các phương thức xây dựng.
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      /*Để gửi dữ liệu đến máy chủ, hãy thêm các thông báo add() vào sink do 
      WebSocketChannel cung cấp như dưới đây: */
      _channel.sink.add(_controller.text);
    }
  }

  @override
  void dispose() {
    //Để đóng kết nối với WebSocket, hãy sử dụng cách sau:
    _channel.sink.close();
    _controller.dispose();
    super.dispose();
  }
}
