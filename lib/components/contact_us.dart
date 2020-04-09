import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



Future<bool> contactUs(BuildContext context){
  return showDialog(
      context: context,
      builder: (BuildContext context){
        return new Directionality(
            textDirection: TextDirection.rtl,
            child: AlertDialog(
              contentPadding:EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(15)),
              content: new Container(
                padding: EdgeInsets.only(top: 20, bottom: 20, right: 18, left: 15),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Color(0xff08a6b5),
                          Color(0xff023059)
                        ]
                    ),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Container(
                      margin: EdgeInsets.only(bottom: 10),
                      alignment: Alignment.centerRight,
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Text('آدرس وب‌سایت:   ', style: TextStyle(color: Colors.white, fontSize: 14,), ),
                          GestureDetector(
                            onTap: () async{
                              await _socialUrl("http://www.aloboorse.com/");
                            },
                            child: Text('www.aloboorse.com', style: TextStyle(color: Colors.white, fontSize: 14, decoration: TextDecoration.underline,),),
                          ),
                        ],
                      ),
                    ),
                    new Container(
                      margin: EdgeInsets.only(bottom: 10),
                      alignment: Alignment.centerRight,
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Text('کانال تلگرام:   ', style: TextStyle(color: Colors.white, fontSize: 14,), ),
                          GestureDetector(
                            onTap: () async{
                              await _socialUrl("http://t.me/AloBoorse");
                            },
                            child: Text('AloBoorse@', style: TextStyle(color: Colors.white, fontSize: 14, decoration: TextDecoration.underline,),),
                          ),
                        ],
                      ),
                    ),
                    new Container(
                      margin: EdgeInsets.only(bottom: 10),
                      alignment: Alignment.centerRight,
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Text('صفحه اینستاگرام:   ', style: TextStyle(color: Colors.white, fontSize: 14,), ),
                          GestureDetector(
                            onTap: () async{
                              await _socialUrl("http://instagram.com/AloBoorse");
                            },
                            child: Text('AloBoorse@', style: TextStyle(color: Colors.white, fontSize: 14, decoration: TextDecoration.underline,),),
                          ),
                        ],
                      ),
                    ),
                    new Container(
                        margin: EdgeInsets.only(bottom: 10),
                        alignment: Alignment.centerRight,
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Text('آدرس ایمیل:   ', style: TextStyle(color: Colors.white, fontSize: 14),),
                            GestureDetector(
                              onTap: () async{
                                await _socialUrl("http://gmail.com");
                              },
                              child: Text('aloboorse@gmail.com', style: TextStyle(color: Colors.white, fontSize: 14, decoration: TextDecoration.underline,),),
                            ),

                          ],
                        )
                    ),

                    new Container(
                      margin: EdgeInsets.only(bottom: 10),
                      alignment: Alignment.centerRight,
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Text('شماره تلفن:   ', style: TextStyle(color: Colors.white, fontSize: 14,), ),
                          GestureDetector(
                            onTap: () async{
                              await _socialUrl("tel:09380316338");
                            },
                            child: Text('09380316338', style: TextStyle(color: Colors.white, fontSize: 14, decoration: TextDecoration.underline,),),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),


            )
        );
      }

  ) ??
      false;
}

_socialUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}