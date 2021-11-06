// @dart=2.9
class DreamBookModel {
  String name;
  String imgUrl;
  String num1;
  String num2;
  DreamBookModel({this.name, this.imgUrl, this.num1, this.num2});

  DreamBookModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imgUrl = json['imgUrl'];
    num1 = json['num1'];
    num2 = json['num2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['imgUrl'] = this.imgUrl;
    data['num1'] = this.num1;
    data['num12'] = this.num2;
    return data;
  }
}
