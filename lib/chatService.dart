import 'package:chat/proto/service.pbgrpc.dart';
import 'package:grpc/grpc.dart' as prefix0;
import 'package:grpc/service_api.dart';

class ChatService{
  User user;
  MessingerClient client;
  ChatService(this.user){
    client= MessingerClient(
      prefix0.ClientChannel(
        "localhost",
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
  Stream<Message> subscribeToService()async*{
    RegisterRequest registerRequest= RegisterRequest()
    ..active=true
    ..user=user;
    await for( var msg in client.createStream(registerRequest)){
      yield msg;
    }

  }

  
}