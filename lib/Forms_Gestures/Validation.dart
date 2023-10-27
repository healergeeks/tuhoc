import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Validation Demo';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

// Tạo tiện ích Biểu mẫu.
/**Để làm cho ứng dụng an toàn và dễ sử dụng, hãy kiểm tra xem thông tin người dùng 
 * cung cấp có hợp lệ hay không. Nếu người dùng đã điền chính xác vào biểu mẫu, 
 * hãy xử lý thông tin. Nếu người dùng gửi thông tin không chính xác, 
 * hãy hiển thị thông báo lỗi thân thiện để họ biết điều gì đã xảy ra.b */
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Tạo một lớp State tương ứng.
// Lớp này chứa dữ liệu liên quan đến biểu mẫu.
class MyCustomFormState extends State<MyCustomForm> {
  // Tạo khóa chung xác định duy nhất tiện ích Biểu mẫu
  // và cho phép xác thực biểu mẫu.
  //
  // Lưu ý: Đây là GlobalKey<FormState>,
  // không phải GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Xây dựng tiện ích Biểu mẫu bằng cách sử dụng _formKey đã tạo ở trên.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            // hay để nhập văn bản
            // Trình xác nhận nhận được văn bản mà người dùng đã nhập.
            validator: (value) {
              // nếu văn bản chưa được nhập mà đã nhấn nút Submit thì hàm if sẽ chạy hiển thị 'Vui lòng nhập một số văn bản'
              if (value == null || value.isEmpty) {
                return 'Vui lòng nhập một số văn bản';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: () {
                // Xác thực trả về true nếu biểu mẫu hợp lệ hoặc sai nếu không.
                if (_formKey.currentState!.validate()) {
                  // Nếu biểu mẫu hợp lệ, hiển thị một thanh thông tin nhanh. Trong thế giới thực,
                  // bạn thường gọi máy chủ hoặc lưu thông tin vào cơ sở dữ liệu.
                  // Form.of()phương thức này để truy cập biểu mẫu trong các tiện ích con lồng nhau.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Tài liệu đã qua xử lý')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
