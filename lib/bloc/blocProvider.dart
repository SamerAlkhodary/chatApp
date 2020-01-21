import 'package:chat/bloc/msgBloc.dart';
import 'package:flutter/material.dart';





class ServiceProvider  extends InheritedWidget{

  final MsgBloc msgBloc;
  ServiceProvider({this.msgBloc,Widget child,Key key}):super(key:key,child:child);
   @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;


  
  static MsgBloc of (BuildContext context)=> 
  (context.inheritFromWidgetOfExactType(ServiceProvider) as ServiceProvider)
  .msgBloc;


}