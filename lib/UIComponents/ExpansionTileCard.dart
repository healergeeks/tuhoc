import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

//expansion_tile_card
// là một ô mở rộng khi nhấn vào nó nó sẽ mỏ rộng phần đó
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExpansionTileCard',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'NguyenManhDung'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  // MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Phần phụ thuộc có thể được gọi trong phần nội dung của
  //Trang chủ bằng cách thực hiện lệnh gọi tới ExpansionTileCard
  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: ExpansionTileCard(
            key: cardA,
            leading: CircleAvatar(child: Text('D')),
            title: Text('Nhấn để mở rộng!'),
            subtitle: Text('Nó có Logo NMD.'),
            children: <Widget>[
              Divider(
                thickness: 1.0,
                height: 1.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Image.asset('assets/images/hinh_1.jpg')),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
