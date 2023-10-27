import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// khai bao thu vien lottie
import 'package:lottie/lottie.dart';

class LottiePage extends StatefulWidget {
  @override
  _LottiePageState createState() => _LottiePageState();
}

class _LottiePageState extends State<LottiePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GeeksForGeeks"),
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Center(
        // được hiển thị theo cột

        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              // Lottie được sử dụng gọi đến một URL với file json
              child: Lottie.network(
                'https://assets1.lottiefiles.com/private_files/lf30_QLsD8M.json',
                //height: 200.0, // chiều cao của hinh
                repeat:
                    true, //Điều này được sử dụng như tên gợi ý, lặp lại hoạt ảnh nhiều lần.
                reverse:
                    true, //Điều này được sử dụng như tên cho thấy, đảo ngược chuyển động của hình ảnh động.
                animate:
                    true, //Thuộc tính này điều khiển chuyển động của hình động.
              ),
            ),
            Expanded(
              child: Lottie.network(
                'https://assets1.lottiefiles.com/private_files/lf30_yQtj4O.json',
                repeat:
                    true, //Điều này được sử dụng như tên gợi ý, lặp lại hoạt ảnh nhiều lần.
                reverse:
                    true, //Điều này được sử dụng như tên cho thấy, đảo ngược chuyển động của hình ảnh động.
                animate:
                    true, //Thuộc tính này điều khiển chuyển động của hình động.
              ),
            ),
            Expanded(
              child: Lottie.network(
                'https://lottie.host/1bdf1461-e6ea-489e-a03b-e4d1c0b57e8a/BzzXu7jlSQ.json',
                repeat:
                    true, //Điều này được sử dụng như tên gợi ý, lặp lại hoạt ảnh nhiều lần.
                reverse:
                    true, //Điều này được sử dụng như tên cho thấy, đảo ngược chuyển động của hình ảnh động.
                animate:
                    true, //Thuộc tính này điều khiển chuyển động của hình động.
              ),
            ),
            // Lottie được sử dụng gọi đến một URL với file json
            // Lottie.network(
            //   'https://assets1.lottiefiles.com/private_files/lf30_QLsD8M.json',
            //   repeat: true,
            //   reverse: true,
            //   animate: true,
            // ),
            // Lottie.network(
            //   'https://assets1.lottiefiles.com/private_files/lf30_yQtj4O.json',
            //   repeat: true,
            //   reverse: true,
            //   animate: true,
            // ),
            // Lottie.network(
            //   'https://lottie.host/1bdf1461-e6ea-489e-a03b-e4d1c0b57e8a/BzzXu7jlSQ.json',
            //   repeat: true,
            //   reverse: true,
            //   animate: true,
            // ),
          ],
        ),
      ),
    );
  }
}
//