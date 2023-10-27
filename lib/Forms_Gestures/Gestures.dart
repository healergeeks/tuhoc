import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Gesture Demo';

    return const MaterialApp(
      title: title,
      home: MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Center(
        child: MyButton(),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    // GestureDetector bao bọc nút.
    return GestureDetector(
      // Khi trẻ được chạm vào, hãy hiển thị thanh đồ ăn nhẹ.
      onTap: () {
        const snackBar = SnackBar(content: Text('Tap'));

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      // Nút tùy chỉnh
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text('My Button'),
      ),
    );
  }
}
/**Một số cử chỉ được sử dụng rộng rãi được đề cập ở đây:
Tap(Nhấn): Chạm vào bề mặt thiết bị bằng đầu ngón tay trong một khoảng 
      thời gian ngắn và cuối cùng thả đầu ngón tay ra.
Double Tap: Chạm 2 lần trong thời gian ngắn.
Drag(Kéo): Dùng đầu ngón tay chạm vào bề mặt thiết bị rồi di chuyển đầu ngón 
      tay một cách đều đặn và cuối cùng thả đầu ngón tay ra.
Flick(Vuốt): Tương tự như kéo nhưng thực hiện theo cách nhanh hơn.
Pinch: Chụm bề mặt thiết bị bằng hai ngón tay.
Zoom(Thu phóng): Ngược lại với việc chụm lại.
Panning(Xoay): Chạm vào bề mặt thiết bị bằng đầu ngón tay và di chuyển thiết bị 
      theo hướng mong muốn mà không nhả đầu ngón tay. */

/**Tap
      onTapDown
      onTapUp
      onTap
      onTapCancel
  Double tap
      onDoubleTap
  Long press
      onLongPress
  Vertical drag
      onVerticalDragStart
      onVerticalDragUpdate
      onVerticalDragEnd
  Horizontal drag
      onHorizontalDragStart
      onHorizontalDragUpdate
      onHorizontalDragEnd
  Pan
      onPanStart
      onPanUpdate
      onPanEnd */
/**Flutter hỗ trợ các widget Listener là cơ chế phát hiện cử chỉ cấp thấp. 
 * Nó phát hiện sự tương tác của người dùng và gửi một trong 
 * các sự kiện tương ứng được đề cập dưới đây:
        PointerDownEvent    Con trỏXuốngSự kiện
        PointerMoveEvent    Con TrỏDi ChuyểnSự Kiện
        PointerUpEvent      Con trỏLênSự kiện
        PointerCancelEvent  Con TrỏHủySự Kiện

Flutter cũng có các widget để thực hiện các cử chỉ cụ thể cũng như nâng cao. 
  Các vật dụng này như sau:
Dismissible(Loại bỏ): Hỗ trợ cử chỉ vuốt để chấm dứt tiện ích.
Draggable(Có thể kéo): Hỗ trợ cử chỉ kéo để làm cho tiện ích di động.
LongPressDraggable: Nếu tiện ích gốc có thể kéo được, 
    nó sẽ hỗ trợ cử chỉ kéo để di chuyển tiện ích con.
DragTarget: Chấp nhận mọi tiện ích có thể kéo được
IgnorePointer: Khi được sử dụng, nó sẽ ẩn tiện ích và các 
        tiện ích con tương ứng của nó khỏi quá trình phát hiện cử chỉ.
AbsorbPointer(Hấp thụ con trỏ): Tự dừng quá trình phát hiện cử chỉ để 
        tránh gửi hành động trên các tiện ích chồng chéo.
Scrollable(Có thể cuộn): Làm cho nội dung có sẵn bên trong tiện ích có thể cuộn được. */