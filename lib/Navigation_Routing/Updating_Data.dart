import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/*Cập nhật dữ liệu trên Internet
  cần khai báo trong pubspec.yaml

dependencies:
  flutter:
    sdk: flutter
  http: ^1.1.0

và khi cần dùng thì gọi 
import 'package:http/http.dart';
*/
// Fetch() để tìm nạp dữ liệu
Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

// Hành động gửi đi tùy thuộc vào
// phản hồi của máy chủ
  if (response.statusCode == 200) {
    return Album.fromJson(json.decode(response.body));
  } else {
    throw Exception('Không tải được album');
  }
}

/**phương thức http.put() để cập nhật tiêu đề Album trong 
    https://jsonplaceholder.typicode.com/
 */
Future<Album> updateAlbum(String title) async {
  final http.Response response = await http.put(
    Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );
// phân tích cú pháp JSOn hoặc đưa ra một ngoại lệ
  if (response.statusCode == 200) {
    //fromJSON() để chuyển đổi Bản đồ JSON thành Album nếu máy chủ trả về phản hồi OK với mã trạng thái là 200.
    return Album.fromJson(json.decode(response.body));
  } else {
    throw Exception('Không cập nhật được album.');
  }
}

//lớp chuyển đổi kiểu dữ liệu
//chuyển đổi dữ liệu thô (tức là http.response) thành đối tượng dart
class Album {
  final int id;
  final String title;

  /*Đôi khi bạn không muốn cho phép có một tham số nullvà không có biến mặc định tự nhiên. 
   * Trong trường hợp đó bạn có thể thêm từ khóa required vào trước tên tham số: */
  Album({required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['title'],
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
// ignore: library_private_types_in_public_api
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _controller = TextEditingController();
  late Future<Album> _futureAlbum;

  @override
  void initState() {
    super.initState();
    _futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ví dụ về cập nhật dữ liệu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Nguyen Quang Manh'),
          backgroundColor: Colors.green,
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<Album>(
            future: _futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(snapshot.data!.title),
                      //ô nhập dữ liệu để cập nhập
                      TextField(
                        controller: _controller,
                        decoration:
                            const InputDecoration(hintText: 'Nhập tiêu đề'),
                      ),
                      ElevatedButton(
                        child: const Text('cập nhập dữ liệu'),
                        onPressed: () {
                          setState(() {
                            _futureAlbum = updateAlbum(_controller.text);
                          });
                        },
                      )

                      // RaisedButton không được dùng nữa và không nên sử dụng.
                      // Thay vào đó hãy sử dụng ElevatedButton.

                      // RaisedButton(
                      // 	 child: const Text('Update Data'),
                      // 	 onPressed: () {
                      // 	 setState(() {
                      // 		 _futureAlbum = updateAlbum(_controller.text);
                      // 	 });
                      // 	 },
                      // ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
