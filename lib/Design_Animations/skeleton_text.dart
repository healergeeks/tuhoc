import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
// gốc của ứng dụng
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skeleton Text',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("GeeksForGeeks"),
          backgroundColor: Colors.green,
        ),
        // danh sách các phần tử trong phần thân
        body: ListView.builder(
            /**Skeleton_text được sử dụng để dễ dàng triển khai hoạt ảnh tải văn bản khung xương. 
           * Ứng dụng chính của nó trong ứng dụng rung là đảm bảo với người dùng 
           * rằng máy chủ đang hoạt động nhưng chạy chậm nhưng cuối cùng nội dung sẽ tải. 
           * Nó cũng cải thiện giao diện người dùng nếu kết nối người dùng chậm. */

            /** cần khai báo skeleton_text để sử dụng ở tệp pubspec.yaml 
             * dependencies:
                flutter:
                  sdk: flutter
                skeleton_text: ^3.0.1
            */
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: Colors.white70),
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,

                      // SkeletonAnimation method
                      children: <Widget>[
                        /**SkeletonAnimation được cung cấp bởi gói Skeleton_text để hiển thị văn bản khung */
                        SkeletonAnimation(
                          child: Container(
                            width: 70.0,
                            height: 70.0,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, bottom: 5.0),
                              child: SkeletonAnimation(
                                child: Container(
                                  height: 15,
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Colors.grey[300]),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5.0),
                                child: SkeletonAnimation(
                                  child: Container(
                                    width: 60,
                                    height: 13,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: Colors.grey[300]),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
