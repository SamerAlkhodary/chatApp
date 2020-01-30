import 'dart:io';

import 'package:chat/bloc/blocProvider.dart';
import 'package:chat/bloc/msgBloc.dart';
import 'package:chat/model/appEvent.dart';
import 'package:chat/pages/chatList.dart';
import 'package:chat/pages/signupPage.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget { 
   MsgBloc userBloc;
  
   Widget _chatListPage, _signupPage=SignupPage();

  @override
  State<StatefulWidget> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  var _authenticated = false;

  initState() {
    

    super.initState();
  
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.userBloc= ServiceProvider.of(context);

    widget.userBloc.dispatch(StartUpEvent());
    widget.userBloc.outUser.
    listen((user) {
      if(this.mounted){
           setState(() {
        _authenticated =   user.id!= null;
        widget._chatListPage=ChatListPage(user: user,);
      });

      }
   
    }).onError((msg){
      if(this.mounted){
           setState(() {
               widget._signupPage=SignupPage();
        _authenticated =false;
      });

      }

    
    });
  }

  @override
  Widget build(BuildContext context) {

    if (!_authenticated) {
      return widget._signupPage;
    } else {
      return widget._chatListPage;
    }
  }
}