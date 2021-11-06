// @dart=2.9
import 'dream_book_model.dart';

class DreamBookPageObj {
  List<DreamBookModel> results;
  int totalRows;
  int pageNumber;
  int rowsOfPage;

  DreamBookPageObj(
      {this.results, this.totalRows, this.pageNumber, this.rowsOfPage});

  DreamBookPageObj.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results.add(new DreamBookModel.fromJson(v));
      });
    }
    totalRows = json['totalRows'];
    pageNumber = json['pageNumber'];
    rowsOfPage = json['rowsOfPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    data['totalRows'] = this.totalRows;
    data['pageNumber'] = this.pageNumber;
    data['rowsOfPage'] = this.rowsOfPage;
    return data;
  }
}
