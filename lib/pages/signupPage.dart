import 'dart:io';

import 'package:chat/bloc/blocProvider.dart';
import 'package:chat/bloc/msgBloc.dart';
import 'package:chat/model/appEvent.dart';
import 'package:chat/model/error.dart' as prefix0;
import 'package:chat/pages/chatList.dart';
import 'package:chat/proto/service.pbgrpc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignupPageState();
}

class SignupPageState extends State {
  MsgBloc _msgBloc;
  File _image;
  TextEditingController _controller = TextEditingController();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _msgBloc= ServiceProvider.of(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: StreamBuilder<User>(
          stream: _msgBloc.outUser,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              navigate();
            }
            return ListView(
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                      onTap: () => chooseImgaePressed(),
                      child:// _image == null
                         // ? Text("Choose image")
                           CircleAvatar(
                              radius: 90,
                              backgroundImage: _image!=null?FileImage(_image):null,
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
                        errorText:snapshot.hasError?(snapshot.error as prefix0.Error).message:null,
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
            );
          }
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
    _msgBloc.dispatch(
      SignupEvent(
      User()
      ..name=_controller.text.trim()
      ..profilePic=_image.readAsBytesSync()
    )
    
    );


   
  }
  void navigate(){
     Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => ChatListPage(
                  name: _controller.text,
                  image: _image,
                )));

  }
}
