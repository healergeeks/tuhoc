// ignore_for_file: unnecessary_new

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new CameraAccess(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CameraAccess extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new CameraAccessState();
  }
}

class CameraAccessState extends State<CameraAccess> {
  late File cameraFile;

  @override
  Widget build(BuildContext context) {
    //display image selected from gallery
    selectFromCamera() async {
      cameraFile = (await ImagePicker().pickImage(
        source: ImageSource.camera,
        // maxHeight: 50.0,
        // maxWidth: 50.0,
      )) as File;
      setState(() {});
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Camera Access"),
        backgroundColor: Colors.green,
        actions: <Widget>[
          Text(
            "Nguyen Quang Manh",
            textScaleFactor: 2,
          )
        ],
      ),
      body: new Builder(
        builder: (BuildContext context) {
          return Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new ElevatedButton(
                    child: new Text('Select Image from Camera'),
                    onPressed: selectFromCamera),
                SizedBox(
                  height: 200.0,
                  width: 300.0,
                  // ignore: unnecessary_null_comparison
                  child: cameraFile == null
                      ? Center(child: new Text('Sorry nothing selected!!'))
                      : Center(child: new Image.file(cameraFile)),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
