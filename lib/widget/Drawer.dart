import 'package:flutter/material.dart';

// hàm kích hoạt xây dựng ứng dụng
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'Flutter Drawer Demo';

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    ); // MaterialApp
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.green,
      ),
      body: const Center(
          child: Text(
        'A drawer is an invisible side screen.',
        style: TextStyle(fontSize: 20.0),
      )),

      /**
        Drawer({Key key, double elevation: 16.0, Widget child, String semanticLabel}) 
    child: Các widget ở dưới widget này trong cây.
    hashCode: Mã băm cho đối tượng này.
    key: Kiểm soát cách một tiện ích thay thế một tiện ích khác trong cây.
    RuntimeType: Thể hiện kiểu thời gian chạy của đối tượng.
    elevation: Tọa độ z để đặt ngăn kéo này so với ngăn kéo mẹ của nó.
    semanticLabel:  Nhãn ngữ nghĩa của hội thoại được các khung trợ năng sử dụng để thông báo chuyển đổi màn hình khi ngăn được mở và đóng.
       */
      /**
       * Drawer(ngăn kéo) được sử dụng để cung cấp quyền truy cập vào các điểm đến và 
       * chức năng khác nhau được cung cấp trong ứng dụng của bạn. 
       * Nó được thể hiện bằng ba đường thẳng song song nằm ngang ở đầu trên của giàn giáo. 
       * Nó có chuyển động ngang từ rìa của Giàn giáo để điều 
       * hướng liên kết đến các tuyến đường khác nhau trong ứng dụng rung.
       */
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.green),
                accountName: Text(
                  "Quang Manh",
                  style: TextStyle(fontSize: 18), // định nghĩa cỡ chữ
                ),
                accountEmail: Text("dm007961@gmail.com"),

                //hình ảnh đại diện hình tròn vói kích cỡ hình tròn 50
                currentAccountPictureSize: Size.square(50),

                //ảnh đại diện
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 165, 255, 137),
                  child: Text(
                    "M", // định nghĩa chữ màu sắc trong ảnh đai diện
                    style: TextStyle(fontSize: 30.0, color: Colors.blue),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' My Profile '),
              onTap: () {
                /**Navigator.pop(context); Bộ điều hướng được sử dụng để thực hiện chức năng đóng trên 
                 *ngăn kéo khi người dùng muốn đóng nó sau khi chạm vào một số mục. 
                 *Điều này có thể được thực hiện bằng cách sử dụng Trạng thái điều hướng.  */
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text(' My Course '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.workspace_premium),
              title: const Text(' Go Premium '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.video_label),
              title: const Text(' Saved Videos '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text(' Edit Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
