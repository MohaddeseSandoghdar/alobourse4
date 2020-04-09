import 'dart:convert';
import 'package:flutter/material.dart' ;
import 'package:alobourse/components/search_card.dart';
import 'package:alobourse/model/search_model.dart';


class SearchPage extends StatefulWidget{
  int resultstatus;
  String sahmName;
  String price;
  String description;
  List searchResults;
  SearchPage(this.resultstatus , {this.searchResults});

  @override
  State<StatefulWidget> createState() => SearchPageState();

}
class SearchPageState extends State<SearchPage> {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
//      padding: EdgeInsets.only(top: 30),
//      color: Color(0xffF2F2F2),
      child: buildSearchWidget(),
      
    );

  }

  Widget buildSearchWidget(){
    if(widget.resultstatus == 0){
      return new Container();
    }else if(widget.resultstatus == 1){
      return new Container(
          height: 90,
          margin: EdgeInsets.only(bottom: 8, right: 8, left: 8),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xff08a6b5)),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white
          ),
          child: new Container(
            alignment: Alignment.center,
            child:
              new Text(
                  'عبارت جستجو بسیار کوتاه است. از حروف بیشتری برای جستجو استفاده نمایید.',
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.center,

      )

          )
      );

    }
    else if(widget.resultstatus == 2){
      return new Expanded(
          child: new ListView.builder(
              itemCount: widget.searchResults.length ,
              itemBuilder: (BuildContext context, int index){
                return SearchCard(widget.searchResults[index]);

              }
          )
      );
    }
    else if(widget.resultstatus == 3){
      return new Container(
          height: 90,
          margin: EdgeInsets.only(bottom: 8, right: 8, left: 8),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xff08a6b5)),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white
          ),
          child: new Container(
              alignment: Alignment.center,
              child:
              new Text(
                'در حال حاضر برای سهم مورد نظر شما تحلیلی وجود ندارد و به زودی در لیست تحلیل‌های نرم‌افزار الوبورس قرار خواهد گرفت.',
                maxLines: 3,
                style: TextStyle(),
                textAlign: TextAlign.center,
              )

          )
      );

    }
  }

}