import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

// Tiện ích này là
// thư mục gốc của ứng dụng của bạn.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClipOval',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePAGE(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePAGE extends StatefulWidget {
  const MyHomePAGE({Key? key}) : super(key: key);

  @override
// ignore: library_private_types_in_public_api
  _MyHomePAGEState createState() => _MyHomePAGEState();
}

class _MyHomePAGEState extends State<MyHomePAGE> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GeeksforGeeks'),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: RichText(
        /** RichText được sử dụng để hiển thị văn bản sử dụng nhiều kiểu khác nhau. 
            Văn bản hiển thị được mô tả bằng cách sử dụng một cây đối tượng TextSpan,
            mỗi đối tượng có kiểu liên kết riêng được sử dụng cho cây con đó. 
            Tùy thuộc vào các ràng buộc về bố cục, văn bản có thể ngắt thành nhiều dòng 
            hoặc tất cả có thể được hiển thị trên cùng một dòng. */
        // Kiểm soát tràn hình ảnh
        overflow: TextOverflow.clip,

        // Kiểm soát cách văn bản được căn chỉnh theo chiều ngang
        textAlign: TextAlign.end,

        // Kiểm soát hướng văn bản
        textDirection: TextDirection.rtl,

        // Liệu văn bản có bị ngắt khi ngắt dòng mềm không
        softWrap: true,

        // Số dòng tối đa để văn bản trải dài
        maxLines: 1,

        // Số pixel phông chữ cho mỗi pixel logic
        textScaleFactor: 1,
        text: TextSpan(
          text: 'Hello ',
          style: DefaultTextStyle.of(context).style,
          children: const <TextSpan>[
            TextSpan(
                text: 'Geeks', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      )),
      backgroundColor: Colors.lightBlue[50],
    );
  }
}

class MyClip extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return const Rect.fromLTWH(0, 0, 100, 100);
  }

  @override
  bool shouldReclip(oldClipper) {
    return false;
  }
}
/**
 * RichText(
{Key key,
  @required InlineSpan text,
  TextAlign textAlign: TextAlign.start, 
  TextDirection textDirection, 
  bool softWrap: true, 
  TextOverflow overflow: 
  TextOverflow.clip, 
  double textScaleFactor: 1.0, 
  int maxLines, 
  Locale locale, 
  StrutStyle strutStyle, 
  TextWidthBasis textWidthBasis: TextWidthBasis.parent, 
  TextHeightBehavior textHeightBehavior,

 children: Các widget ở dưới widget này ở dạng cây.
hashCode: Mã băm cho đối tượng này.
key: Kiểm soát cách một tiện ích thay thế một tiện ích khác trong cây.
RuntimeType: Thể hiện kiểu thời gian chạy của đối tượng.
text: Văn bản hiển thị trong widget này.
textAlign: Cách căn chỉnh văn bản theo chiều ngang.
local: Thuộc tính này lấy lớp Locale làm đối tượng. Nó kiểm soát phông chữ được sử dụng cho văn bản tùy thuộc vào ngôn ngữ được sử dụng.
maxLines: Thuộc tính maxLines lấy giá trị int làm đối tượng. Nó kiểm soát số dòng tối đa có thể có để văn bản mở rộng và ngắt dòng.
overflow: TextOverflow enum là đối tượng được cấp cho lớp của nó, nó kiểm soát văn bản trong trường hợp tràn.
softWrap: Thuộc tính này lấy giá trị boolean làm đối tượng. Nếu nó được đặt thành sai thì các rãnh trong văn bản sẽ trở nên rộng hơn.
textDirection: Thuộc tính này lấy lớp TextDirection làm đối tượng để quyết định hướng của văn bản. Nó có thể là từ trái sang phải hoặc từ phải sang trái.
textHightBehaviour: Lớp TextHeightBehavior là đối tượng được gán cho thuộc tính này. Nó kiểm soát cách văn bản sẽ được đánh dấu.
textScaleFactor: Thuộc tính này được lấy giá trị kép làm đối tượng để xác định kích thước tương đối của phông chữ.
textWidthBasis: TextWidthBasis enum là đối tượng của thuộc tính này. Nó kiểm soát độ rộng của một dòng văn bản đang được đo.
 */