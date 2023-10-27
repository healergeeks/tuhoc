import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

void main() {
  runApp(const MaterialApp(home: PhysicsCardDragDemo()));
}

class PhysicsCardDragDemo extends StatelessWidget {
  const PhysicsCardDragDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      //DraggableCard() thẻ có thể kéo thả
      body: const DraggableCard(
        //child: FlutterLogo() : tiện ích : với logoFlutter được thực hiện
        child: FlutterLogo(
          size: 128,
        ),
      ),
    );
  }
}

/// Thẻ có thể kéo sẽ di chuyển trở lại [Alignment.center] khi nó được
/// phát hành.
class DraggableCard extends StatefulWidget {
  const DraggableCard({required this.child, super.key});

  final Widget child;

  @override // createState() trạng thái được thay đổi
  State<DraggableCard> createState() => _DraggableCardState();
}

class _DraggableCardState extends State<DraggableCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  /// Căn chỉnh thẻ khi nó được kéo hoặc hoạt hình.
  ///
  /// Trong khi thẻ đang được kéo, giá trị này được đặt thành các giá trị được tính toán
  /// trong lệnh gọi lại GestureDetector onPanUpdate. Nếu hoạt ảnh đang chạy,
  /// giá trị này được đặt thành giá trị của [_animation].
  Alignment _dragAlignment = Alignment.center;

  late Animation<Alignment> _animation;

  /// Tính toán và chạy [SpringSimulation].
  void _runAnimation(Offset pixelsPerSecond, Size size) {
    _animation = _controller.drive(
      AlignmentTween(
        begin: _dragAlignment,
        end: Alignment.center,
      ),
    );
    // Tính vận tốc tương ứng với khoảng đơn vị, [0,1],
    // được sử dụng bởi bộ điều khiển hoạt ảnh.
    final unitsPerSecondX = pixelsPerSecond.dx / size.width;
    final unitsPerSecondY = pixelsPerSecond.dy / size.height;
    final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
    final unitVelocity = unitsPerSecond.distance;

    const spring = SpringDescription(
      mass: 30,
      stiffness: 1,
      damping: 1,
    );

    final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);

    _controller.animateWith(simulation);
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);

    _controller.addListener(() {
      setState(() {
        _dragAlignment = _animation.value;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //GestureDetector thực hiện các tác khi lệnh được gọi, các lệnh gọi lại.
    return GestureDetector(
      /*Tiện ích GestureDetector
      nhấn 
      onPanDown 
      onPanUpdate
      onPanEnd 
      */
      //onPanDown ảnh lức đầu chưa là gì cả sẽ ở vị trí đầu tiên
      onPanDown: (details) {
        _controller.stop();
      },
      //onPanUpdate được cập nhập theo tay nhấn kéo theo pi
      onPanUpdate: (details) {
        //setState() tải trạng thái của trang
        setState(() {
          //Alignment như để căn chỉnh
          _dragAlignment += Alignment(
            details.delta.dx / (size.width / 2),
            details.delta.dy / (size.height / 2),
          );
        });
      },
      //onPanEnd khi thả tay ra thì ảnh về vị trí cũ
      onPanEnd: (details) {
        _runAnimation(details.velocity.pixelsPerSecond, size);
      },
      child: Align(
        //sử dụng trường _dragAlignment để Căn chỉnh tiện ích như hiển thị như lúc đầu
        alignment: _dragAlignment,
        child: Card(
          child: widget.child,
        ),
      ),
    );
  }
}
