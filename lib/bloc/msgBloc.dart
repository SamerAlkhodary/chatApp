import 'dart:typed_data';

import 'package:chat/bloc/blocBase.dart';
import 'package:chat/chatService.dart';
import 'package:chat/model/appEvent.dart';
import 'package:chat/model/error.dart' as prefix0;
import 'package:chat/proto/service.pb.dart';
import 'package:chat/repo/msgRepository.dart';
import 'package:chat/repo/saver.dart';
import 'package:rxdart/rxdart.dart';

class MsgBloc extends BlocBase {
  final _msgController = BehaviorSubject<List<Message>>();
  final _contactsController = PublishSubject<List<User>>();
  final _userController = BehaviorSubject<User>();
  MsgRepository _msgRepository;
  User user;
  List<Message> msgs = List();
  List<User> contacts = List();
  Observable<List<Message>> get outEvent => _msgController.stream;
  Observable<List<User>> get outContacts => _contactsController.stream;
  Observable<User> get outUser => _userController.stream;
  MsgBloc() {
    _msgRepository = MsgRepository();
  }
  @override
  void dipsose() {
    _msgController.close();
    _contactsController.close();
    _userController.close();
  }

  void dispatch(AppEvent event) {
    switch (event.runtimeType) {
      case SendMsgEvent:
        _sendMessage((event as SendMsgEvent).msg, (event as SendMsgEvent).id,
            (event as SendMsgEvent).target,(event as SendMsgEvent).image);

        break;
      case SubscribeEvent:
        _receiveMessage((event as SubscribeEvent).user);

        break;
      case SignupEvent:
        _signup((event as SignupEvent).user);
        break;
        case AddContactEvent:
        _addContact( (event as AddContactEvent).username);
        break;
        case StartUpEvent:
        _startUp();
        break;
    }
  }

  void _sendMessage(String msg, String id, String dest,Uint8List image) {

    if (msg.isNotEmpty) {
      Message message = Message()
        ..body = msg
        ..senderId = id
        ..targetId = dest
        ..image=image
        ..timestamp = DateTime.now().toString();

      msgs.add(message);
      _msgController.add(msgs);

      _msgRepository.sendMessage(message);
    }
  }

  void _receiveMessage(User user) {
    _msgRepository
        .subscribe(user)
        .listen((msg) => {msgs.add(msg), _msgController.add(msgs)});
  }

  void _addContact(String username) {
    var notExist=contacts.every((c)=>c.name.toLowerCase()!=username.toLowerCase());
    if(user.name==username){
            _contactsController.addError(prefix0.Error("You can not add yourself"));
            return;

    }
    if(notExist){
      _msgRepository.addContact(username).then((resp)=>resp.done
    ?{contacts.add(resp.user),_contactsController.add(contacts),Saver.saveContact(contacts)}
    :{_contactsController.addError(prefix0.Error(resp.msg))}
    );

    }
    else{
      _contactsController.addError(prefix0.Error("User is already added "));
      return;
    }
    


  }
  
  void _startUp()async{
    var user = await Loader.loadUser();
    if(user!=null){
     this.user=user;
      _userController.add(user);
      var contacts= await Loader.loadContact();
      if(contacts!=null){this.contacts=contacts;_contactsController.add(contacts);

    }

  }
  }
  void _signup(User user) {
    _msgRepository.signup(user).then((resp) => resp.done
        ? {this.user=user, _userController.add(user),Saver.saveUser(user)}
        : _userController.addError(prefix0.Error(resp.msg)));
  }
}
