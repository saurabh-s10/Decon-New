import 'package:decon/clientPages/clientList.dart';
import 'package:flutter/material.dart';
import 'package:decon/Utils/constants.dart';
import 'package:decon/drawerPages.dart/about.dart';
import 'package:decon/drawerPages.dart/contact.dart';
import 'package:decon/deviceSettings/deviceSettings.dart';
import 'package:decon/loginPages/login.dart';
import '../Utils/SizeConfig.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var h = SizeConfig.screenHeight / 812;
    var b = SizeConfig.screenWidth / 375;

    return Drawer(
      child: Container(
        color: Color(0xFFFfffff),
        child: Column(children: [
          Container(
            padding: EdgeInsets.only(
                left: b * 11, bottom: h * 35, top: h * 40, right: b * 12),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                height: h * 60,
                width: b * 60,
                decoration: BoxDecoration(
                  color: blc,
                  shape: BoxShape.circle,
                ),
              ),
              Spacer(),
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text(
                  "Nishant Singh",
                  style: txtS(blc, 18, FontWeight.w700),
                ),
                Text(
                  "ritesh.shuklalmp2018@gmail.com",
                  style: txtS(Colors.black, 12, FontWeight.w400),
                ),
              ]),
            ]),
          ),
          Container(
            color: blc,
            height: h * 0.5,
          ),
          sh(18),
          row(Icons.settings, 'Device Settings', DeviceSettings(), context),
          row(Icons.assessment, 'Statistics', Scaffold(), context),
          row(Icons.build, 'Maintainence Report', Scaffold(), context),
          //for super admin
          row(Icons.view_list, 'Client List', ClientList(), context),
          row(Icons.verified, 'About Vysion', About(), context),
          row(Icons.settings_phone, 'Contact Us', Contact(), context),
          Spacer(),
          Container(
            margin:
                EdgeInsets.only(left: b * 11, right: b * 16, bottom: h * 10),
            child: Material(
              color: Color(0xffFfffff),
              child: InkWell(
                borderRadius: BorderRadius.circular(b * 33),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return Login();
                    }),
                  );
                },
                highlightColor: Colors.red.withOpacity(0.4),
                splashColor: Colors.red.withOpacity(0.4),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: h * 14, horizontal: b * 16),
                  child: Row(
                    children: [
                      Icon(Icons.logout, color: Colors.red),
                      SizedBox(width: b * 20),
                      Text(
                        "Log Out",
                        style: txtS(Colors.red, 16, FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget row(ico, String tit, dynamic nextPage, context) {
    var h = SizeConfig.screenHeight / 812;
    var b = SizeConfig.screenWidth / 375;

    return Container(
      margin: EdgeInsets.only(left: b * 11, right: b * 16),
      child: Material(
        color: Color(0xffFfffff),
        child: InkWell(
          borderRadius: BorderRadius.circular(b * 33),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return nextPage;
              }),
            );
          },
          highlightColor: Color(0xffa9e0ff).withOpacity(0.5),
          splashColor: Color(0xffa9e0ff).withOpacity(0.5),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: h * 14, horizontal: b * 16),
            child: Row(
              children: [
                Icon(ico, color: Colors.black),
                SizedBox(width: b * 20),
                Text(
                  tit,
                  style: txtS(Colors.black, 16, FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
