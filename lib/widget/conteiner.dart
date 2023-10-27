import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
//
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Container example"),
        ),

        /**
         * container giống như một chiếc hộp để đựng đồ bên trong. 
         * Phần tử vùng chứa cơ bản lưu trữ một tiện ích có lề , 
         * ngăn cách vùng chứa hiện tại với các nội dung khác. 
         * Tổng vùng chứa có thể được cung cấp một đường viền có các hình dạng khác nhau, 
         * ví dụ: hình chữ nhật tròn, v.v. Một vùng chứa bao quanh con của nó bằng phần đệm 
         * và sau đó áp dụng các ràng buộc bổ sung cho phạm vi được đệm 
         * (kết hợp chiều rộng và chiều cao làm các ràng buộc, nếu một trong hai không phải là vô giá trị).
         */
        body: Container(
          //mặc đinh chiều rộng, cao chiếm theo không gian mà nội dung bên trong yêu cầu
          // nhung cũng có thể chỉ đinh chiều cao, rộng của vùng chứa dựa trên yêu cầu
          height: 200,
          width: double.infinity,

          //color một màu nền của toàn bộ vùng chứa
          color: Colors.purple,

          //alignment(căn chỉnh):Căn chỉnh được sử dụng để định vị trẻ trong thùng chứa.
          // Chúng ta có thể căn chỉnh theo nhiều cách khác nhau: dưới cùng, giữa dưới cùng, trái, phải, v.v.
          // ở đây trẻ được căn chỉnh về giữa dưới cùng.
          alignment: Alignment.center,

          // margin(lề):để tạo khooangr chống sung quanh
          margin: const EdgeInsets.all(20),

          //padding(phần đệm): dùng để tạo khoảng cách tù đường viền
          // của vùng chứa vói các phần tử con của nó
          padding: const EdgeInsets.all(30),

          //decoration(Trang trí):Thuộc tính trang trí được sử dụng để trang trí hộp

          //decoration: BoxDecoration(
          //  border: Border.all(color: Colors.black, width: 3),
          //),

          //Transform: Thuộc tính này của container giúp chúng ta xoay container.
          //Chúng ta có thể xoay thùng chứa theo bất kỳ trục nào,
          // ở đây chúng ta đang xoay theo trục z.
          transform: Matrix4.rotationZ(0.1),

          //child vùng chứacó thể lưu trữ các con của nó
          // lớp con có thể là bất kỳ widget nào đó
          child: const Text("Hello! i am inside a container!",
              style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}
/**
 *  Container({Key key,
           AlignmentGeometry alignment,      Căn chỉnhCăn chỉnh hình học,
           EdgeInsetsGeometry padding, 
           Color color, 
           Decoration decoration, 
           Decoration foregroundDecoration,   Trang trí tiền cảnh,
           double width, 
           double height, 
           BoxConstraints constraints,        Các ràng buộc của BoxConstraints,
           EdgeInsetsGeometry margin, 
           Matrix4 transform,                 Biến đổi ma trận4,
           Widget child,                      
           Clip clipBehavior: Clip.none});
 */