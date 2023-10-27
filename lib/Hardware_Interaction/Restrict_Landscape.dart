import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; //For using SystemChrome

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            'This app can\'t be rotated to Landscape mode',
            style: TextStyle(color: Colors.green, fontSize: 17),
          ),
        ),
      ),
    );
  }
}
