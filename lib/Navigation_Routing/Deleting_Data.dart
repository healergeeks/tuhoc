import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/*Xóa dữ liệu trên Internet
  cần khai báo trong pubspec.yaml

dependencies:
  flutter:
    sdk: flutter
  http: ^1.1.0

và khi cần dùng thì gọi 
import 'package:http/http.dart';
*/

Future<Album> fetchAlbum() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
  );

  if (response.statusCode == 200) {
    // Nếu máy chủ trả về phản hồi 200 OK thì hãy phân tích cú pháp JSON.
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // Nếu máy chủ không trả về phản hồi 200 OK thì hãy đưa ra một ngoại lệ.
    throw Exception('Failed to load album');
  }
}

//http.delete() trên JSONPlaceHolder để xóa Album có id=1 như hiển thị bên dưới:
Future<Album> deleteAlbum(String id) async {
  final http.Response response = await http.delete(
    Uri.parse('https://jsonplaceholder.typicode.com/albums/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    // Nếu máy chủ trả về phản hồi 200 OK,
    // sau đó phân tích JSON. Sau khi xóa,
    // bạn sẽ nhận được phản hồi JSON `{}` trống.
    // Đừng trả về `null`, nếu không thì `snapshot.hasData`
    // sẽ luôn trả về false trên `FutureBuilder`.
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // Nếu máy chủ không trả về "phản hồi 200 OK",
    // sau đó ném ra một ngoại lệ.
    throw Exception('Failed to delete album.');
  }
}

//lớp chuyển đổi kiểu dữ liệu
//chuyển đổi dữ liệu thô (tức là http.response) thành đối tượng dart
class Album {
  final int id;
  final String title;

/*Đôi khi bạn không muốn cho phép có một tham số nullvà không có biến mặc định tự nhiên. 
    Trong trường hợp đó bạn có thể thêm từ khóa required vào trước tên tham số: */
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
  late Future<Album> _futureAlbum;

  @override
  void initState() {
    super.initState();
    _futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delete Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Delete Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: _futureAlbum,
            builder: (context, snapshot) {
              // Nếu kết nối hoàn tất,
              // kiểm tra dữ liệu phản hồi hoặc lỗi.
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  /*nút xóa dữ liệu để có thể xác minh xem dữ liệu đã bị xóa khỏi 
                  máy chủ hay chưa bằng cách gọi phương thức http.get() như dưới đây: */
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(snapshot.data?.title ?? 'Deleted'),
                      ElevatedButton(
                        child: const Text('Delete Data'),
                        onPressed: () {
                          setState(() {
                            _futureAlbum =
                                deleteAlbum(snapshot.data!.id.toString());
                          });
                        },
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
              }

              // Theo mặc định, hiển thị một vòng quay tải.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
