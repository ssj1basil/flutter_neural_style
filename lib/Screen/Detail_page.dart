import 'package:flutter/material.dart';
import 'dart:io';

// ignore: must_be_immutable
class MyDetailPage extends StatefulWidget {
  File _image;

  MyDetailPage(File image) {
    _image = image;
  }

  @override
  _MyDetailPageState createState() => _MyDetailPageState(_image);
}

class _MyDetailPageState extends State<MyDetailPage> {
  File image;

  _MyDetailPageState(File image) {
    this.image = image;
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Image'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: FileImage(image),
                  fit: BoxFit.contain,
                ),
              ))
        ],
      )),
    );
  }
}
