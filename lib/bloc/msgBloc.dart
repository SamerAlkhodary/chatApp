import 'package:chat/bloc/blocBase.dart';
import 'package:chat/model/appEvent.dart';
import 'package:chat/proto/service.pb.dart';
import 'package:chat/repo/msgRepository.dart';
import 'package:rxdart/rxdart.dart';

class MsgBloc extends BlocBase{
  final _msgController = BehaviorSubject<Message>();
  final _msgRepository = MsgRepository();
  Observable<Message> get outEvent => _msgController.stream;

  @override
  void dipsose() {
    _msgController.close();
  }
  void dispatch(AppEvent event){
    switch (event.runtimeType){
      case SendMsgEvent:
      _sendMessage((event as SendMsgEvent).msg,(event as SendMsgEvent).id,(event as SendMsgEvent).target);
      
       break; 
    }

  }
  void _sendMessage(String msg,String id,String dest){
    print("msg: "+msg);
    if( msg.isNotEmpty)
    {
      Message message= Message()..body=msg;
      message..senderId=id
            ..targetId=dest;
      
       _msgController.add(message);

    }
   
    _msgRepository.sendMessage();


}
  void _receiveMessage(Message msg,String sender){
    _msgController.add(msg);

}
}
