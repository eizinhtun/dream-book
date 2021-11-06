// @dart=2.9
import 'package:dream_book/dream_book_page_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'dream_book_model.dart';
import 'dream_book_presenter.dart';

class DreamBookScreen extends StatefulWidget {
  const DreamBookScreen({
    Key key,
  }) : super(key: key);
  @override
  _DreamBookScreenState createState() => _DreamBookScreenState();
}

class _DreamBookScreenState extends State<DreamBookScreen>
    implements DreamBookContract {
  static DreamBookModel dream1 =
      DreamBookModel(name: "Dragon", imgUrl: "", num1: "000", num2: "001");
  static DreamBookModel dream2 =
      DreamBookModel(name: "Dragon", imgUrl: "", num1: "002", num2: "003");
  static DreamBookModel dream3 =
      DreamBookModel(name: "Dragon", imgUrl: "", num1: "004", num2: "005");
  static DreamBookModel dream4 =
      DreamBookModel(name: "Dragon", imgUrl: "", num1: "006", num2: "007");
  static DreamBookModel dream5 =
      DreamBookModel(name: "Dragon", imgUrl: "", num1: "008", num2: "009");
  static DreamBookModel dream6 =
      DreamBookModel(name: "Dragon", imgUrl: "", num1: "010", num2: "011");
  static DreamBookModel dream7 =
      DreamBookModel(name: "Dragon", imgUrl: "", num1: "012", num2: "013");
  static DreamBookModel dream8 =
      DreamBookModel(name: "Dragon", imgUrl: "", num1: "014", num2: "015");
  static DreamBookModel dream9 =
      DreamBookModel(name: "Dragon", imgUrl: "", num1: "016", num2: "017");
  static DreamBookModel dream10 =
      DreamBookModel(name: "Dragon", imgUrl: "", num1: "018", num2: "019");
  static DreamBookModel dream11 =
      DreamBookModel(name: "Dragon", imgUrl: "", num1: "020", num2: "021");
  static DreamBookModel dream12 =
      DreamBookModel(name: "Dragon", imgUrl: "", num1: "022", num2: "023");
  static DreamBookModel dream13 =
      DreamBookModel(name: "Dragon", imgUrl: "", num1: "024", num2: "025");
  static DreamBookModel dream14 =
      DreamBookModel(name: "Dragon", imgUrl: "", num1: "026", num2: "027");
  static DreamBookModel dream15 =
      DreamBookModel(name: "Dragon", imgUrl: "", num1: "028", num2: "029");
  static DreamBookModel dream16 =
      DreamBookModel(name: "Dragon", imgUrl: "", num1: "030", num2: "031");
  static DreamBookModel dream17 =
      DreamBookModel(name: "Dragon", imgUrl: "", num1: "032", num2: "033");
  static DreamBookModel dream18 =
      DreamBookModel(name: "Dragon", imgUrl: "", num1: "034", num2: "035");
  static DreamBookModel dream19 =
      DreamBookModel(name: "Dragon", imgUrl: "", num1: "036", num2: "037");
  static DreamBookModel dream20 =
      DreamBookModel(name: "Dragon", imgUrl: "", num1: "038", num2: "039");
  static List<DreamBookModel> totalItems = [
    dream1,
    dream2,
    dream3,
    dream4,
    dream5,
    dream6,
    dream7,
    dream8,
    dream9,
    dream10,
    dream11,
    dream12,
    dream13,
    dream14,
    dream15,
    dream16,
    dream17,
    dream18,
    dream19,
    dream20,
  ];
  List<DreamBookModel> items = totalItems.sublist(0, 10);
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> selected3D = [];
  List<List<bool>> isSelectedList = [];
  Color selectBtnColor = Colors.lightBlue;
  Color unSelectBtnColor = Color(0xffE0E0E0);
  Color selectTextColor = Colors.white;
  Color unSelectTextColor = Colors.black87;

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  DreamBookPresenter _presenter;
  // bool _isSearch = false;
  bool _onFirstLoading = false;
  int pageIndex = 1;
  int pageSize = 20;
  DreamBookPageObj _page;
  TextEditingController _controllerSearch;
  String type = "2D";

  @override
  void initState() {
    super.initState();
    totalItems.forEach((f) {
      isSelectedList.add([false, false]);
    });

    _presenter = new DreamBookPresenter(this, context);
    //edit_here
    // _onFirstLoad();
  }

  void _onRefresh() async {
    print("ON Refresh");
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    this.pageIndex = 1;

    //edit_here
    // _presenter.loadData(
    //     action: "onRefresh",
    //     type: type,
    //     searchKey: _controllerSearch.text,
    //     pageIndex: this.pageIndex.toString(),
    //     pageSize: this.pageSize.toString());
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
    setState(() {});
  }

  static int i = 1;
  void _onLoading() async {
    print("ON Loading");
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    i++;
    int end = i * 10;
    if (end > totalItems.length) {
      end = totalItems.length;
    }
    // setState(() {
    //   items = totalItems.sublist(0, end);
    // });
    items = totalItems.sublist(0, end);

    print(items.length);
    //edit_here
    // if (items.length < _page.totalRows) {
    //   this.pageIndex++;
    //   _presenter.loadData(
    //       action: "onLoadMore",
    //       type: type,
    //       searchKey: _controllerSearch.text,
    //       pageIndex: this.pageIndex.toString(),
    //       pageSize: this.pageSize.toString());
    // }
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  _onFirstLoad() async {
    if (items != null) {
      items.clear();
    }

    this.pageIndex = 1;
    setState(() {
      _onFirstLoading = true;
    });
    _presenter.loadData(
        action: "onFirstLoad",
        type: type,
        searchKey: _controllerSearch.text,
        pageIndex: this.pageIndex.toString(),
        pageSize: this.pageSize.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Container(
          height: 30,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        color: Colors.white54,
        child: SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          header: WaterDropHeader(),
          footer: CustomFooter(builder: (BuildContext context, mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = Text("pull up load");
            } else if (mode == LoadStatus.loading) {
              body = CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = Text("Load Failed!Click retry!");
            } else if (mode == LoadStatus.canLoading) {
              body = Text("release to load more");
            } else {
              body = Text("No more Data");
            }

            return Container(
              height: 55.0,
              child: Center(child: body),
            );
          }),
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 150,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5),
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: items.length,
              itemBuilder: (BuildContext ctx, index) {
                return _generateItem(index, items.elementAt(index));
              }),
        ),
      ),
    );
  }

  Widget _generateItem(int index, DreamBookModel dream) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      color: Colors.white,
      elevation: 2,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.vertical(top: Radius.circular(5.0)),
            ),
            padding: EdgeInsets.all(4),
            child: Center(
              child: Text(
                dream.name,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                image: (dream.imgUrl == "")
                    ? DecorationImage(
                        image: AssetImage("assets/2D_evening.jpg"),
                        fit: BoxFit.cover,
                      )
                    : DecorationImage(
                        image: NetworkImage(dream.imgUrl),
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    bool isSelected = !selected3D.contains(dream.num1);

                    setState(() {
                      isSelectedList[index][0] = isSelected;
                      if (isSelected)
                        selected3D.add(dream.num1);
                      else
                        selected3D.remove(dream.num1);
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelectedList[index][0]
                          ? selectBtnColor
                          : unSelectBtnColor,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(5.0)),
                    ),
                    padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
                    child: Center(
                      child: Text(
                        dream.num1,
                        style: TextStyle(
                            fontSize: 18,
                            color: isSelectedList[index][0]
                                ? selectTextColor
                                : unSelectTextColor),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    bool isSelected = !selected3D.contains(dream.num2);

                    setState(() {
                      isSelectedList[index][1] = isSelected;
                      if (isSelected)
                        selected3D.add(dream.num2);
                      else
                        selected3D.remove(dream.num2);
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelectedList[index][1]
                          ? selectBtnColor
                          : unSelectBtnColor,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(5.0)),
                    ),
                    padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
                    child: Center(
                      child: Text(
                        dream.num2,
                        style: TextStyle(
                            fontSize: 18,
                            color: isSelectedList[index][1]
                                ? selectTextColor
                                : unSelectTextColor),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  void onDeleteSuccess(bool result) {
    if (result) {
      _onFirstLoad();
    }
  }

  @override
  void onFirstLoadSuccess(DreamBookPageObj page) {
    _page = page;
    items = items == null ? [] : items;
    items.clear();
    items.addAll(page.results);
    setState(() {
      _onFirstLoading = false;
    });
  }

  @override
  void onLoadMoreSuccess(DreamBookPageObj page) {
    if (mounted)
      setState(() {
        _page = page;
        items.addAll(page.results);
      });
    _refreshController.loadComplete();
  }

  @override
  void onRefreshSuccess(DreamBookPageObj page) {
    if (mounted) {
      items.clear();
      _page = page;
      items.addAll(page.results);
      setState(() {});
      _refreshController.refreshCompleted();
    }
  }

  @override
  void showError(String text) {
    if (mounted) {
      setState(() {
        _onFirstLoading = false;
      });
      _scaffoldKey.currentState.showSnackBar(new SnackBar(
          backgroundColor: Colors.red,
          content: Text("Type"
              //edit_here
              // Tran.of(context).text(text)
              )));
    }
  }

  @override
  void showMessage(String text) {
    //edit_here
    //  MessageHandel.ShowMessage(context, "", text);
  }
}
