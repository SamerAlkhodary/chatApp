import 'package:chat/bloc/blocBase.dart';
import 'package:chat/chatService.dart';
import 'package:chat/model/appEvent.dart';
import 'package:chat/model/error.dart' as prefix0;
import 'package:chat/proto/service.pb.dart';
import 'package:chat/repo/msgRepository.dart';
import 'package:rxdart/rxdart.dart';

class MsgBloc extends BlocBase {
  final _msgController = BehaviorSubject<List<Message>>();
  final _contactsController = BehaviorSubject<List<User>>();
  final _userController = BehaviorSubject<User>();
  MsgRepository _msgRepository;
  User user;
  List<Message> msgs = List();
  List<User> contacts = List();
  Observable<List<Message>> get outEvent => _msgController.stream;
  Observable<List<Message>> get outContacts => _msgController.stream;
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
            (event as SendMsgEvent).target);

        break;
      case SubscribeEvent:
        _receiveMessage((event as SubscribeEvent).user);

        break;
      case SignupEvent:
        _signup((event as SignupEvent).user);
    }
  }

  void _sendMessage(String msg, String id, String dest) {
    print("msg: " + msg);
    print("id: " + id);
    print("target: " + dest);
    if (msg.isNotEmpty) {
      Message message = Message()
        ..body = msg
        ..senderId = id
        ..targetId = dest
        ..timestamp = DateTime.now().toString().substring(0, 16);

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

  void _addContact(String id) {}
  
  
  void _signup(User user) {
    _msgRepository.signup(user).then((resp) => resp.done
        ? {this.user=user, _userController.add(user)}
        : _userController.addError(prefix0.Error(resp.msg)));
  }
}
