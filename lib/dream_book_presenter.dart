// @dart=2.9
import 'dart:convert';
import 'package:flutter/material.dart';
import 'dream_book_api.dart';
import 'dream_book_page_model.dart';

abstract class DreamBookContract {
  void showError(String text);
  void showMessage(String text);
  void onFirstLoadSuccess(DreamBookPageObj page);
  void onRefreshSuccess(DreamBookPageObj page);
  void onLoadMoreSuccess(DreamBookPageObj page);
}

class DreamBookPresenter {
  DreamBookContract _view;
  DreamBookApi api;
  DreamBookPresenter(DreamBookContract classObj, BuildContext context) {
    this._view = classObj;
    api = new DreamBookApi(context);
  }

  loadData(
      {String action,
      String type,
      String searchKey,
      String pageIndex,
      String pageSize}) async {
    if (action == "onFirstLoad") {
      try {
        if ((searchKey == null || searchKey == "") && pageIndex == "1") {
          // String data = await DatabaseHelper.getData(
          //     DataKeyValue.DreamBook + type.toString());
          String data = "";

          if (data != null && data != "") {
            var obj = json.decode(data); //["data"];
            if (obj != null) {
              DreamBookPageObj model = new DreamBookPageObj.fromJson(obj);
              if (model != null && model.results.length > 0) {
                _view.onFirstLoadSuccess(model);
              }
            }
          }
        }
      } catch (e) {}
    }
    api
        .searchDreamBook(
            type: type,
            searchKey: searchKey,
            pageIndex: pageIndex,
            pageSize: pageSize)
        .then((page) {
      if (page != null) {
        switch (action) {
          case "onFirstLoad":
            {
              _view.onFirstLoadSuccess(page);
            }
            break;
          case "onRefresh":
            {
              _view.onRefreshSuccess(page);
            }
            break;
          default:
            {
              _view.onLoadMoreSuccess(page);
            }
            break;
        }
      } else {
        _view.showError("no_data");
      }
    }).catchError((error) {
      String msg = error.toString();
      try {
        msg = msg.replaceAll("Exception:", "");
      } catch (error) {}
      _view.showError(msg);
    });
  }
}
