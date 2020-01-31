import 'dart:typed_data';

import 'package:chat/proto/service.pbgrpc.dart';

abstract class AppEvent{

}
class SendMsgEvent extends AppEvent{
  String _msg;
  String _id;
  String _target;
  Uint8List _image;
  SendMsgEvent(this._msg,this._id,this._target ,this._image);
  String  get msg=> _msg;
   String  get id=> _id;
   Uint8List get image=>_image;
    String  get target=> _target;

}
class SubscribeEvent extends AppEvent{
  User _user;
  SubscribeEvent(this._user);
  User get user=> _user;

}
class SignupEvent extends AppEvent{
  User _user;
  User get user=> _user;
  SignupEvent(this._user);

}
class AddContactEvent extends AppEvent{
  String _username;
  AddContactEvent(this._username);
  String get username => _username;
}
class StartUpEvent extends AppEvent{

}