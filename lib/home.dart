import 'package:decon/dropDownCity.dart';
import 'package:flutter/material.dart';
import 'package:decon/Utils/constants.dart';
import 'package:decon/drawerPages.dart/drawer.dart';
import 'Utils/SizeConfig.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController search = TextEditingController();
  bool details = false;
  bool _animate = false;
  bool _isStart = true;
  @override
  void initState() {
    super.initState();
    _isStart
        ? Future.delayed(Duration(milliseconds: 1100), () {
            setState(() {
              _animate = true;
              _isStart = false;
            });
          })
        : _animate = true;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
   var h = SizeConfig.screenHeight / 900;
    var b = SizeConfig.screenWidth / 400;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 10,
        titleSpacing: -3,
        iconTheme: IconThemeData(color: blc),
        title: DropDowncity(),
        actions: [
          InkWell(
            onTap: () {},
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
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
      drawer: MyDrawer(),
      body: Stack(alignment: Alignment.center, children: [
        Image.asset('images/m.png',
            fit: BoxFit.cover,
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth),
        Column(children: [
          sh(18),
          searchField(),
          Spacer(),
          bottomPanel(),
          sh(12),
        ]),
      ]),
    );
  }

  Widget searchField() {
    var h = SizeConfig.screenHeight / 812;
    var b = SizeConfig.screenWidth / 375;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: b * 15, vertical: h * 11),
      margin: EdgeInsets.symmetric(horizontal: b * 26),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 10,
            spreadRadius: 0,
            offset: Offset(0, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(b * 32),
      ),
      child: Row(children: [
        Icon(Icons.search, color: dc),
        Spacer(),
        Container(
          alignment: Alignment.center,
          width: b * 260,
          child: TextField(
            controller: search,
            style: TextStyle(fontSize: b * 14),
            decoration: InputDecoration(
              isDense: true,
              hintText: 'Search by Device/ ID/ location',
              hintStyle: TextStyle(
                fontSize: b * 14,
                color: Color(0xff858585),
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
      ]),
    );
  }

  Widget bottomPanel() {
    var h = SizeConfig.screenHeight / 812;
    var b = SizeConfig.screenWidth / 375;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: b * 20),
      padding: EdgeInsets.symmetric(horizontal: b * 17, vertical: h * 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(b * 10),
        color: dc,
      ),
      child: Column(children: [
        Container(
          child: Text(
            "All Devices",
            style: txtS(Colors.white, 16, FontWeight.w400),
          ),
        ),
        sh(18),
        Row(children: [
          Expanded(
            flex: 3,
            child: informationRow(Color(0xffc4c4c4), 'Ground Level', 30),
          ),
          Expanded(
            flex: 2,
            child: informationRow(Color(0xff69d66d), 'Normal Level', 50),
          ),
        ]),
        sh(20),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: informationRow(Color(0xfffcff50), 'Informative Level', 15),
            ),
            Expanded(
              flex: 2,
              child: informationRow(Color(0xffd93d3d), 'Critical Level', 05),
            ),
          ],
        ),
        sh(16),
        details
            ? AnimatedOpacity(
                duration: Duration(milliseconds: 1000),
                opacity: _animate ? 1 : 0,
                curve: Curves.easeInOutQuart,
                child: AnimatedPadding(
                  duration: Duration(milliseconds: 1000),
                  padding: _animate
                      ? EdgeInsets.all(0)
                      : const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      detailRow("Open Manholes", 50),
                      detailRow("High Temperatures", 50),
                      detailRow("Insufficient Energy", 50),
                      detailRow("Open Manholes", 50),
                    ],
                  ),
                ),
              )
            : SizedBox(),
        MaterialButton(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          color: Color(0xff3b4e58),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(b * 6),
          ),
          onPressed: () {
            setState(() {
              details = !details;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: h * 10),
            alignment: Alignment.center,
            child: Text(
              details ? 'Hide Details' : "Show Details",
              style: TextStyle(
                color: Colors.white,
                fontSize: b * 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        sh(10),
      ]),
    );
  }

  Widget informationRow(Color col, String tit, int val) {
    var h = SizeConfig.screenHeight / 812;
    var b = SizeConfig.screenWidth / 375;

    return Container(
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: col,
            radius: b * 5.5,
          ),
          SizedBox(width: b * 8),
          Text(
            tit,
            style: txtS(col, 12, FontWeight.w400),
          ),
          SizedBox(width: b * 14),
          Text(
            val.toString(),
            style: txtS(col, 12, FontWeight.w700),
          ),
        ],
      ),
    );
  }

  Container detailRow(String tit, int val) {
    var h = SizeConfig.screenHeight / 812;
    var b = SizeConfig.screenWidth / 375;

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0xff3b4e58),
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: h * 10),
      child: Row(children: [
        Text(
          tit,
          style: txtS(Colors.white, 12, FontWeight.w400),
        ),
        Spacer(),
        Text(
          val.toString(),
          style: txtS(Colors.white, 12, FontWeight.w600),
        ),
      ]),
    );
  }
}
