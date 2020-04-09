import 'dart:math';

import 'package:alobourse/model/search_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchDetail extends StatefulWidget {
  SearchModel searchModel;
  SearchDetail(this.searchModel);

  @override
  State<StatefulWidget> createState() => SearchDetailState();
}

class SearchDetailState extends State<SearchDetail> {
  String randomId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    generatePassword();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Directionality(
            textDirection: TextDirection.rtl,
            child: new Scaffold(
                appBar: new AppBar(
                  title: new Text('جزئیات'),
                ),
                body: new Container(
                  child: new Stack(
                    children: <Widget>[
                      new Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/logo3.png')
                          )
                        ),
                      ),
                      FutureBuilder<String>(
                        future: searchDetail(), // a previously-obtained Future<String> or null
                        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                          List<Widget> children;
                          if (snapshot.hasData) {
                            children = <Widget>[
                              Container(
                                padding: const EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 10),
                                child: Text( snapshot.data ),
                              )
                            ];
                          } else if (snapshot.hasError) {
                            children = <Widget>[
                              new Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Icon(
                                  Icons.error_outline,
                                  color: Colors.red,
                                  size: 60,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20, left: 10),
                                child: Text('Error: ${snapshot.error}',textAlign: TextAlign.left,),
                              )
                            ];
                          } else {
                            children = <Widget>[
                              Center(
                                child: Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                              new Center(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 16),
                                  child: Text('در حال جستجو'),
                                ),
                              )
                            ];
                          }
                          return new ListView(
                            children: children,
                          );
                        },
                      )
                    ],
                  ),
                )
            )
    );
      }

  Future<String> searchDetail() async{
    final  response = await http.get("http://www.ab.aloboorse.com/ABMobile/getshow.php?id=${randomId}&SahmName=${widget.searchModel.title}");
    return response.body;

  }
  String generatePassword() {

    String _allowedChars = "";

    _allowedChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

    int i = 0;
    String _result = "";

    //Create password
    while (i < 50) {
      //Get random int
      int randomInt = Random.secure().nextInt(_allowedChars.length);
      //Get random char and append it to the password
      _result += _allowedChars[randomInt];
      i++;
    }

    setState(() {
      randomId = _result;
    });
  }


      

}