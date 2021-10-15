import 'package:decon/devices/informationTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../Utils/SizeConfig.dart';
import '../Utils/constants.dart';
import '../drawerPages.dart/drawer.dart';

class Devices extends StatefulWidget {
  @override
  _DevicesState createState() => _DevicesState();
}

class _DevicesState extends State<Devices> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var h = SizeConfig.screenHeight / 812;
    var b = SizeConfig.screenWidth / 375;

    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        titleSpacing: -3,
        iconTheme: IconThemeData(color: blc),
        title: Text(
          "City Name",
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
        child: Column(children: [
          sh(27),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: b * 26),
            child: Row(
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
                        hintText: 'Search Devices',
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
                      width: b * 45,
                      padding: EdgeInsets.symmetric(horizontal: b * 18),
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
          ),
          sh(10),
          Expanded(
            child: ListView.builder(
                padding:
                    EdgeInsets.symmetric(horizontal: b * 26, vertical: h * 10),
                itemCount: 10,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return InformationTile();
                }),
          ),
        ]),
      ),
    );
  }
}
