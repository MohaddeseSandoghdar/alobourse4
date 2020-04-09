import 'dart:io';

import 'package:alobourse/alobourse_home.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Introduction extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => IntroductionState();

}
class IntroductionState extends State<Introduction>{

  static const length = 4;
  final pageIndexNotifier = ValueNotifier<int>(0);
  bool lastPage = false;



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Directionality(
      textDirection: TextDirection.rtl,
      child: new WillPopScope(
        onWillPop: (){
          exit(0);
        },
          child: new Scaffold(
            body: Stack(
              alignment: FractionalOffset.bottomCenter,
              children: <Widget>[
                PageView(
                  onPageChanged: (int index) {
                    pageIndexNotifier.value = index;
                    if (pageIndexNotifier.value == length-1) {
                      setState(() {
                        lastPage = true;
                      });
                    }
                    else{
                      setState(() {
                        lastPage = false;
                      });
                    }
                  },

                  children: <Widget>[
                    new Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: <Color>[
                                Color(0xff11c6d7),
                                Color(0xff0d5596),

                              ]
                          ),
                        ),
                        child: new Center(
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Container(
                                width: 125,
                                height: 125,
                                child: Image.asset('assets/images/cash.png'),
                              ),
                              new SizedBox(
                                height: 80,
                              ),
                              new Text('سودآوری سهام خود را با ما تجربه کنید.',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),)
                            ],
                          ),
                        )

                    ),
                    new Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: <Color>[
                                  Color(0xff61bbdd),
                                  Color(0xff25434e),
                                ]
                            )
                        ),
                        child: new Center(
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Container(
                                width: 125,
                                height: 125,
                                child: Image.asset('assets/images/shopping.png'),
                              ),
                              new SizedBox(
                                height: 80,
                              ),
                              new Text('بهترین نقطه خرید را بیابید.',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                            ],
                          ),
                        )
                    ),
                    new Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: <Color>[
                                  Color(0xff9ceafa),
                                  Color(0xff014691),
                                ]
                            )
                        ),
                        child: new Center(
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Container(
                                width: 125,
                                height: 125,
                                child: Image.asset('assets/images/analysis.png'),
                              ),
                              new SizedBox(
                                height: 80,
                              ),
                              new Text('الگوریتم‌‌‌های شناسایی روند بازار و',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                              new Text('ساده‌ترین روش تحلیل',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                            ],
                          ),
                        )
                    ),
                    new Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: <Color>[
                                  Color(0xfff55a84),
                                  Color(0xff0689b7),
                                ]
                            )
                        ),
                        child: new Center(
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Container(
                                width: 125,
                                height: 125,
                                child: Image.asset('assets/images/idea.png'),
                              ),
                              new SizedBox(
                                height: 80,
                              ),
                              new Text('بدون نیاز به دانش و تخصص فنی',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                              new Text('راه حل‌ها را کشف کنید.',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                            ],
                          ),
                        )
                    ),
                  ],
                ),
                new Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: _buildExample1(),
                ),
                lastPage ?
                new Positioned(
                    bottom: 0,
                    left: 0,
                    child: new GestureDetector(
                        onTap: () async{
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          await prefs.setString('welcome', 'yes');
                          Navigator.push(context, MaterialPageRoute(builder: (context) => AloBourseHome()) );
                        },
                        child: new Container(
                          padding: EdgeInsets.only(bottom: 15, left: 15),
                          child: new Text('ادامه', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),),
                        )
                    )
                )
                    : new Container()

              ],
            ),

          ),

      )
    );
  }


  PageViewIndicator _buildExample1() {
    return PageViewIndicator(
      pageIndexNotifier: pageIndexNotifier,
      length: length,
      normalBuilder: (animationController, index) => Circle(
        size: 8.0,
        color: Colors.black87,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 12.0,
          color: Colors.white,
        ),
      ),
    );
  }



}