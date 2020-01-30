
import 'dart:io';

import 'package:chat/proto/service.pbgrpc.dart';
import 'package:path_provider/path_provider.dart';

class Saver{
  static Future<void> saveContac(User user) async{
    final dir= await getApplicationDocumentsDirectory();
    final file = File("${dir.path}/contacts.txt");
    file.writeAsString(user.writeToJson(),mode:FileMode.append);

    
  }
  static Future<void> saveUser(User user) async{
    final dir= await getApplicationDocumentsDirectory();
    final file = File("${dir.path}/user.txt");
    file.writeAsString(user.writeToJson(),mode:FileMode.append);

    
  }


  static void messageToString(Message msg)async{
    final dir= await getApplicationDocumentsDirectory();
    final file = File("${dir.path}/msg.txt");
    file.writeAsString(msg.writeToJson());
  }

}
class Loader{
  static Future<User> loadContact()async{
    final dir= await getApplicationDocumentsDirectory();
    final file = File("${dir.path}/contacts.txt");

    var jsonData= await file.readAsString();
    print("data: "+ jsonData);

    return User.fromJson(jsonData);

  }
  static Future<User> loadUser()async{
    final dir= await getApplicationDocumentsDirectory();
    try{
      final file = File("${dir.path}/user.txt");
    var jsonData= await file.readAsString();
         var usr=User.fromJson(jsonData);


    return usr;
    }catch(e){
      return null;
      
    }
    

  }
  static Future<Message> loadMessage()async {
     final dir= await getApplicationDocumentsDirectory();
     try{
       final file = File("${dir.path}/msg.txt");
    var jsonData= await file.readAsString();

    return Message.fromJson(jsonData);

     }catch(e){
       return null;

     }
    

  }
}