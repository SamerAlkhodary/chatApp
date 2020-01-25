import 'package:chat/proto/service.pbgrpc.dart';

abstract class Repository{
  void sendMessage(Message msg);
  Stream<Message> subscribe(User user);
  Future<SignupResponse> signup(User user);
  void logout();
  Future<AddFriendResponse> addContact(String username);
  
} 