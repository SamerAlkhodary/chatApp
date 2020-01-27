import 'dart:async';
import 'dart:typed_data';
import 'package:chat/bloc/blocProvider.dart';
import 'package:chat/bloc/msgBloc.dart';
import 'package:chat/model/appEvent.dart';
import 'package:chat/pages/addContactPage.dart';
import 'package:chat/pages/mainPage.dart';
import 'package:chat/proto/service.pbgrpc.dart';
import 'package:flutter/material.dart';
import 'package:protobuf/protobuf.dart';
import 'package:rxdart/rxdart.dart';

class ChatListPage extends StatefulWidget {
  User user;
  ChatListPage({@required this.user, Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ChatListState();
}

class ChatListState extends State<ChatListPage> {
  MsgBloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = ServiceProvider.of(context);

    _bloc.dispatch(SubscribeEvent(widget.user));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              //color: Colors.red,
              color: Colors.lightBlueAccent),
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 20, top: 40),
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: MemoryImage(widget.user.profilePic),
                      radius: 40.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        widget.user.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.75,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(60))),
                  child: StreamBuilder(
                      stream:
                          Observable.merge([_bloc.outContacts, _bloc.outEvent]),
                      builder: (context, snapshot) {
                        print(snapshot.data.runtimeType);
                        return ListView(
                            children: snapshot.hasData
                                ? _listElement(widget.user.id, snapshot)
                                : [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text("No connections"),
                                    )
                                  ]);
                                  
                      }),
                ),
              ),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addContactPressed(),
        child: Icon(Icons.add),
      ),
    );
  }

  List<Widget> _listElement(String id, AsyncSnapshot snapshot) {
    List<Message> msgList = List();
    List<User> contactList = List();

    if (snapshot.data is List<Message>) {
      msgList = snapshot.data;
      //list = snapshot.data.where((m )=> !(m as Message).read && (m as Message).senderId!=id && (m as Message).senderId==targetId).toList();
    }

    if (snapshot.data is List<User>) {
      contactList = snapshot.data;
      print(contactList.length);
    }

    return contactList.map((contact) {
      msgList = msgList
          .where((m) => !m.read && m.senderId != id && m.senderId == contact.id)
          .toList();

      return Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 0.5, color: Colors.grey))),
        padding: EdgeInsets.only(top: 10),
        height: MediaQuery.of(context).size.height * 0.75 / 6,
        child: Center(
          child: ListTile(
              dense: false,
              leading: Hero(
                  tag: contact.id,
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage:
                        MemoryImage(Uint8List.fromList(contact.profilePic)),
                  )),
              title: Text(
                contact.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () => _chatPressed(
                  contact.name,
                  Uint8List.fromList(contact.profilePic),
                  contact.id,
                  id,
                  context),
              trailing: msgList.isNotEmpty
                  ? Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red[300]),
                      width: 20,
                      height: 20,
                      child: Center(
                        child: Text(
                          msgList.length.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ))
                  : Container(
                      width: 10,
                      height: 10,
                    )),
        ),
      );
    }).toList();
  }

  void _chatPressed(String name, Uint8List img, String targetId, String id,
      BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyHomePage(
                  id: id,
                  name: name,
                  img: img,
                  targetId: targetId,
                )));
  }

  void _addContactPressed() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AddContact(_bloc);
        });
  }
}
