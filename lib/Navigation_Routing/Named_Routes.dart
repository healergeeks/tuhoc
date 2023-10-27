import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Named Routes',
    //Tuyến đường chính là tuyến đường mặc định của ứng dụng của bạn trong khi
    //tuyến đường ban đầu là tuyến đường đầu tiên được hiển thị trên màn hình.
    initialRoute: '/',
    routes: {
      // cách đặt tên và các tuyến đường khác nhau
      '/': (context) => const firstRoute(),
      '/second': (context) => const secondRoute(),
    },
  ));
}

// ignore: camel_case_types
class firstRoute extends StatelessWidget {
  const firstRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tuyến đường đầu tiên của GFG'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Màn hình khởi chạy'),
          onPressed: () {
            //để chuyển đổi giữa các tuyến đường
            Navigator.pushNamed(context, '/second');
          },
        ),

        // RaisedButton is deprecated now
        // child: RaisedButton(
        // child: const Text('Launch screen'),
        // onPressed: () {
        //	 Navigator.pushNamed(context, '/second');
        // },
        // ),
      ),
    );
  }
}

// ignore: camel_case_types
class secondRoute extends StatelessWidget {
  const secondRoute({Key? key}) : super(key: key);

  @override
// ignore: dead_code
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tuyến đường thứ hai của GFG"),
        backgroundColor: Color.fromARGB(255, 216, 14, 162),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //Quay lại tuyến đường đầu tiên bằng phương thức Navigator.pop().
            Navigator.pop(context);
          },
          child: const Text('Quay lại!'),
        ),
      ),

      // RaisedButton hiện không được dùng nữa
      // child: RaisedButton(
      // onPressed: () {
      //	 Navigator.pop(context);
      // },
      // child: const Text('Go back!'),
      // ),
    );
  }
}
