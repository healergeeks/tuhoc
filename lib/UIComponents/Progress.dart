import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Để xoá chế độ Debug này, bạn chỉ việc sử dụng câu lệnh:
      // hay chữ băng rôm đỏ góc trên màm hình
      debugShowCheckedModeBanner: false,
      home: Loader(),
    );
  }
}

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nguyen Manh DUng'),
        backgroundColor: Color(0xFF4CAF50),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /**Progress(Chỉ báo tiến trình) trong bất kỳ ứng dụng nào hiển thị thời gian cần 
             * thiết để hoàn thành một số tác vụ như tải xuống, cài đặt, tải lên, 
             * truyền tệp, v.v. Điều này cho thấy tiến trình của một tác vụ hoặc thời 
             * gian hiển thị độ dài của các quy trình. */
            /**CircularProgressIndicator là một tiện ích hiển thị tiến trình dọc 
        theo một vòng tròn. Đó là một thanh tiến trình hình tròn quay tròn 
        để cho biết ứng dụng đang bận hoặc đang chờ. */
            CircularProgressIndicator(
              backgroundColor: Colors.redAccent,
              valueColor: AlwaysStoppedAnimation(Colors.green),
              strokeWidth: 10,
            ),
            SizedBox(
              height: 15,
            ),
            /**: LinearProgressIndicator còn được gọi là thanh tiến trình là 
           một tiện ích hiển thị tiến trình theo hướng tuyến tính hoặc dọc 
           theo một đường để cho biết rằng ứng dụng đang được tiến hành. */
            LinearProgressIndicator(
              backgroundColor: Colors.redAccent,
              valueColor: AlwaysStoppedAnimation(Colors.green),
              minHeight: 20,
            )
          ],
        ),
      ),
    );
  }
}
/**Indeterminate(Không xác định): Chỉ báo tiến trình không xác định là chỉ báo không hiển thị 
 * giá trị cụ thể tại bất kỳ thời điểm nào và chỉ cho biết rằng tiến trình đang 
 * được thực hiện.  
 * 
 * Determinate(Xác định): Chỉ báo tiến trình xác định là chỉ báo có giá trị cụ thể tại mỗi thời điểm. 
 * Nó cũng cho biết mức độ tiến bộ đã được hoàn thành.*/

 /**backgroundColor: Thuộc tính này được sử dụng để đặt màu nền của 
trình tải tuyến tính và trình tải quay tròn trong thanh tiến trình.
    StrokeWidth: Thuộc tính này chỉ định chiều rộng của đường được sử dụng
để vẽ hình tròn trong CircleProgressIndicator .
    minHeight: Đó là chiều cao tối thiểu của đường được sử dụng 
để vẽ chỉ báo trong LinearProgressIndicator hay nói cách khác, 
nó được sử dụng để xác định độ dày của đường trong chỉ báo.
    valueColor: Nó được sử dụng để xác định giá trị 
của chỉ báo tiến trình dưới dạng giá trị hoạt hình. 
Thuộc tính valueColor bao gồm các điểm nổi bật của nhiệm vụ đã hoàn thành có giá trị.
    AlwaysStoppedAnimation: Nó được sử dụng để chỉ định 
màu không đổi trong thuộc tính valueColor .
    value: Thuộc tính giá trị được sử dụng để phân biệt giữa thanh tiến trình 
xác định và không xác định. Nếu thuộc tính giá trị được đặt là null thì 
chỉ báo tiến trình không xác định, có nghĩa là nó sẽ hiển thị hoạt ảnh được 
xác định trước trên chỉ báo cùng với chuyển động của nó mà không cho biết mức
 độ hoàn thành của tiến trình. Nếu được đặt là khác null thì nó sẽ hiển thị mức 
 độ tiến triển đang được thực hiện tại một thời điểm cụ thể. Giá trị 0,0 cho biết 
 tiến trình mới bắt đầu và giá trị 1,0 cho biết tiến trình đã hoàn thành.
 */
