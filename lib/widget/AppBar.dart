import "package:flutter/material.dart";
//import "package:flutter/services.dart";

// function to trigger the build process
void main() {
  runApp(MyApp()); //MaterialApp
}

// ignore: non_constant_identifier_names
MaterialApp MyApp() {
  return MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        /**
         * AppBar thường là thành phần trên cùng của ứng dụng (hoặc đôi khi là dưới cùng), 
         * nó chứa thanh công cụ và một số nút hành động phổ biến khác.
        actions: Thuộc tính này lấy danh sách các tiện ích làm tham số sẽ được hiển thị sau tiêu đề nếu AppBar là một hàng .
        title: Thuộc tính này thường lấy tiện ích chính làm tham số để hiển thị trong AppBar.
        BackgroundColor: Thuộc tính này được sử dụng để thêm màu vào nền của Appbar.
        elevation: Thuộc tính này được sử dụng để đặt tọa độ z để đặt thanh ứng dụng này so với thanh gốc của nó.
        shape:  Thuộc tính này được sử dụng để tạo hình cho Appbar và quản lý bóng của nó.
         */
        title: const Text("GeeksforGeeks"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.comment),
            tooltip: 'Comment Icon',
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Setting Icon',
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.menu),
          tooltip: 'Menu Icon',
          onPressed: () {},
        ),

        // động tác bo tròn đầu của tiêu mục
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        elevation: 50.00,
        backgroundColor: Colors.greenAccent[400],
      ),
      body: const Center(
        child: Text(
          'GeeksforGeeks',
          style: TextStyle(fontSize: 24),
        ),
      ),
    ),
    debugShowCheckedModeBanner: false,
  );
}

/**
AppBar(
  {Key key,
  Widget leading,
  bool automaticallyImplyLeading: true,
  Widget title,
  List<Widget> actions,
  double elevation,
  Color shadowColor,
  ShapeBorder shape,
  Color backgroundColor,
  Brightness brightness,
  IconThemeData iconTheme,
  IconThemeData actionsIconTheme,
  TextTheme textTheme,
  ...}
)
AppBar(
  {Phím khóa,
  Widget dẫn đầu,
  bool tự động Ngụ ýDẫn đầu: đúng,
  Tên tiện ích,
  Liệt kê các hành động<Widget>,
  độ cao gấp đôi,
  Bóng màuMàu,
  Hình dạngHình dạng đường viền,
  Màu nềnMàu,
  Độ sáng độ sáng,
  IconThemeData iconTheme,
  IconThemeHành động dữ liệuIconTheme,
  Chủ đề văn bảnChủ đề văn bản,
  ...}
)


 */
