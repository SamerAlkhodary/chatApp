import 'dart:convert';

import 'package:chat/proto/service.pbgrpc.dart';
import 'package:crypto/crypto.dart';
import 'package:grpc/grpc.dart' as prefix0;
import 'package:grpc/service_api.dart';

class ChatService{
  String local ="10.0.2.2";
  String home=  "192.168.1.96";
  String uni="10.8.143.51";
  MessingerClient client;
  ChatService(){
    client= MessingerClient(
      prefix0.ClientChannel(
       home,
        port:8080,
        options: prefix0.ChannelOptions(
          credentials: prefix0.ChannelCredentials.secure(
            onBadCertificate: (a,b)=>true
          )
        )
      )
    );
    

  }
  Future<Close> sendMessage(Message message)async{
    client.sendMessage(message);
    return Close();
  }
  Stream<Message> subscribeToService(User user)async*{
    RegisterRequest registerRequest= RegisterRequest()
    ..active=true
    ..user=user;
    await for( var msg in client.createStream(registerRequest)){
      yield msg;
    }

  }
  Future<SignupResponse> signup(User user)async {
    user..id= sha1.convert(utf8.encode(user.name.trim().toLowerCase())).toString();
    return  client.signup(SignupRequest()..user=user
    
    );



  }

   Future<AddFriendResponse> addContact(String username)async {
     return client.addFriend(AddFriendRequest()..id= sha1.convert(utf8.encode(username)).toString());
    
  }
  


  
}