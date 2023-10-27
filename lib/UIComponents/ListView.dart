import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'NguyenManhDUng';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: Colors.green,
        ),
        body: Container(
          // EdgeInsets là phần đệm
          //symmetric(vertical: 20.0)  20.0pixel
          //từ hai tham số horizontal và vertical. Điều này có nghĩa là:
          // left = right = horizontal
          // top = bottom = vertical
          margin: EdgeInsets.symmetric(vertical: 20.0),
          //xắc định chiều cao cảu thẻ body
          height: 550.0,
          child: ListView(
            // có thể có hai loại danh sách, đó là danh sách ngang và danh sách dọc.
            //Cả hai danh sách này đều được tạo bằng cách sử dụng hàm tạo ListView
            //và gán tham số ScrollDirection .
            //Theo mặc định, tham số hướng cuộn là dọc đối với danh sách dọc nhưng
            //nó có thể bị ghi đè bằng cách chuyển tham số ngang cho danh sách đó.
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                // định nghĩa chiều daaif chiều rộng của một listView
                height: 180.0,
                width: 240.0,
                //tạo một khối( một chiếc hộp.)
                //BoxDecoration mô tả cách vễ hộp
                /**
                 * const BoxDecoration(
                    {Color? color,
                    DecorationImage? image,
                    BoxBorder? border,
                    BorderRadiusGeometry? borderRadius,
                    List<BoxShadow>? boxShadow,
                    Gradient? gradient,
                    BlendMode? backgroundBlendMode,
                    BoxShape shape: BoxShape.rectangle}
                    )
              BackgroundBlendMode: Thuộc tính này lấy enum BlendMode làm đối tượng cho tham số này. Nó áp dụng hiệu ứng hòa trộn cho màu nền hoặc độ dốc.
              border: Tham số border lấy lớp BoxBorder làm đối tượng để vẽ đường viền xung quanh hộp.
              borderRadius: Thuộc tính này lấy lớp BorderRadiusGeometry làm đối tượng, từ đó thêm các đường cong xung quanh các góc viền nếu hình hộp là hình chữ nhật.
              boxShadow: Thuộc tính này chứa danh sách tiện ích BoxShadow làm đối tượng. Nó tạo ra một cái bóng trên hộp.
              color:  Thuộc tính này lấy lớp Màu làm đối tượng để tạo màu nền cho tiện ích BoxDecoration .
              gradient: Thuộc tính này lấy lớp gradient làm đối tượng để áp dụng tô màu gradient bên trong hộp.
              image: Thuộc tính này thêm một hình ảnh trên nền lấy lớp DecorImage làm đối tượng.
              padding: Thuộc tính này lấy lớp EdgeInsetsGeometry làm đối tượng để thêm khoảng trống xung quanh nội dung bên trong hộp.
              shape: Thuộc tính này lấy BoxShape làm đối tượng để quyết định hình dạng của hộp.
                 */
                decoration: BoxDecoration(
                  // image: gọi dến hình ảnh
                  // DecorationImage như chuyển dưới dạng file thành hình ảnh
                  image: DecorationImage(
                    // AssetImage nạp ảnh từ pubspec.yaml đến đây
                    image: AssetImage('assets/images/hinh_1.jpg'),
                    /*
            fit: Thuộc tính này thuộc loại BoxFit . 
            Nó được sử dụng để mô tả cách một chiếc hộp được ghi vào một chiếc hộp khác. 
            Nó phục vụ cho ngữ nghĩa kích thước. Bây giờ, chúng ta sẽ thấy các thuộc tính của nó:

            contain: Sử dụng thuộc tính này, chúng tôi chứa toàn bộ nguồn trong hộp đích, bất kể nó có lớn đến đâu.
            cover: Nó làm cho nguồn càng nhỏ càng tốt, trong khi vẫn bao phủ toàn bộ hộp mục tiêu.
            fill: Nó lấp đầy toàn bộ hộp mục tiêu, ảnh hưởng đến tỷ lệ khung hình của nguồn.
            fitHeight: Nó đảm bảo rằng chiều cao đầy đủ của nguồn được hiển thị, ngay cả khi nó tràn hộp mục tiêu theo chiều ngang.
            fitWidth: Nó đảm bảo rằng toàn bộ chiều rộng của nguồn được hiển thị, ngay cả khi nó tràn hộp đích theo chiều dọc.
            none: Nó căn chỉnh nguồn bên trong hộp đích và loại bỏ bất kỳ phần bổ sung nào khỏi nguồn, nếu có, vì nó không thay đổi kích thước hình ảnh.
                     */
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
              Container(
                height: 180.0,
                width: 240.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/hinh_2.jpg'),
                    fit: BoxFit.fill, // nó lấp đầy hộp ngoài cùng bao hàm nó
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
              Container(
                height: 140.0,
                width: 240.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/hinh_3.jpg'),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
              Container(
                height: 180.0,
                width: 240.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/hinh_4.jpg'),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
              Container(
                height: 180.0,
                width: 240.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/hinh_5.jpg'),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
