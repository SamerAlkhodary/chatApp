import 'package:chat/pages/chatList.dart';
import 'package:chat/proto/service.pb.dart';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHelper{

  static NotificationHelper _notification;
   FlutterLocalNotificationsPlugin eventNotification;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  static NotificationHelper build() {
    if (_notification == null) {
      _notification = NotificationHelper();
      return _notification;
    }
    return _notification;
  }

  NotificationHelper() {
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    eventNotification=FlutterLocalNotificationsPlugin();
  }

  void showMsgNotification(
      BuildContext context, User user,int msgNumber) async {
        print("scheduled");
    


    Future<dynamic> onSelectNotification(String playload) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ChatListPage(
                user: user,
                  )));
    }

    var initializationSettingsAndroid =
        new AndroidInitializationSettings("app_icon");

    var initializationSettingsIOS = new IOSInitializationSettings(
        onDidReceiveLocalNotification:
            (int id, String title, String body, payload) =>
                onSelectNotification(payload));

    var initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    eventNotification.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.Max,
        priority: Priority.High,
        ticker: 'ticker');
        

    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
       await eventNotification.show(
         0,
        "Message recieved",
        "You have $msgNumber new mesaages",
        platformChannelSpecifics,
        payload: 'item x',
        );
    
  
}
}