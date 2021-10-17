import 'package:decon/drawerPages.dart/drawer.dart';
import 'package:flutter/material.dart';
import '../Utils/SizeConfig.dart';
import '../Utils/constants.dart';

class ManagerList extends StatefulWidget {
  @override
  _ManagerListState createState() => _ManagerListState();
}

class _ManagerListState extends State<ManagerList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var h = SizeConfig.screenHeight / 812;
    var b = SizeConfig.screenWidth / 375;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: blc,
        child: Icon(Icons.add, color: Colors.white, size: b * 24),
      ),
      appBar: AppBar(
        elevation: 10,
        titleSpacing: -3,
        iconTheme: IconThemeData(color: blc),
        title: Text(
          "Manager List",
          style: txtS(Colors.black, 16, FontWeight.w500),
        ),
        actions: [
          InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(right: b * 20),
              height: h * 32,
              width: b * 32,
              decoration: BoxDecoration(
                color: blc,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      key: _scaffoldKey,
      drawer: MyDrawer(),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: b * 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sh(27),
            Container(
              alignment: Alignment.center,
              width: b * 340,
              decoration: BoxDecoration(
                border: Border.all(color: dc, width: 0.5),
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(b * 60),
              ),
              child: TextField(
                controller: search,
                style: TextStyle(fontSize: b * 14, color: dc),
                decoration: InputDecoration(
                  prefixIcon: InkWell(
                    child: Icon(Icons.search, color: Colors.black),
                    onTap: null,
                  ),
                  isDense: true,
                  isCollapsed: true,
                  prefixIconConstraints:
                      BoxConstraints(minWidth: 40, maxHeight: 24),
                  hintText: 'Search by Name',
                  hintStyle: TextStyle(
                    fontSize: b * 14,
                    color: Color(0xff858585),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: h * 12, horizontal: b * 13),
                  border: InputBorder.none,
                ),
              ),
            ),
            sh(20),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(top: h * 10),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    child: Container(
                      margin: EdgeInsets.only(bottom: h * 8),
                      padding: EdgeInsets.symmetric(
                          vertical: h * 13, horizontal: b * 0),
                      decoration: BoxDecoration(
                        color: Color(0xfff1f1f1),
                        borderRadius: BorderRadius.circular(b * 10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: h * 50,
                              width: b * 50,
                              decoration: BoxDecoration(
                                color: Color(0xff6d6d6d),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ritesh Shukla',
                                  style: txtS(blc, 16, FontWeight.w400),
                                ),
                                Text(
                                  'ritesh.shuklalmp2018@gmail.com',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: txtS(dc, 14, FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
