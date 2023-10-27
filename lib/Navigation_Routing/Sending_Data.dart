import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/*Gửi dữ liệu lên Internet
  cần khai báo trong pubspec.yaml

dependencies:
  flutter:
    sdk: flutter
  http: ^1.1.0

và khi cần dùng thì gọi 
import 'package:http/http.dart';
*/
/**chúng ta sẽ tạo dữ liệu Album và gửi nó tới https://jsonplaceholder.typicode.com/albums 
 * thông qua phương thức http.post() . */

Future<Album> createAlbum(String title) async {
  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  if (response.statusCode == 201) {
    // Nếu máy chủ trả về phản hồi 201 TẠO,
    // sau đó phân tích JSON.
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // Nếu máy chủ không trả về phản hồi 201 CREATED,
    // sau đó ném ra một ngoại lệ.
    throw Exception('Không tạo được album.');
  }
}

//lớp chuyển đổi kiểu dữ liệu
//chuyển đổi dữ liệu thô (tức là http.response) thành đối tượng dart
class Album {
  final int id;
  final String title;
/*Đôi khi bạn không muốn cho phép có một tham số nullvà không có biến mặc định tự nhiên. 
   * Trong trường hợp đó bạn có thể thêm từ khóa required vào trước tên tham số: */
  const Album({required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'] as int,
      title: json['title'] as String,
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _controller = TextEditingController();
  Future<Album>? _futureAlbum;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Create Data Example'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: (_futureAlbum == null) ? buildColumn() : buildFutureBuilder(),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _controller,
          decoration: const InputDecoration(hintText: 'Nhập tiêu đề'),
        ),
        /*Khi ElevatedButton nhấn, nó _futureAlbum được đặt thành 
        giá trị được trả về bởi createAlbum()phương thức. */
        ElevatedButton(
          onPressed: () {
            setState(() {
              _futureAlbum = createAlbum(_controller.text);
            });
          },
          child: const Text('Tạo dữ liệu'),
        ),
      ],
    );
  }

//Hiển thị phản hồi trên màn hình
  FutureBuilder<Album> buildFutureBuilder() {
    return FutureBuilder<Album>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        /*Lưu ý rằng snapshot.hasDatachỉ trả về truekhi ảnh chụp nhanh chứa giá trị 
  dữ liệu khác null. Đây là lý do tại sao createAlbum()hàm này sẽ đưa ra 
  một ngoại lệ ngay cả trong trường hợp máy chủ phản hồi “404 Not Found”. 
  Nếu createAlbum()trả về nullthì CircularProgressIndicatorhiển thị vô thời hạn. */
        if (snapshot.hasData) {
          return Text(snapshot.data!.title);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
