import 'package:flutter/material.dart';

class SearchModel {
  String title;
  String price;
  String description;
  SearchModel(this.title, this.price, this.description);

  SearchModel.fromjson(Map<String , dynamic> parsedjson){
    title = parsedjson['SahmName'];
    price = parsedjson['Price'];
    description = parsedjson['Description'];

  }
}
