// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;


class NotificationsClient{

  // static Future<bool> sendPushNotification({required String token,required String msg})async{
  //   var data = {
  //     "registration_ids":[
  //       token
  //     ],
  //     "notification":{
  //       "title":"YouCook - يوكوك",
  //       "body": msg,
  //       "android_channel_id":"pushnotificationapp",
  //       "sound": true
  //     }
  //   };
  //   final res = await http.post(
  //     Uri.parse("https://fcm.googleapis.com/fcm/send"),
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'Authorization': 'key=AAAAhpief7E:APA91bGlpnqYOvO04e2WAn8OTUJ7TCSj3KV6FSgcAGcszGo7WXGNgxhZoYFjduLZntZ6ax4p4MiWnpiAcTLd6LkJBvHE7z-xqOwL3l-tblDlWoFhOsNFyzrDQSL4938aHfEOYOq0wzla'
  //     },
  //     body: jsonEncode(data),
  //   );
  //   debugPrint("sendPushNotification: ${res.body}");
  //   if(res.statusCode==200){
  //     return true;
  //   }
  //   return false;
  // }

}