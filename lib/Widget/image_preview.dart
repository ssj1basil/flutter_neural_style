import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:neuralstyletransfer/Screen/Detail_page.dart';
import 'package:image_picker/image_picker.dart';

class imagepreview extends StatefulWidget {
  imagepreview_state createState() => imagepreview_state();
}

class imagepreview_state extends State<imagepreview> {
  noSuchMethod(Invocation i) => super.noSuchMethod(i);

  File image;
  final picker = ImagePicker();

  Future getImage_gallery(File _image) async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    _image = File(pickedFile.path);
    setState(() {
      _image = File(pickedFile.path);
    });
    return _image;
  }

  Future<File> getImage_camera(File _image) async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile.path);
    });

    return _image;
  }

  Widget build_imagepreview(BuildContext context, File image, String title) {
    return (Container(
        padding: EdgeInsets.only(top: 30),
        child: Column(children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyDetailPage(image)));
            },
            child: Container(
              height: 150,
              width: 150,
              child: image == null
                  ? Text('No image selected.')
                  : Column(children: <Widget>[
                      Text(title),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 120.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: FileImage(image),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.rectangle,
                        ),
                      )
                    ]),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                GestureDetector(
                  onTap: () async{
                    image = await getImage_camera(image);
                  },
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.blue,
                    size: 40.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () async{
                    image = await getImage_gallery(image);

                  },
                  child: Icon(
                    Icons.settings_system_daydream,
                    color: Colors.blue,
                    size: 40.0,
                  ),
                ),
              ],
            ),
          )
        ])));
  }
}
