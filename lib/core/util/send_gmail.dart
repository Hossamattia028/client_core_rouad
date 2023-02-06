import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SendGmail{

 static Future<bool> sendEmailMessage(String bodyMsg,String userDetails,String userEmail,String subject) async{
    try{
      final response = await http.post(Uri.parse("https://api.smtp2go.com/v3/email/send"),
          body: jsonEncode({
            "api_key": "api-5FFBA65E2C4E11ECA702F23C91C88F4E",
            "to": ["Person <info@youcooksa.com>"],
            "sender": "YouCook <$userEmail>",
            "subject": subject,
            "text_body": "",
            "html_body": "<h1> $userDetails  \n $bodyMsg</h1>",
            "custom_headers": [
              {
                "header": "Reply-To",
                "value": "Actual Person <$userEmail>"
              }
            ]
          })
      );
      debugPrint("sendGmailResponseToAdmin:  ${response.body}");
      if(response.statusCode==200)return true;
      return false;
    }catch(e){
      debugPrint("sendEmailMessage: $e");
      return false;
    }
  }

}