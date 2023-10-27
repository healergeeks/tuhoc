import 'package:flutter/material.dart';

void main() {
  runApp(const GFGapp());
}

class GFGapp extends StatelessWidget {
  const GFGapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /**
       * MaterialApp là một lớp hoặc tiện ích được xác định trước một cách nhanh chóng. 
       * Nó có thể là thành phần chính hoặc cốt lõi của ứng dụng flutter. 
       * Tiện ích MaterialApp cung cấp một trình bao bọc xung quanh các Widget Material khác.
       * Chúng tôi có thể truy cập tất cả các thành phần và tiện ích khác do Flutter SDK cung cấp.
       */
      title: 'GeeksforGeeks',
      theme: ThemeData(primarySwatch: Colors.green),
      darkTheme: ThemeData(primarySwatch: Colors.grey),
      color: Colors.amberAccent,
      supportedLocales: {const Locale('en', ' ')},
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('GeeksforGeeks')),
      ),
    );
  }
} 

/**
      import statement: Câu lệnh nhập được sử dụng để nhập các thư viện được cung cấp bởi Flutter SDK. 
  Ở đây chúng tôi đã nhập tệp 'material.dart'. Chúng ta có thể sử dụng tất cả các 
  tiện ích flutter triển khai thiết kế vật liệu bằng cách nhập tệp này.
      Hàm main(): Giống như nhiều ngôn ngữ lập trình khác, chúng ta cũng có một hàm 
  main trong đó chúng ta phải viết các câu lệnh sẽ được thực thi khi ứng dụng khởi động. 
  Kiểu trả về của hàm chính là 'void' .
      Hàm runApp(Widget widget): Hàm void runApp(Widget widget) lấy một widget làm đối số 
  và đặt nó trên màn hình. Nó đưa ra các ràng buộc để widget phù hợp với màn hình. 
  Nó biến tiện ích đã cho thành tiện ích gốc của ứng dụng và các tiện ích khác là con của nó. 
  Ở đây, chúng tôi đã sử dụng MaterialApp làm tiện ích gốc trong đó chúng tôi đã xác định các tiện ích khác.
      MaterialApp()widget: Chúng ta đã thảo luận về MaterialApp ngay từ đầu. 
  Chúng ta hãy xem các thuộc tính khác nhau của tiện ích MaterialApp. 
      title: Thuộc tính này được sử dụng để cung cấp mô tả ngắn gọn về ứng dụng cho người dùng. 
  Khi người dùng nhấn nút ứng dụng gần đây trên thiết bị di động, 
  văn bản tiếp tục ở tiêu đề sẽ được hiển thị. 
      theme: Thuộc tính này được sử dụng để cung cấp chủ đề mặc định 
  cho ứng dụng giống như màu chủ đề của ứng dụng.
      Đối với điều này, chúng tôi sử dụng lớp/widget sẵn có có tên ThemeData(). 
  Trong tiện ích Themedata(), chúng ta phải viết các thuộc tính khác nhau liên quan đến chủ đề. 
  Ở đây chúng tôi đã sử dụng PrimarySwatch được sử dụng để xác định 
  màu chủ đề mặc định của ứng dụng. Để chọn màu, chúng tôi sử dụng lớp Màu từ thư viện vật liệu. 
  Trong ThemeData(), chúng ta cũng có thể xác định một số thuộc tính khác 
  như TextTheme, Độ sáng (Có thể bật chủ đề tối bằng cách này), AppBarTheme, v.v.
      home: Nó được sử dụng cho lộ trình mặc định của ứng dụng có nghĩa là tiện ích
  được xác định trong đó sẽ được hiển thị khi ứng dụng khởi động bình thường. 
  Ở đây chúng ta đã xác định tiện ích Scaffold bên trong thuộc tính home. 
  Bên trong Scaffold, chúng tôi xác định các thuộc tính khác nhau như appBar, body, floatActionButton, BackgroundColor, v.v. 
      Ví dụ: trong thuộc tính appBar , chúng tôi đã sử dụng tiện ích AppBar() chấp nhận 'GeeksforGeeks' làm tiêu đề, điều này sẽ được hiển thị ở đầu ứng dụng trong thanh ứng dụng.
  Các thuộc tính khác trong MaterialApp() là debugShowCheckedModeBanner (được sử dụng để xóa thẻ gỡ lỗi ở góc trên cùng), 
  darkTheme (Để yêu cầu chế độ tối trong ứng dụng), 
  màu sắc (Đối với màu chính của ứng dụng), 
  tuyến đường (Đối với bảng định tuyến của ứng dụng) ,
  ThemeMode (Để xác định chủ đề nào sẽ được sử dụng) và 
  supportLocales chứa danh sách các ngôn ngữ mà ứng dụng hỗ trợ, v.v.    */

