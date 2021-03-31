import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Services {
  static showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => new Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10.0),
            color: Color(0xFFECF0F5),
          ),
          height: 100,
          width: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CupertinoActivityIndicator(
                radius: 15,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Please wait",
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }

  static Future save_record(BuildContext context, name, email, country) async {
    showLoadingDialog(context);

    String url = Uri.encodeFull(
        "https://a4b2180d68709437f526216fa9962bbb.m.pipedream.net");

    var body = json.encode({'name': name, 'email': email, 'country': country});

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    var response =
        await http.Client().post(Uri.parse(url), headers: headers, body: body);
    Map<String, dynamic> result = json.decode(response.body);
    if(result['success'] == true){
      Navigator.pop(context);
      return result['success'];
    }else{
      Navigator.pop(context);
      return false;
    }
  }
}
