import 'dart:convert';
import 'dart:io';
import 'dart:io' show Platform, stdout;
import 'package:alobourse/pages/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:alobourse/components/drawer.dart';
import 'package:http/http.dart' as http;
import 'components/check_connectivity.dart';
import 'components/contact_us.dart';
import 'components/new_version.dart';
import 'components/search_animation.dart';
import 'package:package_info/package_info.dart';
import 'dart:async';


class AloBourseHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AloBourseHomeState();
}

class AloBourseHomeState extends State<AloBourseHome> with SingleTickerProviderStateMixin{

  String searchTerm;
  int resultstatus = 0;
  String sahmName;
  String price;
  String description;
  List searchResults=[];
  var platform = new Platform();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  AnimationController animationController;


  setResultStatus (int value){
    setState(() {
      resultstatus = value;
    });
  }

  setSearchResults(List value){
    if(searchResults.length != 0){
      searchResults.clear();
      searchResults.addAll(value);
    }
    else{
      setState(() {
        searchResults.addAll(value);
      });
    }

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkVersion();
    animationController = new AnimationController(vsync: this, duration: new Duration(milliseconds: 1000));
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }


  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return new Directionality(
        textDirection: TextDirection.rtl,
        child: new WillPopScope(
          onWillPop: _onWillPop,
          child: new Scaffold(
            key: scaffoldKey,
            resizeToAvoidBottomInset: false,
              appBar: new AppBar(
                title: new Text('الوبورس'),
                iconTheme: new IconThemeData(color: Colors.white),
                actions: <Widget>[
                  new PopupMenuButton(
                      onSelected: (value) async{
                        if(value=='settings'){
                          contactUs(context);
                        }
                        else if (value=='logout'){
                          _onWillPop();
                        }
                      },
                      itemBuilder: (BuildContext context){
                        return <PopupMenuItem>[
//                          new PopupMenuItem(
//                            child: new Align(
//                              alignment: Alignment.centerRight,
//                              child: new Text('پشتیبانی'),
//                            ),
//                            value:'settings' ,
//                          ),
                          new PopupMenuItem(
                            child: new Align(
                              alignment: Alignment.centerRight,
                              child: new Text('خروج'),
                            ),
                            value: 'logout',
                          ),
                        ];
                      }
                  ),
                ],
              ),
              drawer: buildDrawerLayout(context),
              body: new Container(
                color: Color(0xffF2F2F2),
                padding: const EdgeInsets.only(top: 30, bottom: 5, right: 7, left: 8),
                child: new Column(
                  children: <Widget>[
                    new GestureDetector(
                      onTap: () async{
                        await animationController.forward();
                      },
                      child: new Container(
                        margin: const EdgeInsets.only(bottom: 30),
                        height: 55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff0087B2)
                        ),
                        child: SearchAnimation(animationController,setResultStatus,setSearchResults: setSearchResults),
                      ),
                    ),
                    new Directionality(
                      textDirection: TextDirection.rtl,
                      child: SearchPage(resultstatus, searchResults: searchResults, ),),
                  ],
                ),
              )
          )
        )
    );
  }


//  Future<int>searchResult(String searchTerm) async {
//    final response = await http.get('http://ab.aloboorse.com/ABMobile/getsearch.php?sahmname=${searchTerm}',
//        headers: { 'Accept' : 'application/json'});
//    final responsebody= response.body;
//
//    if(searchTerm==''){
//      setState(() {
//        resultstatus =0;
//      });
//    }
//    else if(response.body != 'null'){
//      setState(() {
//        resultstatus = 2;
//      });
//      sahmName = jsonDecode(responsebody)['SahmName'];
//      price =jsonDecode(responsebody)['Price'];
//    }
//    else {
//      setState(() {
//        resultstatus = 1;
//      });
//    }
//    return (resultstatus);
//  }


  Future<bool> _onWillPop() {
    return showDialog(
        context: context,
        builder: (context){
          return new Directionality(textDirection: TextDirection.rtl,
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
                    onPressed: () => Navigator.of(context).pop(false),
                  )
                ],
              )
          );
        }
    ) ??
        false;
  }

  void checkVersion() async {
    String currentVersion;
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
       currentVersion = packageInfo.version;

      if(Platform.isAndroid){
        final answer = await http.get('http://www.ab.aloboorse.com/ABMobile/firstenter.php?os=android&version=${currentVersion}',
            headers: { 'Accept' : 'application/json'});
        String androidNewVersionLink = jsonDecode(answer.body)['Link'];
        if (androidNewVersionLink == ''){

        }
        else{
          FocusScope.of(context).requestFocus(FocusNode());

          await showUpdateDialog(context, androidNewVersionLink);
        }
      }
      else if(Platform.isIOS){
        final answer = await http.get('http://www.ab.aloboorse.com/ABMobile/firstenter.php?os=ios&version=${currentVersion}',
            headers: { 'Accept' : 'application/json'});
        String iosNewVersionLink = jsonDecode(answer.body)['Link'];
        if (iosNewVersionLink == ''){
        }
        else{
          await showUpdateDialog(context, iosNewVersionLink);
        }
      }



  }




}