import 'package:decon/clientPages/addClient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';

import '../Utils/SizeConfig.dart';
import '../Utils/constants.dart';
import '../drawerPages.dart/drawer.dart';

class ClientList extends StatefulWidget {
  @override
  _ClientListState createState() => _ClientListState();
}

class _ClientListState extends State<ClientList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var h = SizeConfig.screenHeight / 812;
    var b = SizeConfig.screenWidth / 375;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(
              duration: Duration(milliseconds: 400),
              type: PageTransitionType.rightToLeftWithFade,
              childCurrent: ClientList(),
              child: AddClient(),
            ),
          );
        },
        backgroundColor: blc,
        child: Icon(Icons.add, color: Colors.white, size: b * 24),
      ),
      appBar: AppBar(
        elevation: 10,
        titleSpacing: -3,
        iconTheme: IconThemeData(color: blc),
        title: Text(
          "Client List",
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
          children: [
            sh(27),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
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
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    child: Container(
                      height: h * 45,
                      padding: EdgeInsets.symmetric(horizontal: b * 18),
                      width: b * 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: blc, width: 0.5),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        'images/filter.svg',
                        allowDrawingOutsideViewBox: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            sh(30),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(top: h * 5),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: h * 8),
                    padding: EdgeInsets.symmetric(
                        vertical: h * 12, horizontal: b * 0),
                    decoration: BoxDecoration(
                      color: Color(0xfff1f1f1),
                      borderRadius: BorderRadius.circular(b * 10),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                style: txtS(blc, 16, FontWeight.w700),
                              ),
                              sh(4),
                              Text(
                                'Address Address Address Address Address Address Address Address Address Address',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: txtS(dc, 14, FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'S0',
                            style: txtS(dc, 18, FontWeight.w500),
                          ),
                        ),
                      ],
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
