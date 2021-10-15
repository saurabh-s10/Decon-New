import 'package:decon/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:decon/deviceSettings/dialogBoxUpdateLocation.dart';
import 'package:decon/drawerPages.dart/drawer.dart';
import '../Utils/SizeConfig.dart';

class UpdateLocation extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var h = SizeConfig.screenHeight / 812;
    var b = SizeConfig.screenWidth / 375;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 10,
        titleSpacing: -3,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios, color: blc, size: b * 16),
        ),
        iconTheme: IconThemeData(color: blc),
        title: Text(
          "Device Settings",
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
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sh(27),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                    hintText: 'Search by Device/ ID/ location',
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
            ]),
            sh(15),
            Expanded(
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(
                      horizontal: b * 26, vertical: h * 13),
                  itemCount: 10,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return InkWell(
                      onTap: () {
                        dialogBoxUpdate(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: h * 11),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.10),
                              blurRadius: 11.31,
                              spreadRadius: 0,
                              offset: Offset(0, 0),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(b * 12),
                        ),
                        padding:
                            EdgeInsets.fromLTRB(b * 12, h * 12, b * 9, h * 12),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Device 1",
                                      style: TextStyle(
                                        fontSize: b * 18,
                                        fontWeight: FontWeight.w500,
                                        color: dc,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(2),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: dc, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(b * 2),
                                        color: Color(0xFFffffff),
                                      ),
                                      child: Text(
                                        'ID : C1_S9_D1',
                                        style: txtS(dc, 12, FontWeight.w400),
                                      ),
                                    ),
                                  ]),
                              sh(18),
                              Container(
                                width: b * 240,
                                child: Text(
                                  '981, sunder vihar, Geeta bhawan Road, Sardarpura, Jodhpur, 342003',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: b * 14,
                                    color: Color(0xff5C6266),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class Item {
  String level;
  String addr;
  String id;
  String dis;
  String batt;
  String temp;
  Item(this.level, this.addr, this.id, this.dis, this.batt, this.temp);
}
