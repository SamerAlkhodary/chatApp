import 'package:chat/proto/service.pbgrpc.dart';
import 'package:grpc/grpc.dart' as prefix0;
import 'package:grpc/service_api.dart';

class ChatService{
  String emulator ="10.0.2.2";
  String phone=  "192.168.1.96";
  MessingerClient client;
  ChatService(){
    client= MessingerClient(
      prefix0.ClientChannel(
       emulator,
        port:8080,
        options: prefix0.ChannelOptions(
          credentials: prefix0.ChannelCredentials.insecure()
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
    return  client.signup(SignupRequest()..user=user);



  }

  
}