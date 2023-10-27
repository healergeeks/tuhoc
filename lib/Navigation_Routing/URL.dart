// nhập phụ thuộc
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// hàm kích hoạt quá trình xây dựng
void main() => runApp(const MyApp());
/**Trong tệp pubspec.yaml  cần khai báo như bên dưới
 dependencies:
  flutter:
    sdk: flutter
  url_launcher:
 */

///_launchURLBrowser() để mở nó trong trình duyệt
// Hàm này được khai báo là “async”, do đó hàm này trả về một lời hứa.
_launchURLBrowser() async {
  var url = Uri.parse("https://www.facebook.com/nguyenmanhdung2402/");
  // canLaunchUrl(url) XEM ỦL CÓ RỖNG HAY KHÔNG và xem trình duyệt đó có hay không
  if (await canLaunchUrl(url)) {
    //khi đó url mới được khởi chạy bằng cách gọi hàm launch() với biến url làm thuộc tính.
    await launchUrl(url);
  } else {
    throw 'Không thể khởi chạy $url';
  }
}

//_launchURLApp() để mở nó trong ứng dụng.
_launchURLApp() async {
  var url = Uri.parse("https://www.facebook.com/nguyenmanhdung2402/");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Không thể khởi chạy $url';
  }
}

/**Để mở URL bên trong ứng dụng, phải đáp ứng hai điều kiện.

 ForceWebView: true - điều này giúp ứng dụng bắt đầu chế độ xem web của ứng dụng để trang web mở bên trong ứng dụng.
ForceSafariVC: true — trong thiết bị iOS, điều này giúp ứng dụng mở trang web trong Trình điều khiển Safari View chứ không phải trình duyệt mặc định. */
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Nguyễn Mạnh DŨng'),
          backgroundColor: Colors.green,
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 250.0,
                ),
                const Text(
                  'Welcome to NMD!',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 20.0,
                ),
                ElevatedButton(
                  /**onPressed , chúng tôi gọi _launchURLBrowser và _launchURLApp 
                   * tương ứng để khi nhấn nút đầu tiên, URL sẽ được mở trong trình 
                   * duyệt và khi nhấn nút thứ hai, URL sẽ được mở trong chính ứng dụng. */
                  onPressed: _launchURLBrowser,
                  style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(5.0)),
                    textStyle: MaterialStateProperty.all(
                      const TextStyle(color: Colors.black),
                    ),
                  ),
                  // textColor: Colors.black,
                  // padding: const EdgeInsets.all(5.0),
                  child: const Text('Mở trong trình duyệt'),
                ),
                Container(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: _launchURLApp,
                  style: ButtonStyle(
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(5)),
                      textStyle: MaterialStateProperty.all(
                          const TextStyle(color: Colors.black))),
                  // textColor: Colors.black,
                  // padding: const EdgeInsets.all(5.0),
                  child: const Text('Mở trong ứng dụng'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
