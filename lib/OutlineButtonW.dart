import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

/*Add the following keys to your Info.plist file,
located in <project root>/ios/Runner/Info.plist:

NSPhotoLibraryUsageDescription - describe why your app needs permission for the photo library. This is called Privacy - Photo Library Usage Description in the visual editor.
NSCameraUsageDescription - describe why your app needs access to the camera. This is called Privacy - Camera Usage Description in the visual editor.
NSMicrophoneUsageDescription - describe why your app needs access to the microphone, if you intend to record videos. This is called Privacy - Microphone Usage Description in the visual editor.
Android #
No configuration required - the plugin should work out of the box.

Example #*/
class OutlineButtonW extends StatefulWidget {
  String buttontText;
  ImageSource imageSource;
  File imageFile;

  OutlineButtonW(this.buttontText, this.imageSource);

  @override
  _OutlineButtonWState createState() => _OutlineButtonWState();

  Widget showImageIfAvailable() {
    return imageFile == null
        ? Text('Please pick an image')
        : Image.file(
            imageFile,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          );
  }
}

class _OutlineButtonWState extends State<OutlineButtonW> {
  void getImage(BuildContext context, ImageSource source) {
    //maxwidth : for not making image to be high resolution for preventing app from crash in some cases
    ImagePicker.pickImage(source: source, maxWidth: 400.0).then((File image) {
      widget.imageFile = image;
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    Color defaultColor = Theme.of(context).accentColor;
    return OutlineButton(
      borderSide: BorderSide(
        color: defaultColor,
        width: 2.0,
      ),
      onPressed: () {
        getImage(context, widget.imageSource);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.camera_alt,
            color: defaultColor,
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(
            widget.buttontText,
            style: TextStyle(
              color: defaultColor,
            ),
          ),
        ],
      ),
    );
  }
}
