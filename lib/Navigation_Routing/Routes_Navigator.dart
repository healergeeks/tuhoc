import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: HomeRoute(),
  ));
}

class HomeRoute extends StatelessWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geeks for Geeks'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: ElevatedButton(
            child: const Text('Click Me!'),
            onPressed: () {
              /**Navigator.push(). Phương pháp này đẩy tuyến đường lên trên cùng
               * của ngôi nhà, từ đó hiển thị tuyến đường thứ hai. */
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondRoute()),
              );
            }),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Click Me Page"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            /**Navigator.pop() Điều này giúp chúng tôi xóa tuyến đường hiện tại 
             *khỏi ngăn xếp để chúng tôi quay trở lại tuyến đường gốc của mình. */
            Navigator.pop(context);
          },
          child: const Text('Home!'),
        ),
      ),
    );
  }
}
