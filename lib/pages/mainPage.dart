import 'package:chat/bloc/blocProvider.dart';
import 'package:chat/bloc/msgBloc.dart';
import 'package:chat/model/appEvent.dart';
import 'package:chat/model/msg.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  String name,img;

  MyHomePage({@required  this.name,@required  this.img,Key key,}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MsgBloc _msgBloc;
    TextEditingController _controllerSend = TextEditingController();
    double msgBoxWidth;


  List<Msg> messages= List();
  @override
  void initState() {
    super.initState();
    msgBoxWidth=100;

  }
  
  @override
  Widget build(BuildContext context) {

       _msgBloc= ServiceProvider.of(context);
           



    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        leading:Hero(
          tag:widget.img,
          child: CircleAvatar(backgroundImage: NetworkImage(widget.img),)),
        backgroundColor: Colors.lightBlueAccent,
       actions: <Widget>[
         IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: ()=>Navigator.pop(context),)
       ],
        title: Container(
          width: 300,
          child: Text(widget.name)
          ),
        ),
      
      body: Container(
          child: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: 500,
            child: Image.network(
              "https://mir-s3-cdn-cf.behance.net/project_modules/disp/1ce52173426833.5c08f56353039.png",
              alignment: Alignment.topLeft,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ListView(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height*0.75,
                  child: StreamBuilder<Msg>(
                    stream: _msgBloc.outEvent,
                    builder: (context, snapshot) {
                       if(snapshot.hasData){
                                  messages.add(snapshot.data);
                                  messages.forEach((f)=> print(f.message));
                                  return ListView(
                                   children: messages.map((m)=> Padding(child:messageList(m.message,m.userSent),padding: EdgeInsets.all(5))).toList()
,
                                  );
                        }else {
                          
                          return Container(height: 10,);
                        }
                      
                     
                    }
                  ),
                ),
                Container(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width*0.85,
                          child: TextField(
                            
                            controller: _controllerSend,
                            decoration: InputDecoration(hintText: "Type a message"),
                          ),
                        ),
                        IconButton(icon: Icon(Icons.send),onPressed:()=> onSend(),iconSize: 15,)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
  

  
  void onSend(){
        _msgBloc.dispatch(SendMsgEvent(_controllerSend.text));

    print(_controllerSend.text);
    _controllerSend.clear();

  }

  Widget messageList(String msg,bool userSender) {

   
    
    return Align(
      alignment: userSender?Alignment.topRight:Alignment.topLeft,
          child: Padding(
        padding:  EdgeInsets.only(left:5,right: 5,top: 5,bottom: 5),
        child: Container(
          padding: EdgeInsets.all(10),
          constraints: BoxConstraints( minWidth: 100,maxWidth: 300),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 20.0, // has the effect of softening the shadow
                  spreadRadius: 5.0, // has the effect of extending the shadow
                  offset: Offset(
                    2.0, // horizontal, move right 10
                    2.0, // vertical, move down 10
                  ),
                )
              ],
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                 bottomRight:userSender?Radius.circular(0):Radius.circular(5),
                bottomLeft:userSender?Radius.circular(5):Radius.circular(0))),
                 
                 
                 
                
          child: RichText(
            textAlign:TextAlign.justify, 
            text: TextSpan(
            
            children:<TextSpan>[
              TextSpan(
                text:msg, style: TextStyle(
                  fontSize:13,
                  color: Colors.black
                )
              )

            ]
          ),

          ),
        ),
      ),
    );
  }
}
