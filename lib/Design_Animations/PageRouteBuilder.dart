import 'package:flutter/material.dart';

main() {
  runApp(const MaterialApp(
    home: Homepage(),
  ));
}

/**Các tuyến chỉ đơn giản là các Trang trong ứng dụng Flutter. 
 * Một ứng dụng thường cần phải di chuyển từ trang này sang trang khác. 
 * Nhưng để làm cho những chuyển đổi này mượt mà hơn, có thể sử dụng Ảnh động. 
 * Những hoạt ảnh này có thể được sử dụng để uốn cong hoặc chuyển đổi 
 * đối tượng Hoạt hình của lớp PageRouteBuilder để thay đổi hoạt ảnh chuyển tiếp. */
class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GeeksForGeeks'),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          // điều hướng đến một trang Page 2
          Navigator.of(context).push(_createRoute());
        },
        child: const Text('Go to Page 2'),
      )

          // RaisedButton không được dùng nữa
          // Thay vào đó chúng ta nên sử dụng ElevatedButton

          // child: RaisedButton(
          // child: const Text('Go to Page 2'),
          // onPressed: () {
          //	 Navigator.of(context).push(_createRoute());
          // },
          // ),

          ),
    );
  }
}
/**Để tạo chuyển tiếp tuyến trang tùy chỉnh, công thức này sử dụng các bước sau:
    Thiết lập PageRouteBuilder
    Tạo mộtTween
    Thêm mộtAnimatedWidget
    Sử dụng mộtCurveTween
    Kết hợp cả hai Tweens
*/

Route _createRoute() {
  /**PageRouteBuildercó hai lệnh gọi lại, một để xây dựng nội dung của tuyến đường 
     * (pageBuilder) và một để xây dựng quá trình chuyển đổi của tuyến đường (transitionsBuilder). */
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Page2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = const Offset(0.0, 1.0);
      var end = Offset.zero;
      /**Flutter cung cấp một loạt các đường cong nới lỏng để điều chỉnh 
       * tốc độ của hoạt ảnh theo thời gian. Lớp này Curvescung cấp một tập hợp 
       * các đường cong thường được sử dụng được xác định trước. 
       * Ví dụ: Curves.easeOut làm cho hoạt ảnh bắt đầu nhanh và kết thúc chậm. 
       *  var curve = Curves.ease;
          var curveTween = CurveTween(curve: curve);*/
      var curve = Curves.ease;
      /**Tween()việc tạo trạng thái trung gian giữa hai điểm cuối, trạng thái bắt đầu và trạng thái kết thúc.  */
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      /**Để kết hợp tween, sử dụng chain()  */
      /**AnimatedWidget có thuộc tính trạng thái của nó khi giá trị hoạt ảnh thay đổi. 
       * Bạn có thể tạo một cái như dưới đây: */
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

// hienthi trang hai
class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Page 2'),
      ),
    );
  }
}
