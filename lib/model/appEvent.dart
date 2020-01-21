abstract class AppEvent{

}
class SendMsgEvent extends AppEvent{
  String _msg;
  SendMsgEvent(this._msg);
  String  get msg=> _msg;

}