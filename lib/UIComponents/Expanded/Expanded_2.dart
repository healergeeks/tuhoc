import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green,

        // App Bar được sử dụng để tạo
        // một thanh để đặt tiêu đề cho ứng dụng của chúng ta
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'NguyenManhDung',

            // TextStyle là một lớp
            // nơi chúng ta có thể sửa đổi văn bản của mình
            style: TextStyle(
              // Để gán màu cho văn bản của chúng ta
              color: Colors.green,
            ),
          ),

          // BackgroundColor được sử dụng để
          // thay đổi màu sắc của chúng tôi
          // nền thanh ứng dụng
          backgroundColor: Colors.white,
        ),

        //Gọi hàm DicePage()
        body: const DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
// ignore: library_private_types_in_public_api
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      // Ở đây chúng ta đang sử dụng row.
      // Thay vì hàng chúng ta cũng chỉ có thể sử dụng cột
      // sự căn chỉnh của biểu tượng sẽ thay đổi và khác
      // hàm vẫn giữ nguyên
      child: Row(
        children: <Widget>[
          // Đối với hình ảnh 1
          Expanded(
            // Flex được sử dụng để phân bổ
            // không gian có sẵn trong tỷ lệ
            // từ đứa trẻ này sang đứa trẻ khác
            // nó có thể là bất kỳ giá trị nào.
            flex: 2,

            child: TextButton(
              child: Container(
                color: Colors.green,
                padding: const EdgeInsets.all(14),
                child: Image.asset('assets/images/hinh_1.jpg'),
              ),
              onPressed: () {},
            ),

            // FlatButton không được dùng nữa và không nên sử dụng
            // Chúng ta có thể sử dụng TextButton thay vì FlatButton

            // FlatButton được sử dụng để tạo
            // hình ảnh là một nút mà chúng ta có thể nhấn.

            // child: FlatButton(
            // // Image.asset được sử dụng để nhập
            // // chỉ hình ảnh từ các tệp dự án của chúng tôi
            // // trong ngoặc chúng tôi đang cung cấp tên của hình ảnh của chúng tôi.
            // child: Image.asset('assets/images/hinh_1.jpg'),
            // ),
          ),
          // Đối với hình ảnh 2.
          Expanded(
            child: TextButton(
              child: Container(
                color: Colors.green,
                padding: const EdgeInsets.all(14),
                child: Image.asset('assets/images/hinh_1.jpg'),
              ),
              onPressed: () {},
            ),

            // FlatButton không được dùng nữa và không nên sử dụng
            // Chúng ta có thể sử dụng TextButton thay vì FlatButton

            // child: FlatButton(
            // child: Image.asset('assets/images/hinh_1.jpg'),
            // ),
          ),
        ],
      ),
    );
  }
}
