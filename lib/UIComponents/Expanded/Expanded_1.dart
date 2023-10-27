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

          // BackgroundColor được sử dụng để thay đổi
          // màu nền của thanh ứng dụng
          backgroundColor: Colors.white,
        ),

        // Gọi hàm DicePage()
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
      // Thay vì hàng chúng ta cũng có thể sử dụng
      // chỉ cột căn chỉnh biểu tượng
      // sẽ thay đổi và các chức năng khác vẫn giữ nguyên
      child: Row(
        children: <Widget>[
          /**
           * Expanded(
                {
                  Key key, 
                  int flex: 1,
                  @required Widget child,
                }
              )
              child: Đây là tiện ích hiện diện bên dưới lớp mở rộng
              Flex factor: Hệ số linh hoạt là tỷ lệ trong đó không gian có sẵn 
                    được chia cho các phần tử con để chiếm trục chính. 
                    Nếu hệ số linh hoạt bằng 0 hoặc NULL thì trẻ sẽ tự phân bổ kích thước của nó.
              Key: Nó quản lý cách một widget được thay thế bằng một widget khác
              FlexFit: Nó xác định mức độ linh hoạt của một tiện ích để có được không gian sẵn có.
           */
          /**
           * Khi chúng tôi tạo bất kỳ phần tử con nào của hàng hoặc cột, 
           * chúng tôi sẽ cung cấp kích thước của tiện ích theo kích thước 
           * màn hình nhưng đôi khi khi chúng tôi cung cấp nhiều kích thước 
           * của phần tử con hơn so với kích thước màn hình, chúng tôi nhận
           *  được cảnh báo và tiện ích của chúng tôi sẽ thoát ra khỏi màn 
           * hình để giải quyết Bằng cách này, chúng tôi đặt phần tử con của
           *  hàng hoặc cột vào một Expanded để phần tử con chỉ chiếm 
           * không gian có sẵn dọc theo trục chính.
           */
          Expanded(
            // FlatButton được sử dụng để tạo
            // hình ảnh là một nút mà chúng ta có thể nhấn.
            child: TextButton(
              child: Container(
                color: Colors.green,
                padding: const EdgeInsets.all(14),
                child: Image.asset('assets/images/hinh_1.jpg'),
              ),
              onPressed: () {},
              /*
              onPressed (): Nó được kích hoạt khi nhấn nút.
              onLongPress (): Nó được kích hoạt khi nhấn và giữ nút.    
               */
            ),

            // FlatButton không được dùng nữa và không nên sử dụng
            // Chúng ta có thể sử dụng TextButton thay vì FlatButton

            // child: FlatButton(
            //   //Image.asset được sử dụng để nhập hình ảnh
            //   // từ các tệp dự án của chúng tôi chỉ trong ngoặc
            //   // chúng tôi đang cung cấp tên hình ảnh của chúng tôi.
            //   child: Image.asset('assets/images/hinh_1.jpg'),
            // ),
          ),
        ],
      ),
    );
  }
}

class FlatButton {}
