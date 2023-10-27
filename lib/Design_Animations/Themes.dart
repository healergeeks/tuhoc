//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

/**Chủ đề là một phần không thể thiếu của giao diện người dùng cho bất kỳ ứng dụng nào. 
 * Chủ đề được sử dụng để thiết kế phông chữ và màu sắc của ứng dụng 
 * nhằm làm cho ứng dụng trở nên dễ nhìn hơn. Trong Flutter, 
 * tiện ích Chủ đề được sử dụng để thêm chủ đề vào ứng dụng. 
 * Người ta có thể sử dụng nó cho một phần cụ thể của ứng dụng như các 
 * nút và thanh điều hướng hoặc xác định nó trong thư mục gốc của ứng dụng để 
 * sử dụng nó trong toàn bộ ứng dụng. */
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final appName = 'GeeksForGeeks';

    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.green,
        ),
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.purple)),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ThemeData Demo'),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {},
        ),
        body: const Center(
          child: Text('Button pressed 0 times'),
        ),
      ),
    );
  }
}
/**const Theme(
{Key? key,
required ThemeData data,
bool isMaterialAppTheme: false,
required Widget child}
)

child: Thuộc tính con lấy một tiện ích làm đối tượng hiển thị bên dưới tiện ích Chủ đề trong cây tiện ích.
data: Thuộc tính này lấy lớp ThemeData làm đối tượng để chỉ định kiểu dáng, 
  màu sắc và kiểu chữ sẽ được sử dụng.
isMaterialAppTheme: Thuộc tính này lấy boolean (cuối cùng) làm đối tượng. 
  Nếu nó được đặt thành true thì chủ đề sẽ sử dụng thiết kế vật liệu. */