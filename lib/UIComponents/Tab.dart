import 'package:flutter/material.dart';

// hàm kích hoạt quá trình xây dựng ứng dụng
void main() {
  runApp(const TabBarDemo());
}

// lớp xây dựng ứng dụng
class TabBarDemo extends StatelessWidget {
  const TabBarDemo({Key? key}) : super(key: key);

// xây dựng ứng dụng
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Tab Đó là một phần của giao diện người dùng điều hướng người dùng qua
      //các tuyến đường khác nhau (tức là các trang) khi được nhấp vào.
      home: DefaultTabController(
        length: 5, // khái báo với 5 tab
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              //khỏi tạo với các nút
              tabs: [
                //khỏi tạo vói các nút vói một icon
                // Để sử dụng lớp icon,
                //bạn phải đảm bảo rằng bạn đã đặt use-material-design: true
                //trong tệp pubsec.yml của đối tượng.
                Tab(icon: Icon(Icons.music_note)),
                Tab(icon: Icon(Icons.music_video)),
                Tab(icon: Icon(Icons.camera_alt)),
                Tab(icon: Icon(Icons.grade)),
                Tab(icon: Icon(Icons.email)),
              ],
            ), // TabBar
            title: const Text('NguyenManhDung'),
            backgroundColor: Colors.green,
          ), // AppBar
          body: const TabBarView(
            //thêm nội dung vào tab
            children: [
              /**
              * Icon( 
                  key key, 
                  size, 
                  color, 
                  semanticLabel, 
                  textDirection 
                )
                color: Nó được sử dụng để thiết lập màu sắc của biểu tượng
                size: Nó được sử dụng để thay đổi kích thước Icon
                ngữ nghĩaLable: Nó hoạt động khi sử dụng ứng dụng ở chế độ trợ năng (tức là thuyết minh)
                textDirection: Nó được sử dụng để hiển thị Icon
               */
              Icon(Icons.music_note, size: 100),
              Icon(Icons.music_video, color: Colors.blue, size: 100),
              Icon(Icons.camera_alt, size: 100),
              Icon(
                Icons.grade,
                color: Colors.red,
                size: 300,
                semanticLabel: 'Star',
              ),
              Icon(Icons.email),
            ],
          ),
        ),
      ),
    );
  }
}
