import 'package:flutter/material.dart';

import 'contact_us.dart';


Widget buildDrawerLayout(BuildContext context){
  var sizeScreen= MediaQuery.of(context).size;
  return new SizedBox(
    width: sizeScreen.width * 0.75,
    child: new Drawer(
      elevation: 30.0,
      child: new ListView(
        children: <Widget>[
          new DrawerHeader(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: new Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  new Container(
                    width: sizeScreen.width,
                    height: sizeScreen.height,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/images/drawer3.jpg',), fit: BoxFit.cover )
                    ),
                  ),
                  new Positioned(
                      bottom: 6.0,
                      left: 10.0,
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new SizedBox(
                            width: 50,
                            height: 50,
                            child: new Image.asset('assets/images/logo.png'),
                          ),
                        ],
                      ))
                ],
              )
          ),
          new Container(
            padding: EdgeInsets.only(top:20),
            width: sizeScreen.width,
            height: sizeScreen.height,
            child: new Column(
              children: <Widget>[
                new ListTile(
                  onTap: (){
                    Navigator.pop(context);
                    contactUs(context);
                  },
                  leading: new Container(
                    margin: EdgeInsets.only(right: 12),
                    child: new Icon(IconData(0xe839, fontFamily: 'MyFlutterApp'),color: Color(0xff023059),),
                  ),
                  title: new Text('پشتیبانی', style: TextStyle(color: Color(0xff023059), fontSize: 18),),
                ),
//                new ListTile(
//                  leading: new Icon(IconData(0xf234, fontFamily: 'MyFlutterApp'), color: Color(0xff023059),),
//                  title: new Text('ثبت نام اولیه و واریز وجه', style: TextStyle(color: Color(0xff023059), fontSize: 16),),
////                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));},
//                ),
//                new ListTile(
//                  leading: new Icon(IconData(0xe809, fontFamily: 'MyFlutterApp'), color: Color(0xff023059),),
//                  title: new Text('احراز هویت و عقد قرارداد', style: TextStyle(color: Color(0xff023059), fontSize: 16),),
//                ),
//                new ListTile(
//                  leading: new Icon(IconData(0xf1fe, fontFamily: 'MyFlutterApp'), color: Color(0xff023059),),
//                  title: new Text('ارزیابی ریسک‌پذیری', style: TextStyle(color: Color(0xff023059), fontSize: 16),),
//                ),
              ],
            ),
          ),



        ],
      ),
    )
  );
}
