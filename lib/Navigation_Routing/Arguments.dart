import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Để đăng ký tiện ích mới được tạo vào bảng tuyến đường bằng
      routes: {
        ExtractArgumentsScreen.routeName: (context) =>
            const ExtractArgumentsScreen(),
      },
      // Cung cấp một hàm để xử lý các tuyến đường được đặt tên.
      // Sử dụng hàm này để xác định tên được đặt tên
      // tuyến đường đang được đẩy và tạo tuyến đường chính xác
      // Màn hình.
      onGenerateRoute: (settings) {
        // Nếu bạn đẩy tuyến PassArguments
        if (settings.name == PassArgumentsScreen.routeName) {
          // Truyền các đối số cho đúng
          // kiểu: ScreenArgument.
          final args = settings.arguments as ScreenArguments;

          // Sau đó, trích xuất dữ liệu cần thiết từ
          // các đối số và truyền dữ liệu tới
          // đúng màn hình.
          return MaterialPageRoute(
            builder: (context) {
              return PassArgumentsScreen(
                title: args.title,
                message: args.message,
              );
            },
          );
        }
        // Mã chỉ hỗ trợ
        // PassArgumentsScreen.routeName ngay bây giờ.
        // Các giá trị khác cần được triển khai nếu chúng ta
        // thêm chúng. Khẳng định ở đây sẽ giúp nhắc nhở
        // chúng tôi ở vị trí cao hơn trong ngăn xếp cuộc gọi, vì
        // xác nhận này nếu không sẽ kích hoạt ở đâu đó
        // trong khuôn khổ.
        assert(false, 'Cần triển khai ${settings.name}');
        return null;
      },
      title: 'Điều hướng với các đối số',
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Màn hình chính'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Nút điều hướng đến tuyến đường được đặt tên.
            // Route được đặt tên trích xuất các đối số
            // bởi bản thân.
            ElevatedButton(
              onPressed: () {
                // Khi người dùng nhấn vào nút,
                // điều hướng đến một tuyến đường được đặt tên và
                // cung cấp các đối số dưới dạng tùy chọn
                // tham số.
                //trích xuất titlevà messagetừ các đối số này.
                Navigator.pushNamed(
                  context,
                  ExtractArgumentsScreen.routeName,
                  arguments: ScreenArguments(
                    'Màn hình trích xuất đối số',
                    'Thông báo này được trích xuất trong phương thức xây dựng.',
                  ),
                );
              },
              child:
                  const Text('Điều hướng đến màn hình trích xuất các đối số'),
            ),
            // Nút điều hướng đến tuyến đường được đặt tên.
            // Đối với tuyến đường này, trích xuất các đối số trong
            // hàm onGenerateRoute và truyền chúng
            // ra màn hình.
            ElevatedButton(
              onPressed: () {
                // Khi người dùng nhấn vào nút, hãy điều hướng
                // đến một tuyến đường được đặt tên và cung cấp các đối số
                // dưới dạng tham số tùy chọn.
                Navigator.pushNamed(
                  context,
                  PassArgumentsScreen.routeName,
                  arguments: ScreenArguments(
                    'Màn hình chấp nhận đối số',
                    'Thông báo này được trích xuất trong onGenerateRoute '
                        'chức năng.',
                  ),
                );
              },
              child: const Text('Điều hướng đến một cái tên chấp nhận đối số'),
            ),
          ],
        ),
      ),
    );
  }
}

// Một Widget trích xuất các đối số cần thiết từ
// ModalRoute.
class ExtractArgumentsScreen extends StatelessWidget {
  const ExtractArgumentsScreen({super.key});

  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    // Trích xuất các đối số từ ModalRoute hiện tại
    // cài đặt và truyền chúng dưới dạng ScreenArguments.
    //trả về tuyến đường hiện tại với các đối số.
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Text(args.message),
      ),
    );
  }
}

// Một Widget chấp nhận các đối số cần thiết thông qua
// người xây dựng.
class PassArgumentsScreen extends StatelessWidget {
  static const routeName = '/passArguments';

  final String title;
  final String message;

  // Widget này chấp nhận các đối số làm hàm tạo
  // thông số. Nó không trích xuất các đối số từ
  // ModalRoute.
  //
  // Các đối số được trích xuất bởi onGenerateRoute
  // hàm được cung cấp cho widget MaterialApp.
  const PassArgumentsScreen({
    super.key,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(message),
      ),
    );
  }
}

// Bạn có thể truyền bất kỳ đối tượng nào vào tham số đối số.
// Trong ví dụ này, tạo một lớp chứa cả hai
// tiêu đề và thông điệp có thể tùy chỉnh.
class ScreenArguments {
  //các đối số bạn cần chuyển sang tuyến đường mới.tạo một lớp lưu trữ thông tin này.
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}

/*
Công thức này trình bày cách chuyển các đối số cho một tuyến đường được đặt tên và 
đọc các đối số bằng cách ModalRoute.of() sử onGenerateRoute()dụng các bước sau:
    Xác định các đối số bạn cần chuyển.
    Tạo một tiện ích trích xuất các đối số.
    Đăng ký widget trong routesbảng.
    Điều hướng đến tiện ích.
 */