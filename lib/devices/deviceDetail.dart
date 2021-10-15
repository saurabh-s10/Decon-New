import 'package:decon/devices/informationTile.dart';
import 'package:flutter/material.dart';
import '../Utils/SizeConfig.dart';
import '../Utils/constants.dart';
import '../drawerPages.dart/drawer.dart';

class DeviceDetail extends StatefulWidget {
  @override
  _DeviceDetailState createState() => _DeviceDetailState();
}

class _DeviceDetailState extends State<DeviceDetail> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          sh(29),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: b * 26),
            child: InformationTile(),
          ),
          sh(15),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: b * 26),
            child: Text(
              "Last Updated : 28/nov/2019",
              style: txtS(Color(0xff5c6266), 12, FontWeight.w400),
            ),
          ),
          sh(20),
          Expanded(
            child: ListView.builder(
                padding:
                    EdgeInsets.symmetric(horizontal: b * 26, vertical: h * 30),
                itemCount: 10,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: h * 20),
                    child: Image.asset('images/stats.jpg'),
                  );
                }),
          ),
        ]),
      ),
    );
  }
}
