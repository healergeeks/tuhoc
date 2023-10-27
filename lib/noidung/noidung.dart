// Nhập các gói quan trọng yêu cầu kết nối
// flutter và dart
import 'package:flutter/material.dart';

void main() {
// Ra lệnh runApp() để chạy ứng dụng.

/* Mục đích của hàm runApp() là đính kèm
widget đã cho vào màn hình. */
  runApp(const MyApp());
}

// Widget dùng để tạo UI trong Flutter framework.

/* StatelessWidget là một widget không duy trì
bất kỳ trạng thái nào của widget. */

/* MyApp mở rộng StatelessWidget và ghi đè lên nó
phương pháp xây dựng. */
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

// Widget này là thư mục gốc của ứng dụng của bạn.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // tiêu đề của ứng dụng
      title: 'Xin chào ứng dụng demo thế giới',
      // chủ đề của widget
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      // Giao diện người dùng bên trong của ứng dụng
      home: const MyHomePage(title: 'trang chủ'),
    );
  }
}

/* Lớp này tương tự như MyApp thay vào đó
return Giành lợi ích */
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      // Đặt nội dung thành
      // ở giữa trang ứng dụng
      body: const Center(
          // Thiết lập nội dung của Ứng dụng
          child: Text(
        'Welcome to NguyenManhDung!',
      )),
    );
  }
}
