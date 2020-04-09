import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'alobourse_home.dart';
import 'components/check_connectivity.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'introduction.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => SplashScreenState();

}

class SplashScreenState extends State<SplashScreen> {

  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkInternet();
  }

  void timerForNavigateIntroduction(){
    var _duration= new Duration(seconds: 3);
    Timer(_duration, navigatToIntroduction);
  }

  void navigatToIntroduction(){
    Navigator.push(context, MaterialPageRoute(builder:(BuildContext context) => Introduction()));
  }

  void timerForNavigateHome(){
    var _duration= new Duration(seconds: 3);
    Timer(_duration, navigatToHome);
  }

  void navigatToHome(){
    Navigator.push(context, MaterialPageRoute(builder:(BuildContext context) => AloBourseHome()));
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      key: _scaffoldKey,
        body: new Stack(
          children: <Widget>[
            new Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/splash6.jpg', ),
                      fit: BoxFit.cover
                  )
              ),
            ),
            new Center(
              child: new Column(
//                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.only(top: 50),
                    width: 125,
                    height: 125,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                  new SizedBox(
                    height: 40,
                  ),
                  new Text('سلام', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                  new Text('به الوبورس خوش آمدید.', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),

                  new Center(
                      child: Container(
                        height: 70,
                        child: new Image.asset('assets/images/loading128.gif'),
                      )
                  )

                ],
              ),
            )
          ],
        ),
    );
  }


  checkInternet() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String welcome = prefs.getString('welcome');


    if (await checkoninternet()) {
      if(welcome == 'yes'){
        timerForNavigateHome();
      }
      else{
        timerForNavigateIntroduction();
      }
    }
    else{
      _scaffoldKey.currentState.showSnackBar(new SnackBar(
        duration: Duration(hours: 1),
        content: new GestureDetector(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Text('از اتصال خود به اینترنت مطمئن شوید!' , style: TextStyle(fontFamily: 'IranSans'),),
              new Icon(Icons.wifi_lock , color: Colors.white)
            ],
          ),
          onTap: (){
            _scaffoldKey.currentState.hideCurrentSnackBar();
            var _duration = Duration(seconds: 1);
            Timer(_duration, checkInternet);
          },
        ),

      ));
    }
  }


}