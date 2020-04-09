import 'dart:convert';

import 'package:alobourse/model/search_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class SearchAnimation extends StatefulWidget{
  final Animation<double> controller;
  final setResultStatus;
//  final setSahmName;
//  final setPrice;
//  final setDescription;
  final setSearchResults;


  SearchAnimation(this.controller,this.setResultStatus, {this.setSearchResults});



  @override
  State<StatefulWidget> createState() => SearchAnimationState(this.controller);
}

class SearchAnimationState extends State<SearchAnimation>{


  String searchTerm;
  int resultstatus;
  String sahmName;
  String price;
  String description;

  final Animation increaseWidth;
  final Animation showCansel;

  final textEditingController = TextEditingController();

  SearchAnimationState(controller):
        increaseWidth = new Tween(
          begin: 60.0,
          end: 280.0
        ).animate(new CurvedAnimation(parent: controller, curve: new Interval(0.0, 0.999, curve: Curves.easeIn))),

        showCansel = new Tween(
          begin: 0.0,
          end: 200.0
        ).animate(new CurvedAnimation(parent: controller, curve: new Interval(0.0, 0.999, curve: Curves.easeIn)));



  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return new AnimatedBuilder(
      animation: widget.controller,
      builder: animationBuilder,
    );
  }
  Widget animationBuilder(BuildContext context , Widget child){
    return new Stack(
      children: <Widget>[
        new Container(
          padding: increaseWidth.value != 60.0 ? EdgeInsets.only(right: 5) : EdgeInsets.only(right: 0),
          alignment: increaseWidth.value == 60.0 ? Alignment.center :Alignment.centerRight,
          width: increaseWidth.value,
          child: new Row(
            mainAxisAlignment: increaseWidth.value >60.0 ? MainAxisAlignment.start : MainAxisAlignment.center,
            children: <Widget>[
              new Icon(Icons.search, color: Colors.white, size: 28,),
              new Container(
                padding: EdgeInsets.only(bottom: 14),
                margin: EdgeInsets.only(right: 2),
                width: showCansel.value,
                child: new TextField(
                  controller: textEditingController,
                  style: TextStyle(color: Colors.white, decoration: TextDecoration.none ),
                  decoration: new InputDecoration(
                    hintText: 'نام نماد مورد نظر خود را جستجو نمایید..',
                    hintStyle: TextStyle(fontSize: 10, color: Color(0xffe1dfdf)),
                    focusedBorder: new UnderlineInputBorder(
                        borderSide: new BorderSide(
                            color: Colors.white
                        )
                    ),
                    contentPadding: const EdgeInsets.only(right: 10),
                  ),
                  onChanged: (String value) {
                    setState(() async{
                      searchTerm = value;
                      await searchResult(value);
                    });
                  },
                ),
              )
            ],
          )
        ),
        new Positioned(
          left: 10,
          top: 15,
          child: new Visibility(
              visible: increaseWidth.value >= 280.0 ? true : false,
              child: new GestureDetector(
                onTap: (){
                  setState(() {
                    String value= '';
                    textEditingController.clear();
                    searchResult(value);
                  });
                },
                child: new Icon(Icons.clear, color: Colors.white,),
              )
          ),
        )
      ],
    );

  }



  Future searchResult(String searchTerm) async {
    List<SearchModel> searchResults = [];

    if(searchTerm==''){
      setState(() {
        resultstatus =0;
      });
    }
    else if(searchTerm.length == 1){
      setState(() {
        resultstatus = 1;
      });
    }
    else{
      final response = await http.get('http://ab.aloboorse.com/ABMobile/getsearch.php?sahmname=${searchTerm}',
          headers: { 'Accept' : 'application/json'});
      final List responsebody= jsonDecode(response.body);

      if(responsebody.length != 0){
        setState(() {
          resultstatus=2;
        });
        responsebody.forEach((var item){
          searchResults.add(SearchModel.fromjson(item));
        });


      }
      else{
        setState(() {
          resultstatus= 3;
        });
      }
    }

    widget.setResultStatus(resultstatus);
    widget.setSearchResults(searchResults);


  }

}