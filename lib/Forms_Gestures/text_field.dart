import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Text Field Focus',
      home: MyCustomForm(),
    );
  }
}

// Xác định một tiện ích Biểu mẫu tùy chỉnh.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

// Định nghĩa một lớp State tương ứng.
// Lớp này chứa dữ liệu liên quan đến biểu mẫu.
class _MyCustomFormState extends State<MyCustomForm> {
  // Xác định nút tiêu điểm. Để quản lý vòng đời, hãy tạo FocusNode trong
  // phương thức initState và dọn sạch nó trong phương thức vứt bỏ.
  late FocusNode myFocusNode;

  @override
  //initState(trạng thái ban đầu) khi Định nghĩa để khởi tạo các biến
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  //dispose(vứt bỏ) Nó thường bị ghi đè và chỉ được gọi khi đối tượng trạng thái thoat
  //Nó không thể thay đổi trạng thái của một widget không có trạng thái.
  void dispose() {
    // Dọn dẹp nút tiêu điểm khi Biểu mẫu được xử lý.
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Field Focus'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            // Trường văn bản đầu tiên được tập trung vào ngay khi ứng dụng khởi động.
            const TextField(
              autofocus: true,
            ),
            // Trường văn bản thứ hai được tập trung vào khi người dùng chạm vào
            // Nút hành động nổi.
            TextField(
              focusNode: myFocusNode,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              /**Theo mặc định, TextFieldđược trang trí bằng gạch chân. 
           * Bạn có thể thêm nhãn, biểu tượng, văn bản gợi ý nội tuyến và văn bản lỗi 
           * bằng cách cung cấp thuộc tính InputDecoration decoration an của 
           * TextField. Để loại bỏ hoàn toàn phần trang trí (bao gồm phần gạch chân và 
           * khoảng trống dành riêng cho nhãn), hãy đặt decorationthành null. */
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a search term',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your username',
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Khi nhấn nút,
        // đặt tiêu điểm vào trường văn bản bằng myFocusNode.
        onPressed: () => myFocusNode.requestFocus(),
        tooltip: 'Focus Second Text Field',
        child: const Icon(Icons.edit),
      ), // Dấu phẩy ở cuối này giúp định dạng tự động tốt hơn cho các phương thức xây dựng.
    );
  }
}
