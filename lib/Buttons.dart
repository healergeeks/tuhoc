import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GeeksforGeeks',

      // để ẩn biểu ngữ gỡ lỗi
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ButtonsExample(),
    );
  }
}

// liệt kê tất cả các nút
class ButtonsExample extends StatelessWidget {
// const ButtonsExample ({Key ?key}) : super(key:key);
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  ButtonsExample({Key? key}) : super(key: key);

// bỏ qua: tránh_print

// gán hành động cho
// tất cả các nút được liệt kê
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text('GeeksforGeeks'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: TextButton(
                  /**Nút đơn giản nhất là nút văn bản. 
                   Chúng là văn bản thông thường không có bất kỳ đường viền hoặc ranh giới nào. 
                   */
                  onPressed: (() {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Text / Flat Button"),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  }),
                  child: const Text('Text Button'),
                ),
              ),
              // FlatButton không được dùng nữa và sẽ bị xóa trong tương lai.
              // Chúng tôi khuyên bạn nên sử dụng TextButton để thay thế.
              // FlatButton(
              // minWidth: MediaQuery.of(context).size.width,
              // onPressed: () {
              //	 ScaffoldMessenger.of(context).showSnackBar(
              //	 const SnackBar(
              //		 content: Text("Text / Flat Button"),
              //		 duration: Duration(seconds: 1),
              //	 ),
              //	 );
              // },
              // child: const Text('Flat Button'),
              // ),
              ElevatedButton(
                /**Nút này có tính năng đặc biệt là tăng độ cao. 
                 * Khi nhấn nút nâng, độ cao của nó sẽ tăng lên một giá trị nhất định. 
                 * Chúng không cung cấp kiểu dáng đơn giản như các nút còn lại, 
                 * nhưng bạn có thể sử dụng phương thức styleFrom để tạo kiểu cho 
                 * ElevatedButton một cách rõ ràng. */
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Elevated / Raised Button"),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                child: const Text('Elevated Button'),
              ),
              // RaisedButton không được dùng nữa và sẽ bị xóa trong bản phát hành tiếp theo.
              // Thay vào đó hãy sử dụng ElevatedButton.
              // RaisedButton(
              // onPressed: () {
              //	 ScaffoldMessenger.of(context).showSnackBar(
              //	 const SnackBar(
              //		 content: Text("Elevated / Raised Button"),
              //		 duration: Duration(seconds: 1),
              //	 ),
              //	 );
              // },
              // child: const Text('Raised Button'),
              // ),
              OutlinedButton(
                /**Đây là những OutlinedButton có văn bản ở giữa được bao bọc bởi 
                 * một đường viền mỏng. Bạn có thể sửa đổi kiểu dáng của các nút này 
                 * bằng cách sử dụng các thuộc tính được cung cấp trong gói vật liệu. 
                 * Họ có một độ cao nhẹ. */
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Outline / Outlined Button"),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                child: const Text('Outline Button'),
              ),
              OutlinedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Outline / Outlined Button"),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                child: const Text('Outlined Button'),
              ),
              IconButton(
                /**Đây là các nút có hình ảnh với màu sắc được tô bên trong. 
                 *Nút biểu tượng đại diện cho hình ảnh hoạt hình của danh mục được xác định bên trong. 
                 Chúng được sử dụng để tạo màn hình hồ sơ, tab tùy chọn, v.v. */
                icon: const Icon(Icons.star),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Icon Button"),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
              ),
              FloatingActionButton.extended(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Floating Action Button"),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                label: const Text('Floating Action Button'),
              ),
              PopupMenuButton(
                /**Nó được thể hiện bằng ba dấu chấm dọc. 
                 * Nó hiển thị một thanh menu để người dùng chọn tùy chọn
                 *  đã chọn của mình.  */
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text("Profile"),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: Text("Account"),
                    value: 2,
                  ),
                  PopupMenuItem(
                    child: Text("Settings"),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: Text("About GFG"),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: Text("Go Premium"),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: Text("Logout"),
                    value: 1,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
