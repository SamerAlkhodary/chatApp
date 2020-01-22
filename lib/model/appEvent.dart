abstract class AppEvent{

}
class SendMsgEvent extends AppEvent{
  String _msg;
  String _id;
  String _target;
  SendMsgEvent(this._msg,this._id,this._target);
  String  get msg=> _msg;
   String  get id=> _id;
    String  get target=> _target;

}