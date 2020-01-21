import 'package:chat/bloc/blocBase.dart';
import 'package:chat/model/appEvent.dart';
import 'package:chat/model/msg.dart';
import 'package:chat/repo/msgRepository.dart';
import 'package:rxdart/rxdart.dart';

class MsgBloc extends BlocBase{
  final _msgController = BehaviorSubject<Msg>();
  final _msgRepository = MsgRepository();
  Observable<Msg> get outEvent => _msgController.stream;

  @override
  void dipsose() {
    _msgController.close();
  }
  void dispatch(AppEvent event){
    switch (event.runtimeType){
      case SendMsgEvent:
      _sendMessage((event as SendMsgEvent).msg);
      
       break; 
    }

  }
  void _sendMessage(String msg){
    print("msg: "+msg);
    if( msg.isNotEmpty)
    _msgController.add(Msg(msg,true));
    _msgRepository.sendMessage();


}
  void _receiveMessage(String msg,String sender){
    _msgController.add(Msg(msg,false));

}
}
