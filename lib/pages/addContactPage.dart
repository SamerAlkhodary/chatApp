import 'package:chat/bloc/msgBloc.dart';
import 'package:chat/model/appEvent.dart';
import 'package:chat/model/error.dart' as prefix0;
import 'package:chat/proto/service.pbgrpc.dart';
import 'package:flutter/material.dart';

class AddContact extends StatefulWidget {
  MsgBloc _msgBloc;
  AddContact(this._msgBloc);
  @override
  State<StatefulWidget> createState() => AddContactState();
}

class AddContactState extends State<AddContact> {
  TextEditingController _controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetAnimationCurve: Curves.bounceIn,
      
      
      backgroundColor: Colors.lightBlueAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        height: MediaQuery.of(context).size.height /3,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: StreamBuilder<List<User>>(
          stream: widget._msgBloc.outContacts,
          builder: (context, snapshot) {
            return ListView(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 3 * 0.30,
                  child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "Add Contact",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                ),
                Container(
                    height: MediaQuery.of(context).size.height / 3 * 0.7,
                    width: MediaQuery.of(context).size.width * 0.80,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20.0),
                            bottomLeft: Radius.circular(20.0))),
                    child: ListView(
                      children: <Widget>[
                        SizedBox(height: 15,),
                        
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: TextField(
                                controller: _controller,
                                decoration: InputDecoration(
                                  labelText: "username"
                                  , errorText: snapshot.hasError? (snapshot.error as prefix0.Error).message :null),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:24),
                          child: Align(
                            alignment: Alignment.center,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: Colors.lightBlueAccent,
                              onPressed: () => _addPressed(snapshot),
                              child: Text("Add"),
                            ),
                          ),
                        )
                      ],
                    )),
              ],
            );
          }
        ),
      ),
    );
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  void _addPressed(AsyncSnapshot<List<User>> snapshot){
    
    widget._msgBloc.dispatch(AddContactEvent(_controller.text.trim().toLowerCase()));
    //Navigator.pop(context);


  }
}
