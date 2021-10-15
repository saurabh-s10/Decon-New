import 'package:decon/deviceSettings/updatelocation.dart';
import 'package:flutter/material.dart';
import 'package:decon/Utils/constants.dart';
import 'package:decon/drawerPages.dart/drawer.dart';
import '../Utils/SizeConfig.dart';
import 'package:page_transition/page_transition.dart';

class DeviceSettings extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController manhole = TextEditingController();
  final TextEditingController critical = TextEditingController();
  final TextEditingController informative = TextEditingController();
  final TextEditingController normal = TextEditingController();
  final TextEditingController ground = TextEditingController();
  final TextEditingController temperature = TextEditingController();
  final TextEditingController battery = TextEditingController();

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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          sh(32),
          Container(
            padding: EdgeInsets.symmetric(horizontal: b * 13, vertical: h * 13),
            margin: EdgeInsets.symmetric(horizontal: b * 26),
            decoration: BoxDecoration(
              color: Color(0xfff3f3f3),
              borderRadius: BorderRadius.circular(b * 6),
            ),
            child: Row(children: [
              Text(
                "Manhole's Depth",
                style: TextStyle(
                  color: dc,
                  fontSize: b * 14,
                ),
              ),
              Spacer(),
              Row(children: [
                containerText(manhole),
                SizedBox(width: b * 5),
                textRepeat(),
              ]),
            ]),
          ),
          sh(23),
          Container(
            padding: EdgeInsets.symmetric(horizontal: b * 13, vertical: h * 13),
            margin: EdgeInsets.symmetric(horizontal: b * 26),
            decoration: BoxDecoration(
              color: Color(0xfff3f3f3),
              borderRadius: BorderRadius.circular(b * 6),
            ),
            child: Column(
              children: [
                Row(children: [
                  Text(
                    "Critical Level Above",
                    style: TextStyle(
                      color: dc,
                      fontSize: b * 14,
                    ),
                  ),
                  Spacer(),
                  Row(children: [
                    containerText(critical),
                    SizedBox(width: b * 5),
                    textRepeat(),
                  ]),
                ]),
                sh(10),
                Row(children: [
                  Text(
                    "Informative Level Above",
                    style: TextStyle(
                      color: dc,
                      fontSize: b * 14,
                    ),
                  ),
                  Spacer(),
                  Row(children: [
                    containerText(informative),
                    SizedBox(width: b * 5),
                    textRepeat(),
                  ]),
                ]),
                sh(10),
                Row(children: [
                  Text(
                    "Normal Level",
                    style: TextStyle(
                      color: dc,
                      fontSize: b * 14,
                    ),
                  ),
                  Spacer(),
                  Row(children: [
                    containerText(normal),
                    SizedBox(width: b * 5),
                    textRepeat(),
                  ]),
                ]),
                sh(10),
                Row(children: [
                  Text(
                    "Ground Level",
                    style: TextStyle(
                      color: dc,
                      fontSize: b * 14,
                    ),
                  ),
                  Spacer(),
                  Row(children: [
                    containerText(ground),
                    SizedBox(width: b * 5),
                    textRepeat(),
                  ]),
                ]),
              ],
            ),
          ),
          sh(23),
          Container(
            padding: EdgeInsets.symmetric(horizontal: b * 13, vertical: h * 13),
            margin: EdgeInsets.symmetric(horizontal: b * 26),
            decoration: BoxDecoration(
              color: Color(0xfff3f3f3),
              borderRadius: BorderRadius.circular(b * 6),
            ),
            child: Column(children: [
              Row(children: [
                Text(
                  "Temperature Threshold Value",
                  style: TextStyle(
                    color: dc,
                    fontSize: b * 14,
                  ),
                ),
                Spacer(),
                Row(children: [
                  containerText(temperature),
                  SizedBox(width: b * 5),
                  Text(
                    "\u2103         ",
                    style: TextStyle(
                      color: Color(0xff9ba1a3),
                      fontSize: b * 14,
                    ),
                  ),
                ]),
              ]),
              sh(10),
              Row(children: [
                Text(
                  "Battery Threshold Value",
                  style: TextStyle(
                    color: dc,
                    fontSize: b * 14,
                  ),
                ),
                Spacer(),
                Row(children: [
                  containerText(battery),
                  SizedBox(width: b * 5),
                  Text(
                    " %         ",
                    style: TextStyle(
                      color: Color(0xff9ba1a3),
                      fontSize: b * 14,
                    ),
                  ),
                ]),
              ]),
            ]),
          ),
          sh(58),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: b * 25),
            child: MaterialButton(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              color: blc,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(b * 6),
              ),
              onPressed: () {},
              child: Container(
                padding: EdgeInsets.symmetric(vertical: h * 10),
                alignment: Alignment.center,
                child: Text(
                  'Add Parameters',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: b * 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
          sh(14),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: b * 25),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    duration: Duration(milliseconds: 400),
                    type: PageTransitionType.rightToLeftWithFade,
                    childCurrent: DeviceSettings(),
                    child: UpdateLocation(),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: h * 10),
                decoration: BoxDecoration(
                  border: Border.all(color: blc),
                  borderRadius: BorderRadius.circular(b * 6),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Update Location',
                  style: TextStyle(
                      color: blc,
                      fontSize: b * 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Text textRepeat() {
    return Text(
      "Meters",
      style: TextStyle(
        color: Color(0xff9ba1a3),
        fontSize: SizeConfig.screenWidth * 14 / 375,
      ),
    );
  }

  Container containerText(TextEditingController controller) {
    return Container(
      alignment: Alignment.center,
      width: SizeConfig.screenWidth * 44 / 375,
      height: SizeConfig.screenHeight * 44 / 812,
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        borderRadius: BorderRadius.circular(SizeConfig.screenWidth * 4 / 375),
      ),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: SizeConfig.screenWidth * 16 / 375),
        decoration: InputDecoration(
          isDense: true,
          isCollapsed: true,
          hintText: '0',
          hintStyle: TextStyle(fontSize: SizeConfig.screenWidth * 16 / 375),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
