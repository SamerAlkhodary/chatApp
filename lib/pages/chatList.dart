import 'package:chat/bloc/blocProvider.dart';
import 'package:chat/bloc/msgBloc.dart';
import 'package:chat/model/appEvent.dart';
import 'package:chat/pages/mainPage.dart';
import 'package:chat/proto/service.pbgrpc.dart';
import 'package:flutter/material.dart';

class ChatListPage extends StatefulWidget{

  

  @override
  State<StatefulWidget> createState() => ChatListState();

}
class ChatListState extends State{
  MsgBloc _bloc;
  User user= User()
  ..name="Samer"
  ..profilePic="https://cdn0.gamesports.net/content_teasers/77000/77832.jpg?1545064880"
  ..id="1";
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
     _bloc= ServiceProvider.of(context);
     _bloc.dispatch(SubscribeEvent(user));
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      //appBar: AppBar(leading: CircleAvatar(backgroundImage: NetworkImage("https://cdn0.gamesports.net/content_teasers/77000/77832.jpg?1545064880"),radius: 1.0,),title: Text("Contacts"),backgroundColor: Colors.lightBlueAccent,),
      body: Container(
        decoration: BoxDecoration(
          //color: Colors.red,
          color: Colors.lightBlueAccent
        ),
        child: Column(
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
                  backgroundImage: NetworkImage(user.profilePic),radius: 30.0,


                ),
                 Padding(
                   padding: EdgeInsets.only(left: 10),
                   child: Text(user.name,style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white ) ,),
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
            
            child: StreamBuilder<List<Message>>(
              stream: _bloc.outEvent,
              builder: (context, snapshot) {
                return ListView(
                  children: <Widget>[
                    _listElement("Anita","2",user.id,"https://yt3.ggpht.com/a/AGF-l7-a9lpgByp7WRiqArVeoR6K7QikEmtQ6sJWIA=s900-c-k-c0xffffffff-no-rj-mo",snapshot),
                    Divider(),
                    _listElement("Amer", "0",user.id,"https://click-storm.com/i/articles/0/2712/juggernautbyvivienkad6ulep7.jpg",snapshot),
                    Divider(),
                    
                    
                  ],
                );
              }
            ),
          ),
        ),
          ],
        )
       

      ),
    );
  }

  Widget _listElement(String name,String targetId,String id, String url,AsyncSnapshot<List<Message>>snapshot){
    List<Message> list = List();
    if(snapshot.hasData){
     list = snapshot.data.where((m)=> !m.read && m.senderId!=id && m.senderId==targetId).toList();
    }


   return Container(
              padding: EdgeInsets.only(top: 20),
              
              child: ListTile(leading: Hero(
                tag:url,
                child:CircleAvatar(
              backgroundImage: NetworkImage(url),
             

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
 void _chatPressed(String name, String img,String targetId,String id,BuildContext context){
  Navigator.push(context,MaterialPageRoute(
    builder: (context)=> MyHomePage(id: id,name:name,img:img,targetId:targetId ,)
  ));

         
}


}




