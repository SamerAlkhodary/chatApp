
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

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
  TextEditingController _controller= TextEditingController();
  String name="Newbie";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        leading: Icon(Icons.person),
        backgroundColor: Colors.lightBlueAccent,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.done),onPressed: onChange,)
        ],

        title:    Container(
                      width: 300,
                      child: TextField(
                        controller: _controller,
                      decoration: InputDecoration(                        
                        border: InputBorder.none,
                        hintText: "Newbie"
                      ),
                    
                  ),
                    
             ),
      ),
      body:Container(
        child: 
           Stack(
             children: <Widget>[
               Container(

                 height: 800,
                 width: 500,
                 child: Image.network(
                   "https://mir-s3-cdn-cf.behance.net/project_modules/disp/1ce52173426833.5c08f56353039.png",
                   alignment: Alignment.topLeft,
                   fit: BoxFit.fill,
                  
                 
                 ),
               ),Padding(
                 padding: const EdgeInsets.only(top: 10),
                 child: ListView(
                   
                    children: <Widget>[
                     
                   Container(
                     height: 540,
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                            Padding(
                           
                           padding: const EdgeInsets.all(8.0),
                           child: messageList("Hello Sam"),
                         )
                         ],
                       
                     

                     ),
                   ),
                  Container(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                                              color: Colors.white,

                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      
                      
                      child: TextField(
                        decoration: InputDecoration(
                        
                          hintText: "Type a message"
                        ),
                      ),

                    ),
                  )

                    ],
                 ),
               ),
             ],
           )
         
          
        
        
      ),
      
    );
  }
  void onChange(){
    name= _controller.text;
    print(name);
    setState(() {
      
    });
  }
  Widget messageList(String msg){
    
    return Container(
      padding: EdgeInsets.all(10),
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
        bottomRight: Radius.circular(5)
        
      )

      ),
      child: Text(msg),
    );
  }

  
  
}