/**
 * const MaterialApp(
{ Key key,
  GlobalKey<NavigatorState> navigatorKey,
  Widget home,
  Map<String, WidgetBuilder> routes: const <String, WidgetBuilder>{},
  String initialRoute,
  RouteFactory onGenerateRoute,
  InitialRouteListFactory onGenerateInitialRoutes,
  RouteFactory onUnknownRoute,
  List<NavigatorObserver> navigatorObservers: const <NavigatorObserver>[],
  TransitionBuilder builder,
  String title: '',
  GenerateAppTitle onGenerateTitle,
  Color color,
  ThemeData theme,
  ThemeData darkTheme,
  ThemeData highContrastTheme,
  ThemeData highContrastDarkTheme,
  ThemeMode themeMode: ThemeMode.system,
  Locale locale,
  Iterable<LocalizationsDelegate> localizationsDelegates,
  LocaleListResolutionCallback localeListResolutionCallback,
  LocaleResolutionCallback localeResolutionCallback,
  Iterable<Locale> supportedLocales: const <Locale>[Locale('en', 'US')],
  bool debugShowMaterialGrid: false,
  bool showPerformanceOverlay: false,
  bool checkerboardRasterCacheImages: false,
  bool checkerboardOffscreenLayers: false,
  bool showSemanticsDebugger: false,
  bool debugShowCheckedModeBanner: true,
  Map<LogicalKeySet, Intent> shortcuts,
  Map<Type, Action<Intent>> actions
}
)


action: Thuộc tính này lấy Map<Type, Action<Intent>> làm đối tượng. Nó kiểm soát các phím ý định.
backButtonDispatcher: Nó quyết định cách xử lý nút quay lại.
checkerboardRasterCacheImage: Thuộc tính này lấy boolean làm đối tượng. Nếu được đặt thành true, nó sẽ bật tính năng kiểm tra hình ảnh bộ đệm raster.
color: Nó kiểm soát màu chính được sử dụng trong ứng dụng.
darkTheme: Nó cung cấp dữ liệu chủ đề cho chủ đề tối cho ứng dụng.
debugShowCheckedModeBanner: Thuộc tính này lấy boolean làm đối tượng để quyết định có hiển thị biểu ngữ gỡ lỗi hay không.
debugShowMaterialGird: Thuộc tính này lấy boolean làm đối tượng. Nếu được đặt thành true, nó sẽ vẽ một ứng dụng vật liệu lưới cơ sở.
highContrastDarkTheme: Nó cung cấp dữ liệu chủ đề để sử dụng cho chủ đề có độ tương phản cao.
home: Thuộc tính này lấy widget làm đối tượng hiển thị trên tuyến đường mặc định của ứng dụng.
initRoute: Thuộc tính này lấy một chuỗi làm đối tượng để đặt tên của tuyến đầu tiên mà bộ điều hướng được xây dựng.
locale: Nó cung cấp một miền địa phương cho MaterialApp.
localizationsDelegate: Điều này cung cấp một đại biểu cho các ngôn ngữ.
navigatorObserver: Nó lấy GlobalKey<NavigatorState> làm đối tượng để tạo khóa khi xây dựng bộ điều hướng.
navigatorObserver: Thuộc tính này giữ List<NavigatorObserver> làm đối tượng để tạo danh sách người quan sát cho navigator.
onGenerateInitialRoutes: Thuộc tính này lấy kiểu chữ initRouteListFactory làm đối tượng để tạo các tuyến đường ban đầu.
onGeneratRoute: onGenerateRoute lấy RouteFactory làm đối tượng. Nó được sử dụng khi ứng dụng được điều hướng đến một tuyến đường được đặt tên.
onGenerateTitle: Thuộc tính này lấy RouteFactory typedef làm đối tượng để tạo chuỗi tiêu đề cho ứng dụng nếu được cung cấp.
onUnknownRoute: onUnknownRoute lấy RouteFactory typedef làm đối tượng để cung cấp tuyến đường trong trường hợp phương pháp khác bị lỗi.
RouteInformationParse: Thuộc tính này giữ RouteInformationParser<T> làm đối tượng cho thông tin định tuyến từ RouteInformationProvider thành một kiểu dữ liệu chung.
RouteInformationProvider: Thuộc tính này lấy lớp RouteInformationProvider làm đối tượng. Nó có trách nhiệm cung cấp thông tin định tuyến.
RouteDelegate: Thuộc tính này lấy RouterDelegate<T>  làm đối tượng để định cấu hình một tiện ích nhất định.
routes: Thuộc tính tuyến đường lấy lớp L ogicalKeySet làm đối tượng để kiểm soát định tuyến cấp cao nhất của ứng dụng.
shortcuts: Thuộc tính này lấy lớp LogicalKeySet làm đối tượng để quyết định phím tắt cho ứng dụng.
showPerformanceOverlay : showPerformanceOverlay lấy giá trị boolean làm đối tượng để bật hoặc tắt lớp phủ hiệu suất.
showSemantisDebugger: Thuộc tính này lấy boolean làm đối tượng. Nếu được đặt thành true, nó sẽ hiển thị một số thông tin có thể truy cập được.
supportedLocales: Thuộc tính được hỗ trợLocales giữ các địa phương được sử dụng trong ứng dụng bằng cách lấy lớp Iterable<E> làm đối tượng.
theme: Thuộc tính này lấy lớp ThemeData làm đối tượng để mô tả chủ đề cho MaterialApp.
themeMode:  Thuộc tính này giữ ThemeMode enum làm đối tượng quyết định chủ đề cho ứng dụng vật liệu.
title: Thuộc tính title lấy một chuỗi làm đối tượng để quyết định mô tả một dòng của ứng dụng cho thiết bị.
 */
