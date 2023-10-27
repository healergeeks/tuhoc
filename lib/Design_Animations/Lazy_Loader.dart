import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

/**Dòng mã sau có thể được thêm vào tệp main.dart để nhập phần phụ thuộc 
 * lazy_load_scrollview: 
 * 
 * import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';*/

/**Thêm phần phụ thuộc vào tệp pubspec.yaml
 * dependencies:
  flutter:
    sdk: flutter
  lazy_load_scrollview: ^1.1.0
 */
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
// Widget này là thư mục gốc của ứng dụng của bạn.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Example',
      home: new MyHomePage(title: 'NguyenManhDung'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  //MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> data = [];
  int currentLength = 0;

  final int increment = 10;
  bool isLoading = false;

  @override
  /**initState()là một phương thức được gọi một lần khi tiện ích 
   * trạng thái được chèn vào Lazy Loader(cây tiện ích.) */
  void initState() {
    _loadMore();
    super.initState(); //  được chèn tiếp thì super.initState() gọi lại chính nó
  }

  Future _loadMore() async {
    //setState() tải trạng thái của trang
    setState(() {
      isLoading = true; //tải trang mới
    }); //isLoading = false; tiếp tục tải trang và được thêm nội dung mới vào cuối trang

    // Thêm độ trễ nhân tạo   Duration(khoảng thời gian)  seconds(giây)
    await new Future.delayed(const Duration(seconds: 1));
    for (var i = currentLength; i <= currentLength + increment; i++) {
      data.add(i);
    }
    setState(() {
      isLoading = false;
      currentLength = data.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.green,
      ),
      body: LazyLoadScrollView(
        isLoading: isLoading,
        onEndOfPage: () => _loadMore(),
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, position) {
            return DemoItem(position);
          },
        ),
      ),
    );
  }
}

class DemoItem extends StatelessWidget {
  final int position;

  const DemoItem(
    this.position, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  color: Colors.deepOrange,
                  height: 40.0,
                  width: 40.0,
                ),
                SizedBox(width: 8.0),
                Text("Item $position"),
              ],
            ),
            Text("GeeksforGeeks.org was created with a goal "
                "in mind to provide well written, well "
                "thought and well explained solutions for selected"
                " questions. The core team of five super geeks"
                " constituting of technology lovers and computer"
                " science enthusiasts have been constantly working"
                " in this direction ."),
          ],
        ),
      ),
    );
  }
}
