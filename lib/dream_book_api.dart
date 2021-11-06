// @dart=2.9
import 'dart:convert';
import 'package:flutter/material.dart';
import 'dream_book_page_model.dart';
import 'package:http/http.dart' as http;

class DreamBookApi {
  BuildContext context;
  DreamBookApi(this.context);

  Future<DreamBookPageObj> searchDreamBook(
      {String type,
      String searchKey,
      String pageIndex,
      String pageSize}) async {
    //String lang=await DatabaseHelper.getData(DataKeyValue.language);
    searchKey = (searchKey == null || searchKey == "null") ? "" : searchKey;

    return null;
  }
}
