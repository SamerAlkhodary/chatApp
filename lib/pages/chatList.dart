
import 'dart:async';
import 'dart:typed_data';
import 'package:chat/bloc/blocProvider.dart';
import 'package:chat/bloc/msgBloc.dart';
import 'package:chat/model/appEvent.dart';
import 'package:chat/pages/addContactPage.dart';
import 'package:chat/pages/mainPage.dart';
import 'package:chat/proto/service.pbgrpc.dart';
import 'package:flutter/material.dart';
import 'package:protobuf/protobuf.dart';
import 'package:rxdart/rxdart.dart';

class ChatListPage extends StatefulWidget{
   User  user;
  ChatListPage({@required this.user,Key key}) : super(key: key);

  

  @override
  State<StatefulWidget> createState() => ChatListState();

}
class ChatListState extends State<ChatListPage>{
  MsgBloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
     _bloc= ServiceProvider.of(context);
     
     _bloc.dispatch(SubscribeEvent(widget.user));
  }
  @override
  Widget build(BuildContext context) {
    
   
  
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          //color: Colors.red,
          color: Colors.lightBlueAccent
        ),
        child: ListView(
          children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20,top: 60),
            height: 120,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage:MemoryImage(widget.user.profilePic),radius: 30.0,


                ),
                 Padding(
                   padding: EdgeInsets.only(left: 10),
                   child: Text(widget.user.name,style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white ) ,),
                 )
              ],
            ),
          ),
               
        Padding(
          padding: const EdgeInsets.only(top:50.0),
          
          child: Container(
            height: MediaQuery.of(context).size.height-170,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(60))
            ),
            
            child: StreamBuilder<List<User>>(  
               
              stream: _bloc.outContacts,//Observable.merge([_bloc.outContacts,_bloc.outEvent]),
              builder: (context, snapshot) {
                print(snapshot.data.runtimeType);
                return ListView(
                  children: 
                    snapshot.hasData ?//&& snapshot.data is List<User> ? 
                    snapshot.data.map((elem)=>_listElement(elem.name,elem.id,widget.user.id,Uint8List.fromList(elem.profilePic),snapshot)).toList():[Align(alignment: Alignment.center,child: Text("No connections"),)]
                    
                    
                    
                  
                );
              }
            ),
          ),
        ),
          ],
        )
       

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> _addContactPressed(),
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _listElement(String name,String targetId,String id, Uint8List url,AsyncSnapshot<List<User>>snapshot){
    print(name);
    print(url);
    print(id);
    List<Message> list = List();
    if(snapshot.hasData&& snapshot.data is List<Message>){
    // list = snapshot.data.where((m )=> !(m as Message).read && (m as Message).senderId!=id && (m as Message).senderId==targetId).toList();
    }


   return Container(
              padding: EdgeInsets.only(top: 20),
              
              child: ListTile(leading: Hero(
                tag:url,
                child:CircleAvatar(
              backgroundImage: MemoryImage(url),
             

            )),title: Text(name,style: TextStyle(fontWeight: FontWeight.bold),),
            onTap: ()=>_chatPressed(name,url,targetId,id,context),
            trailing: list.isNotEmpty?Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red[300]
              ),
              width: 20,
              height: 20,
              child: Center(child: Text(list.length.toString(),style: TextStyle(color: Colors.white),),)):Container(width: 10,height: 10,)
            ),
            );

}
 void _chatPressed(String name, Uint8List img,String targetId,String id,BuildContext context){
  Navigator.push(context,MaterialPageRoute(
    builder: (context)=> MyHomePage(id: id,name:name,img:img,targetId:targetId ,)
  ));

         
}
void _addContactPressed(){
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context){
      return AddContact(_bloc);
    }
  );

}


}




