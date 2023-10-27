import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //phần tên của trang app
      title: 'Xin chào ứng dụng demo thế giới',

      // phần định nghĩa thanh ngang đặt ỏ đầu trang
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const MyHomePage(title: 'Trang chủ'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*Scaffold là một lớp trong Flutter cung cấp nhiều widget hay có 
        thể nói là các API như Drawer, Snack-Bar, Bottom-Navigation-Bar, Float-Action-Button, App-Bar, v.v.
        Scaffold sẽ mở rộng hoặc chiếm toàn bộ màn hình thiết bị. 
        Nó sẽ chiếm không gian có sẵn. Scaffold sẽ cung cấp một khuôn khổ 
        để triển khai bố cục thiết kế vật liệu cơ bản của ứng dụng. */

      //app-Bar: Nó hiển thị một thanh ngang chủ yếu được đặt ở đầu Scaffold
      appBar: AppBar(title: Text(title)),
      //title: const Text('GeeksforGeeks') == title: Text(title)
      //vì đã được đinh nghĩa title định nghĩa bên trên

      /**
     * body: Nó sẽ hiển thị nội dung chính hoặc chính trong Scaffold. 
     * Nó nằm bên dưới appBar và bên dưới floatActionButton . 
     * Theo mặc định, các widget bên trong phần thân nằm ở góc bên trái.
     */
      body: const Center(
        child: Text(
          "Welcome to Nguyễn Mạnh Dũng!!!",
          style: TextStyle(
            color: Colors.black,
            fontSize: 40.0,
          ),
        ),
      ),

      /**
       * floatActionButton: FloatActionButton là một nút được đặt ở góc dưới bên phải theo mặc định. 
       * FloatActionButton là một nút biểu tượng nổi trên nội dung của màn hình tại một vị trí cố định. 
       * Nếu chúng ta cuộn trang, vị trí của nó sẽ không thay đổi, nó sẽ được cố định.
       */
      floatingActionButton: FloatingActionButton(
        elevation: 30.0, //sử dụng để tạo hiệu ứng đổ bóng cho nút.

        //một số biểu tượng được tải sẵn trong Flutter SDK
        child: const Icon(Icons.add),

        // onPressed()là một hàm sẽ được gọi khi nhấn nút và các câu lệnh bên trong hàm sẽ được thực thi.
        onPressed: () {
          // action on button press
        },
      ),

      /**
       * drawer(ngăn kéo): ngăn kéo là một menu trượt hoặc một bảng điều khiển được hiển thị ở bên cạnh Scaffold. 
       */
      drawer: Drawer(
        child: ListView(
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text(
                'GeeksforGeeks',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              leading: Icon(Icons.people), // thêm các biểu tượng
            ),
            ListTile(
              title: Text('Item 2'),
              leading: Icon(Icons.mail),
            ),
          ],
        ),
      ),

      /**
       * BottomNavigationBar giống như một menu ở cuối Scaffold. 
       * Chúng tôi đã thấy thanh điều hướng này trong hầu hết các ứng dụng. 
       * Chúng ta có thể thêm nhiều biểu tượng hoặc văn bản hoặc cả hai vào thanh dưới dạng mục. 
       */
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          fixedColor: Colors.green, // đổi màu biểu ường đang hoạt động
          items: const [
            BottomNavigationBarItem(
              // hàm để thêm các mục vào thanh
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Search",
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.account_circle),
            ),
          ],

          //hàm hành động theo vị trí chỉ mục
          onTap: (int indexOfItem) {}),
    );
  }
}
/**
const Scaffold({
    Key key,
    this.appBar,
    this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.drawer,
    this.endDrawer,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomPadding,
    this.resizeToAvoidBottomInset,
    this.primary = true,
    this.drawerDragStartBehavior
          = DragStartBehavior.start,
    this.extendBody = false,
    this.drawerScrimColor,
})
BackgroundColor: được sử dụng để đặt màu của toàn bộ tiện ích Scaffold .
floatActionButtonAnimator: dùng để cung cấp hoạt ảnh di chuyển floatActionButton .
primary: để biết liệu Scaffold có được hiển thị hay không.
drawerScrimColor: được sử dụng để xác định màu cho nội dung chính khi ngăn kéo được mở.
BottomSheet: Thuộc tính này lấy một widget (cuối cùng) làm đối tượng để hiển thị nó ở cuối màn hình.
drawerDragStartBehaviour: Thuộc tính này giữ enum DragStartBehavior làm đối tượng để xác định hành vi kéo của ngăn kéo.
drawerEdgeDragWidth: Điều này xác định khu vực mà thao tác vuốt hoặc kéo sẽ dẫn đến việc mở ngăn kéo. Và nó lấy gấp đôi làm đối tượng.
drawerEnableOpenGesture: Thuộc tính này giữ giá trị boolean vì đối tượng xác định cử chỉ kéo có mở ngăn kéo hay không, theo mặc định nó được đặt thành true.
endDrawer: Thuộc tính endDrawer lấy một widget làm tham số. Nó tương tự như Drawer, ngoại trừ việc nó mở theo hướng ngược lại.
endDrawerEnableOpenGesture: Một lần nữa, thuộc tính này lấy giá trị boolean làm đối tượng để xác định xem cử chỉ kéo có mở endDrawer hay không.
ExtendBody: Thuộc tính ExtendBody lấy boolean làm đối tượng. Theo mặc định, thuộc tính này luôn sai nhưng không được rỗng. Nếu nó được đặt thành true khi có BottomNavigationBar hoặc PersistFooterButtons thì chiều cao của những thứ này sẽ được thêm vào phần thân và chúng được dịch chuyển bên dưới phần thân.
ExtendBodyBehindAppBar: Thuộc tính này cũng lấy boolean làm đối tượng. Theo mặc định, thuộc tính này luôn sai nhưng không được rỗng. Nếu nó được đặt thành true thì thanh ứng dụng thay vì nằm trên phần thân sẽ được mở rộng phía trên nó và chiều cao của nó sẽ được thêm vào phần thân. Thuộc tính này được sử dụng khi màu của thanh ứng dụng không mờ hoàn toàn.
Vị trí Nút Hành động nổi: Thuộc tính này chịu trách nhiệm về vị trí của Nút Hành động nổi .
Nút chân trang liên tục: Thuộc tính này chứa danh sách các tiện ích. Đó thường là các nút được hiển thị bên dưới giàn giáo .
thay đổi kích thước để tránh các phần dưới cùng: Thuộc tính này lấy giá trị Boolean làm đối tượng. Nếu được đặt thành true thì các tiện ích nổi trên khung sẽ tự thay đổi kích thước để tránh cản trở bàn phím ảo.

 */