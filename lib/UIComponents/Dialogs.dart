import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyStatelessApp());
}

class MyStatelessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dialog Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StatelessWidgetDemo(),
    );
  }
}

class StatelessWidgetDemo extends StatefulWidget {
  @override
  _StatelessWidgetDemoState createState() => _StatelessWidgetDemoState();
}

class _StatelessWidgetDemoState extends State<StatelessWidgetDemo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Dialog Demo'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      _showMaterialDialog();
                    },
                    child: Text('Hiển thị hộp thoại Material'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _showCupertinoDialog();
                    },
                    child: Text('Hiển thị hộp thoại Cupertino'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _showSimpleDialog();
                    },
                    child: Text('Hiển thị hộp thoại đơn giản'),
                  )
                ],
              ),
            )));
  }

  void _showMaterialDialog() {
    /**
     * Dialog(Hộp thoại) là một loại tiện ích xuất hiện trên cửa sổ hoặc màn hình chứa 
     * bất kỳ thông tin quan trọng nào hoặc có thể yêu cầu bất kỳ quyết định nào. 
     * Chúng tôi sử dụng hộp thoại cho một loại điều kiện khác, 
     * vì hạn chế như thông báo cảnh báo hoặc thông báo đơn giản trong đó các 
     * tùy chọn khác nhau được hiển thị hoặc chúng tôi cũng có thể tạo một hộp thoại 
     * có thể sử dụng được làm tab để hiển thị hộp thoại.
     */
    /**
     * showDialog được sử dụng để thay đổi màn hình hiện tại của ứng dụng của chúng tôi để 
     * hiển thị cửa sổ bật lên hộp thoại. 
     * Bạn phải gọi trước khi hộp thoại bật lên.  
     * chúng ta có thể bật lên các loại hộp thoại khác nhau 
     * như AlertDialog và SimpleDialog dưới dạng tiện ích con.
     */
    /**
     * Future<T> showDialog <T>(
        {
              @required BuildContext context,
              WidgetBuilder builder,
              bool barrierDismissible: true,
              Color barrierColor,
              bool useSafeArea: true,
              bool useRootNavigator: true,
              RouteSettings routeSettings,
              @Deprecated(Nó trả về đứa trẻ từ việc đóng cửa được cung cấp cho lớp xây dựng) Widget child
        }
      )

      Builder: Nó trả về đối số con thay vì tạo đối số con.
      Barriercolor: Nó xác định màu rào cản phương thức làm tối mọi thứ trong hộp thoại.
      useSafeArea: Nó đảm bảo rằng hộp thoại chỉ sử dụng vùng an toàn của màn hình mà không chồng lên vùng màn hình.
     */
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            /** AlertDialog Hộp thoại cảnh báo
            Được sử dụng để hiển thị bất kỳ loại thông báo cảnh báo nào.
            Chúng tôi có thể cung cấp tùy chọn phản ứng với cửa sổ bật lên cảnh báo 
            như nút chấp nhận hoặc nút từ chối.
          Title: Chúng tôi luôn khuyên bạn nên đặt tiêu đề hộp thoại càng ngắn càng tốt. Nó sẽ dễ hiểu đối với người dùng.
          Action: Nó được sử dụng để hiển thị nội dung của hành động nào phải thực hiện.
          Content: Nội dung của tiện ích AlertDialog được xác định bởi nội dung.
          Shape: Nó được sử dụng để xác định hình dạng của hộp thoại của chúng ta cho dù đó là hình tròn, cong, v.v. */
            title: Text('Material Dialog'),
            content: Text('Hey! I am Coflutter!'),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    _dismissDialog();
                  },
                  child: Text('Close')),
              TextButton(
                onPressed: () {
                  print('HelloWorld!');
                  _dismissDialog();
                },
                child: Text('HelloWorld!'),
              )
            ],
          );
        });
  }

  _dismissDialog() {
    Navigator.pop(context);
  }

  void _showCupertinoDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            /**
             * Từ khóa cho chủ đề/phong cách của Android là Material (thiết kế mặc định), 
             * từ khóa cho chủ đề/phong cách của iOS là Cupertino . 
             * Mọi tiện ích chủ đề iOS đều có tiền tố Cupertino 
             */
            title: Text('Cupertino Dialog'),
            content: Text('Hey! I am Coflutter!'),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    _dismissDialog();
                  },
                  child: Text('Close')),
              TextButton(
                onPressed: () {
                  print('HelloWorld!');
                  _dismissDialog();
                },
                child: Text('HelloWorld!'),
              )
            ],
          );
        });
  }

  void _showSimpleDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            /**
             *SimpleDialog Hộp thoại đơn giản
      Được sử dụng để hiển thị các tùy chọn đơn giản dưới dạng hộp thoại.
      Có nhiều tùy chọn khác nhau để lựa chọn và thực hiện các chức năng tùy theo chúng. 
      Tùy chọn có thể đơn giản như chọn giữa các email khác nhau.
    Title: Chúng tôi luôn khuyên bạn nên đặt tiêu đề hộp thoại càng ngắn càng tốt. Nó sẽ dễ hiểu đối với người dùng.
    Shape: Nó được sử dụng để xác định hình dạng của hộp thoại của chúng ta cho dù đó là hình tròn, đường cong, v.v.
    Backgroundcolor: Nó được sử dụng để đặt màu nền cho hộp thoại của chúng ta.
    TextStyle: Nó được sử dụng để thay đổi kiểu văn bản của chúng ta.
             */
            title: Text('Chosse an Option'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  _dismissDialog();
                },
                child: const Text('Option 1'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  _dismissDialog();
                },
                child: const Text('Option 2'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  _dismissDialog();
                },
                child: const Text('Option 3'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  _dismissDialog();
                },
                child: const Text('Option 4'),
              ),
            ],
          );
        });
  }
}
/**
 *AlertDialog(
    {
      Key key,
      Widget title,
      EdgeInsetsGeometry titlePadding,
      TextStyle titleTextStyle,
      Widget content,
      EdgeInsetsGeometry contentPadding: const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
      TextStyle contentTextStyle,
      List<Widget> actions,
      EdgeInsetsGeometry actionsPadding: EdgeInsets.zero,
      VerticalDirection actionsOverflowDirection,
      double actionsOverflowButtonSpacing,
      EdgeInsetsGeometry buttonPadding,
      Color backgroundColor,
      double elevation,
      String semanticLabel,
      EdgeInsets insetPadding: _defaultInsetPadding,
      Clip clipBehavior: Clip.none,
      ShapeBorder shape,
      bool scrollable: false
    }
  )

 Title: Chúng tôi luôn khuyên bạn nên đặt tiêu đề hộp thoại càng ngắn càng tốt. Nó sẽ dễ hiểu đối với người dùng.
Action: Nó được sử dụng để hiển thị nội dung của hành động nào phải thực hiện.
Content: Nội dung của tiện ích AlertDialog được xác định bởi nội dung.
Shape: Nó được sử dụng để xác định hình dạng của hộp thoại của chúng ta cho dù đó là hình tròn, cong, v.v.
 */

/**
 * const SimpleDialog(
     {
      Key key,
      Widget title,
      EdgeInsetsGeometry titlePadding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
      TextStyle titleTextStyle,
      List<Widget> children,
      EdgeInsetsGeometry contentPadding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 16.0),
      Color backgroundColor,
      double elevation,
      String semanticLabel,
      ShapeBorder shape
     }
)
 */