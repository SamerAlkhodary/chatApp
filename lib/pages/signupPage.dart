import 'dart:io';

import 'package:chat/pages/chatList.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignupPageState();
}

class SignupPageState extends State {
  var _image;
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                  onTap: () => chooseImgaePressed(),
                  child: _image == null
                      ? Text("Choose image")
                      : CircleAvatar(
                          radius: 90,
                          backgroundImage: FileImage(_image),
                        )),
            ),
            SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                      hintText: "Newbie", labelText: "Display name"),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                color: Colors.blueAccent,
                onPressed: () => _submitPressed(),
                child: Text("Submit"),
              ),
            )
          ],
        ),
      ),
    );
  }

  void chooseImgaePressed() {
    getImage();
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  void _submitPressed() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => ChatListPage(
                  name: _controller.text,
                  image: _image,
                )));
  }
}
