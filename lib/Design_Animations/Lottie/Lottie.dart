import 'package:flutter/material.dart';
//bắt buộc gọi đến file cần dùng. trong file đó cần dùng là home: LottiePage(),
import 'package:tuhoc/Design_Animations/Lottie/lottie_page.dart';
/**Bạn có thể chọn nhiều loại tệp Lottie từ đây .
 * https://app.lottiefiles.com/?utm_medium=web&utm_source=getting-started
 */

/**Thêm phần phụ thuộc Lottie vào tệp pubspec.yaml
 * dependencies:
  flutter:
    sdk: flutter
  lottie: ^2.6.0 */

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: ThemeData.dark(),
      home: LottiePage(), // home giống như màn hình đâu tiên hiển thị
    );
  }
}
