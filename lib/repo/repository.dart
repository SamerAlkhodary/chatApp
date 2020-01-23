import 'package:chat/proto/service.pbgrpc.dart';

abstract class Repository{
  void sendMessage(Message msg);
  Stream<Message> subscribe(User user);
  void login();
  void logout();
} 