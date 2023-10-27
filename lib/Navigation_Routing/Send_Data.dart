import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/*Đầu tiên, bạn cần một cách đơn giản để biểu diễn việc cần làm. 
Trong ví dụ này, hãy tạo một lớp chứa hai phần dữ liệu: tiêu đề và mô tả. */
class Task {
  final String task_name;
  final String description;

  Task(this.task_name, this.description);
}

void main() {
  runApp(MaterialApp(
    title: 'Passing Data',
    home: TodosScreen(
      // tạo danh sách
      tasks: List.generate(
        10,
        (i) => Task(
          'Nhiệm vụ $i',
          'Mô tả công việc $i',
        ),
      ),
    ),
  ));
}

//Chúng tôi chuyển vào ListView.builderphần nội dung của tiện ích mà chúng tôi đang quay lại build().
//Thao tác này sẽ hiển thị danh sách trên màn hình để bạn bắt đầu!
// Màn hình chính
class TodosScreen extends StatelessWidget {
  final List<Task> tasks;

  TodosScreen({Key? key, required this.tasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nguyen Quang Manh'),
        backgroundColor: Colors.green,
      ),
      //Hiển thị danh sách việc cần làm bằng ListView
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          /*Để ghi lại thao tác nhấn của người dùng vào TodosScreen, 
          hãy viết onTap() lệnh gọi lại cho ListTiletiện ích. Trong onTap()cuộc gọi lại, 
          hãy sử dụng Navigator.push()phương thức này. */
          return ListTile(
            title: Text(tasks[index].task_name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(task: tasks[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

//màn hình chi tiết để hiển thị thông tin về việc cần làm
// màn hình chi tiết
class DetailScreen extends StatelessWidget {
  final Task task;
  DetailScreen({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(task.task_name),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(task.description),
      ),
    );
  }
}
