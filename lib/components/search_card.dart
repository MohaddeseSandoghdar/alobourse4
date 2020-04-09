import 'package:alobourse/model/search_model.dart';
import 'package:alobourse/search_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchCard extends StatelessWidget {
  SearchModel searchModel;
  SearchCard(this.searchModel);
  
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      margin: EdgeInsets.only(bottom: 8, right: 8, left: 8),
      padding: EdgeInsets.only(top: 8, bottom: 8, right: 15),
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xff08a6b5)),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white
      ),
      child: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Text(searchModel.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15) ,textAlign: TextAlign.right,),
              new Text('  (${searchModel.description})', style: TextStyle( fontSize: 13) ,textAlign: TextAlign.right,),
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Row(
                    children: <Widget>[
                      new Text(searchModel.price, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15), textAlign: TextAlign.right,),
                      new Container(
                        margin: EdgeInsets.only(right:5),
                        child: new Text('ریال', style: TextStyle(fontSize: 15),),
                      )
                    ],
                  ),
              FlatButton(
                  onPressed: (){
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SearchDetail(this.searchModel)));
                  },
                  child: new Container(
                    padding: const EdgeInsets.only(top:5 , bottom: 5,left: 0, right: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7) ,
                        color: Color(0xff08a6b5)
                    ),
                    child: new Row(
                      children: <Widget>[
                        new Text('جزئیات بیشتر',
                          style: TextStyle(fontFamily: 'IranSans', color: Colors.white, fontSize: 12),),
                        new Icon(Icons.navigate_next, color: Colors.white,),
                      ],
                    ),
                  )
              ),

            ],
          ),

        ],
      )


//      new Row(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        children: <Widget>[
//          new Column(
//            children: <Widget>[
//              new Row(
//                children: <Widget>[
//                  new Text(searchModel.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15) ,textAlign: TextAlign.right,),
//                ],
//              ),
//              new Row(
//                children: <Widget>[
//                  new Text('(${searchModel.description})', style: TextStyle( fontSize: 13) ,textAlign: TextAlign.right,),
//                ],
//              ),
//              new Row(
//                children: <Widget>[
//                  new Text(searchModel.price, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15), textAlign: TextAlign.right,),
//                  new Container(
//                    margin: EdgeInsets.only(right:5),
//                    child: new Text('ریال', style: TextStyle(fontSize: 15),),
//                  )
//                ],
//              ),
//
//            ],
//          ),
//          new Column(
//            children: <Widget>[
//              FlatButton(
//                  onPressed: (){
//                    FocusScopeNode currentFocus = FocusScope.of(context);
//                    if (!currentFocus.hasPrimaryFocus) {
//                      currentFocus.unfocus();
//                    }
//                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SearchDetail(this.searchModel)));
//                  },
//                  child: new Container(
//                    padding: const EdgeInsets.only(top:5 , bottom: 5,left: 0, right: 5),
//                    decoration: BoxDecoration(
//                        borderRadius: BorderRadius.circular(7) ,
//                        color: Color(0xff08a6b5)
//                    ),
//                    child: new Row(
//                      children: <Widget>[
//                        new Text('جزئیات بیشتر',
//                          style: TextStyle(fontFamily: 'IranSans', color: Colors.white, fontSize: 12),),
//                        new Icon(Icons.navigate_next, color: Colors.white,),
//                      ],
//                    ),
//                  )
//              ),
//            ],
//          )
//        ],
//      )
    );
  }
  
}