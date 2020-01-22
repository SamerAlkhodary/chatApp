import 'package:chat/bloc/blocBase.dart';
import 'package:chat/model/appEvent.dart';
import 'package:chat/proto/service.pb.dart';
import 'package:chat/repo/msgRepository.dart';
import 'package:rxdart/rxdart.dart';

class MsgBloc extends BlocBase{
  final _msgController = BehaviorSubject<Message>();
  MsgRepository _msgRepository ;
  Observable<Message> get outEvent => _msgController.stream;
 MsgBloc(){
   _msgRepository= MsgRepository();
   _receiveMessage();
 }
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
   
    _msgRepository.sendMessage(Message()..body=msg..senderId=id..targetId=dest..timestamp=DateTime.now().toIso8601String());


}
  void _receiveMessage(){
    _msgRepository.subscribe().pipe(_msgController);
    

}
}
