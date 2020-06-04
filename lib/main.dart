import 'dart:io';
import 'package:flutter/material.dart';
import 'Widget/image_preview.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  File contentimage, style_image;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Neural Style transfer'),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            imagepreview_state().build_imagepreview(context, contentimage,'Content Image'),
            imagepreview_state().build_imagepreview(context, style_image,'Style Image')
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
           // image = await getImage_gallery(image);
          },
          tooltip: 'Pick Image',
          child: Icon(Icons.add_a_photo),
        ),
      ),
    );
  }

}
