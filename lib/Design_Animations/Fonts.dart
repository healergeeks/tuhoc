// main.dart file after custom font
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
/** Bước 1: Mở https://fonts.google.com/ và tìm kiếm họ phông chữ trên thanh tìm kiếm
Bước 2: Chọn tệp phông chữ Để tải xuống, hãy nhấp vào nút “Tải xuống gia đình”. */

/** tạo folder. Đặt tên thư mục là “ fonts ”.
 * giải nén bản phông chữ vừa tải về 
 * và di chuyển vào fontn
 */

/**Bấm vào file “ pubspec.yaml ”
 * flutter:
  uses-material-design: true
  fonts:
    - family: Pacifico Regular  phần đặt tên để vào mã nguần cho dễ gọi
      fonts:
        - asset: fonts/family_name.ttf   
        file vừa tải về cần phải khai báo phông chữ cần sủ dụng
 */
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Chao mung ban'),
          backgroundColor: Colors.green,
        ), // AppBar
        body: const SafeArea(
          child: Center(
            child: Text(
              'Welcome to Nguyen Manh Dung',
              // gọi đến phông chữ vừa được tải về
              // sau cần dùng chỗ nào gọi chỗ đó
              // không có vẫn để chế độ mặc định của fuller
              style: TextStyle(
                fontFamily: 'Pacifico Regular',
                fontSize: 40.0,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
