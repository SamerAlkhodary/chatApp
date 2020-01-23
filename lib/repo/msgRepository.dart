import 'package:chat/chatService.dart';
import 'package:chat/proto/service.pbgrpc.dart';
import 'package:chat/repo/repository.dart';

class MsgRepository extends Repository{
  ChatService chatService;
  MsgRepository(){
    chatService= ChatService();
  }
  @override
  void login() {
    // TODO: implement login
  }

  @override
  void logout() {
    // TODO: implement logout
  }


  @override
  void sendMessage(Message msg) {
    chatService.sendMessage(msg);
  }

  @override
  Stream<Message> subscribe(User user) {
   
    return chatService.subscribeToService(user);
  }

}