import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

/**chúng tôi ám chỉ chế độ dọc và ngang trong điện thoại thông minh thay vì hướng vật lý.
 *thực hiện bằng cách sử dụng OrientationBuilder , xác định hướng hiện tại của ứng dụng .
 */
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'GeeksForGeeks';

    return MaterialApp(
      title: appTitle,
      home: OrientationList(
        title: appTitle,
      ),
    );
  }
}

class OrientationList extends StatelessWidget {
  final String title;

  OrientationList({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), backgroundColor: Colors.green),
      // với body bao hàm OrientationBuilder điện thoại sẽ nhận diện được chiều của máy tính
      // để thay đổi số cột
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.count(
            //lưới có 3 và 4 cột tương ứng cho chế độ dọc và ngang
            //nếu thay đổi ngang điện thoại thì số cột thay đổi theo Orientation
            crossAxisCount: orientation == Orientation.portrait ? 3 : 4,

            // trình tạo mục ngẫu nhiên
            children: List.generate(100, (index) {
              return Center(
                child: Text(
                  'A $index',
                  style: Theme.of(context).textTheme.headline4,
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
