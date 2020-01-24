import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignupPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => SignupPageState();
}
class SignupPageState extends State{
  var _image;
  TextEditingController _controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        child: Column(
          
          children: <Widget>[
            SizedBox(height: 100,),
            InkWell(
              onTap: ()=> chooseImgaePressed(),
                          child: _image ==null?Text("Choose image")
                          :CircleAvatar(
                            radius: 90,
                            backgroundImage: FileImage(_image),
                          )
                

            
            ),
            SizedBox(height: 50,),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Newbie",
                labelText: "Display name"
                
              ),
            )
          ],
        ),
      ),
    );
  }
  void chooseImgaePressed(){
    getImage();
    

  }
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

}