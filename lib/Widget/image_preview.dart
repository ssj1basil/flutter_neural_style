import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:neuralstyletransfer/Screen/Detail_page.dart';
import 'package:neuralstyletransfer/main.dart';

Widget build_imagepreview(BuildContext context, File _image, String title) {

  return (Container(
      padding: EdgeInsets.only(top: 30),
      child: Column(children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyDetailPage(_image)));
          },
          child: Container(
            height: 150,
            width: 150,
            child: _image == null
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
                          image: FileImage(_image),
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
            children:  <Widget>[

              GestureDetector(
                onTap:(){
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
              Icon(
                Icons.settings_system_daydream,
                color: Colors.blue,
                size: 40.0,
              ),
            ],
          ),
        )
      ])));
}
