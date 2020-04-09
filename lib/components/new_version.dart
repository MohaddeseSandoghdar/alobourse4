import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

Future<Widget> showUpdateDialog(BuildContext context, String url) {

  var sizeScreen = MediaQuery.of(context).size;
  return showDialog(
      context: context,
      builder: (BuildContext context){
        return WillPopScope(
          onWillPop: (){
            Navigator.pop(context);
            askExit(context, url);
          },
          child: new Directionality(
              textDirection: TextDirection.rtl,
              child: AlertDialog(
                contentPadding:EdgeInsets.all(0),
                content: new Container(
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        width: sizeScreen.width,
                        height: 160,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/shadi.jpg', )
                            )
                        ),
//                      child: Image.asset('assets/images/shadi.jpg', fit: BoxFit.cover,),
                      ),
                      new Text('نسخه جدیدتری از الوبورس منتشر شده!', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xfff72a54)),),
                      new Container(
                        padding: const EdgeInsets.only(right: 14, left: 14),
                        margin: const EdgeInsets.only(top: 15, bottom: 25),
                        child: new Text(
                          'از اینکه همیشه ما را همراهی می‌کنید، ممنونیم. در نسخه جدید خدمات بیشتری برای شما فراهم شده است. ',
                          maxLines: 3,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      FlatButton(
                          onPressed: () async{
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            await prefs.setString('welcome', 'no');
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          child: new Container(
                            margin: const EdgeInsets.only(bottom: 30),
                            padding: const EdgeInsets.only(top:7 , bottom: 7,left: 18, right: 18),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20) ,
                                color: Color(0xff08a6b5)
                            ),
                            child: new Text('اکنون به روزرسانی شود.',
                              style: TextStyle(fontFamily: 'IranSans', color: Colors.white, fontSize: 16),),
                          )
                      ),
//                    FlatButton(
//                        onPressed: (){
//                          Navigator.pop(context);
//                        },
//                        child: new Container(
//                          margin: const EdgeInsets.only(bottom: 12),
//                          padding: const EdgeInsets.only(top:7 , bottom: 7,left: 18, right: 18),
//                          child: new Text('بعدا یادآوری کن!',
//                            style: TextStyle(fontFamily: 'IranSans', color: Color(0xff08a6b5), fontSize: 16),),
//                        )
//                    ),

                    ],
                  ),
                ),


              )
          ),
        );
      }

  ) ??
      false;
}

Future<bool> askExit(BuildContext context,String url) {
  return showDialog(
      context: context,
      builder: (context){
        return WillPopScope(
          onWillPop: (){},
          child: new Directionality(textDirection: TextDirection.rtl,
              child: AlertDialog(
                title: new Text('آیا می‌خواهید خارج شوید؟!', style: TextStyle(color: Color(0xff023059), fontSize: 16)),
                actions: <Widget>[
                  RaisedButton(
                    color: Color(0xffF2B604),
                    child: new Text('بله', style: TextStyle(color: Colors.white, fontSize: 15),),
                    onPressed: (){
                      exit(0);
                    },
                  ),
                  RaisedButton(
                      color: Color(0xffF2B604),
                      child: new Text('خیر', style: TextStyle(color: Colors.white, fontSize: 15),),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                        showUpdateDialog(context,url);
                      }
                  )
                ],
              )
          ),
        );
      }
  ) ??
      false;
}