import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MediaHandler extends StatefulWidget {
  Function onPressed;
  MediaHandler({ @required this.onPressed});
  @override
  State<StatefulWidget> createState() => MediaHandlerState();
}

class MediaHandlerState extends State<MediaHandler> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      
      insetAnimationCurve: Curves.bounceIn,
      backgroundColor: Colors.lightBlueAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        height: MediaQuery.of(context).size.height / 4,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              child: InkWell(
                onTap: ()=> widget.onPressed(0),
                child: Image.asset('assets/icons/image.png',width: 20,height: 20,),
              ),
              height: MediaQuery.of(context).size.width * 0.8 / 3.5,
              width: MediaQuery.of(context).size.width * 0.8 / 3.5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0)),
            ),
            Container(
              child: InkWell(
                 onTap: ()=>widget.onPressed(1),
                child: Image.asset("assets/icons/vid.png"),
              ),
              height: MediaQuery.of(context).size.width * 0.8 / 3.5,
              width: MediaQuery.of(context).size.width * 0.8 / 3.5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0)
                  ),
            ),
            Container(
              child: InkWell(
                 onTap: ()=>widget.onPressed(2),
                child: Image.asset("assets/icons/cam.png"),
              ),
              height: MediaQuery.of(context).size.width * 0.8 / 3.5,
              width: MediaQuery.of(context).size.width * 0.8 / 3.5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0)),
            )
          ],
        ),
      ),
    );
  }
}
