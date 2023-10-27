import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/*nạp dữ liệu trên Internet, lay du lie tu Internet ve
  cần khai báo trong pubspec.yaml

dependencies:
  flutter:
    sdk: flutter
  http: ^1.1.0

và khi cần dùng thì gọi 
import 'package:http/http.dart';
*/

//nạp album mẫu từ JSONPlaceholder bằng http.get()phương thức này.
Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    // Nếu máy chủ trả về phản hồi 200 OK,
    // sau đó phân tích JSON.
    //thì hãy chuyển đổi JSON Mapthành Album sử dụng fromJson()phương thức xuất xưởng.
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // Nếu máy chủ không trả về phản hồi 200 OK,
    // sau đó ném ra một ngoại lệ.
    throw Exception('Failed to load album');
  }
}

//lớp chuyển đổi kiểu dữ liệu
//chuyển đổi dữ liệu thô (tức là http.response) thành đối tượng dart
class Album {
  final int userId;
  final int id;
  final String title;
/*Đôi khi bạn không muốn cho phép có một tham số nullvà không có biến mặc định tự nhiên. 
   * Trong trường hợp đó bạn có thể thêm từ khóa required vào trước tên tham số: */
  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
    );
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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

              // Theo mặc định, hiển thị một vòng quay tải.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
