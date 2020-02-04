import 'dart:io';
import 'dart:typed_data';

import 'package:chat/bloc/blocProvider.dart';
import 'package:chat/bloc/msgBloc.dart';
import 'package:chat/model/appEvent.dart';
import 'package:chat/pages/mediaHandler.dart';
import 'package:chat/proto/service.pbgrpc.dart';
import 'package:chat/settings.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class MyHomePage extends StatefulWidget {
  String name, targetId, id;
  Uint8List img;

  MyHomePage({
    @required this.id,
    @required this.name,
    @required this.img,
    @required this.targetId,
    Key key,
  }) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MsgBloc _msgBloc;
  TextEditingController _controllerSend = TextEditingController();
  double msgBoxWidth;
  ScrollController _scrollController;
  Uint8List image = Uint8List.fromList(List());
  List<Message> messages = List();
  @override
  void initState() {
    super.initState();
    msgBoxWidth = 100;
    _scrollController = ScrollController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _msgBloc = ServiceProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        leading: Hero(
            tag: widget.targetId,
            child: CircleAvatar(
              backgroundImage: MemoryImage(widget.img),
            )),
        backgroundColor: Colors.lightBlueAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          )
        ],
        title: Container(width: 300, child: Text(widget.name)),
      ),
      body: Container(
          child: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              "https://mir-s3-cdn-cf.behance.net/project_modules/disp/1ce52173426833.5c08f56353039.png",
              alignment: Alignment.topLeft,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ListView(
              controller: _scrollController,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: StreamBuilder<List<Message>>(
                      stream: _msgBloc.outEvent,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          messages = snapshot.data
                              .where((msg) =>
                                  msg.targetId == this.widget.targetId ||
                                  msg.senderId == widget.targetId)
                              .toList();
                          messages.forEach((m) => m.read = true);

                          return ListView(
                              children: messages
                                  .map((msg) => Padding(
                                      child: messageList(
                                          msg, msg.senderId == this.widget.id),
                                      padding: EdgeInsets.all(5)))
                                  .toList());
                        } else {
                          return Container(
                            height: 10,
                          );
                        }
                      }),
                ),
                Container(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.65,
                          child: TextField(
                            controller: _controllerSend,
                            decoration:
                                InputDecoration(hintText: "Type a message"),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.15,
                          child: IconButton(
                            icon: Icon(Icons.perm_media),
                            onPressed: () => getImage(),
                            iconSize: 15,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.15,
                          child: IconButton(
                            icon: Icon(Icons.send),
                            onPressed: () => onSend(),
                            iconSize: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
  void mediaChosen(int type)async{
    switch(type){
      case 0: 
      image = await ImagePicker.pickImage(
            source: ImageSource.gallery, imageQuality: Settings.IMAGE_QUALITY)
        .then((f) => f.readAsBytesSync());
        break;
       case 1: 
      image = await ImagePicker.pickVideo(
            source: ImageSource.gallery)
        .then((f) => f.readAsBytesSync());
        break;
      
       case 2: 
      image = await ImagePicker.pickImage(
            source: ImageSource.camera)
        .then((f) => f.readAsBytesSync());
        break;
      
      
    }
    
  }

  Future getImage() async {
   showDialog(context: context,
   builder:(context){
     return MediaHandler(onPressed: mediaChosen,);

   } 
   

   );
   /* image = await ImagePicker.pickImage(
            source: ImageSource.gallery, imageQuality: Settings.IMAGE_QUALITY)
        .then((f) => f.readAsBytesSync());*/
  }

  List<Widget> mapWithIndex(List<Message> msgs) {
    var list = List<Widget>();
    for (int i = 0; i < msgs.length; i++) {
      print("li  " + list.length.toString());
    }
    return list;
  }

  void onSend() {
    _msgBloc.dispatch(SendMsgEvent(
        _controllerSend.text, this.widget.id, this.widget.targetId, image));
    FocusScope.of(context).requestFocus(FocusNode());
    image = Uint8List.fromList(List());

    _controllerSend.clear();
    onUpdate();
  }

  void onUpdate()  {
    print(messages.length);
     _scrollController.animateTo(_scrollController.position.maxScrollExtent,duration:Duration(milliseconds: 1000),curve: Curves.decelerate);
  }

  Widget messageList(Message msg, bool userSender) {
    return Align(
      alignment: userSender ? Alignment.topRight : Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
        child: Container(
          padding: EdgeInsets.all(10),
          constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width * 0.3,
              maxWidth: MediaQuery.of(context).size.width * 0.5),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 20.0, // has the effect of softening the shadow
                  spreadRadius: 5.0, // has the effect of extending the shadow
                  offset: Offset(
                    2.0, // horizontal, move right 10
                    2.0, // vertical, move down 10
                  ),
                )
              ],
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                  bottomRight:
                      userSender ? Radius.circular(0) : Radius.circular(5),
                  bottomLeft:
                      userSender ? Radius.circular(5) : Radius.circular(0))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                    text: msg.body,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ]),
              ),
              msg.image.isNotEmpty
                  ? Container(
                      padding: EdgeInsets.all(4),
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.5,
                        maxHeight: MediaQuery.of(context).size.width * 0.6,
                      ),
                      child: Image.memory(Uint8List.fromList(msg.image)),
                    )
                  : Container(),
              RichText(
                  text: TextSpan(
                text: "\n" + msg.timestamp.substring(0, 16),
                style: TextStyle(fontSize: 10, color: Colors.black),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
