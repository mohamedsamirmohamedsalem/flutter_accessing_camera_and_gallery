import 'package:flutter/material.dart';
import 'package:flutter_accessing_camera/OutlineButtonW.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(AccessCamera());

class AccessCamera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    OutlineButtonW s = OutlineButtonW('Add Camera Image', ImageSource.camera);
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Access Device Camera'),
          ),
          body: Center(
            child: Container(
              width: 300.0,
              child: Column(
                children: <Widget>[
                  s,
                  OutlineButtonW('Pick Gallery Image', ImageSource.gallery),
                  s.showImageIfAvailable(),
                  SizedBox(
                    height: 30.0,
                  ),
                  //   showImageIfAvailable,
                ],
              ),
            ),
          )),
    );
  }
}
