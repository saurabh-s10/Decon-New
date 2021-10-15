import 'package:flutter/material.dart';
import 'package:decon/drawerPages.dart/drawer.dart';
import 'package:flutter_svg/svg.dart';
import '../Utils/SizeConfig.dart';
import '../Utils/constants.dart';

class Contact extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController message = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var h = SizeConfig.screenHeight / 812;
    var b = SizeConfig.screenWidth / 375;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        drawer: MyDrawer(),
        appBar: AppBar(
          titleSpacing: -3,
          elevation: 10,
          iconTheme: IconThemeData(color: blc),
          title: Text(
            "Contact Us",
            style: txtS(Colors.black, 16, FontWeight.w500),
          ),
          actions: [
            InkWell(
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
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: b * 28),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('images/contact.png', height: h * 231),
                ],
              ),
              Row(children: [
                SvgPicture.asset(
                  'images/location.svg',
                  allowDrawingOutsideViewBox: true,
                ),
                SizedBox(width: b * 11),
                Text(
                  "SVNIT Campus, Surat, Gujarat",
                  style: txtS(dc, 14, FontWeight.w400),
                ),
              ]),
              sh(10),
              Row(children: [
                SvgPicture.asset(
                  'images/message.svg',
                  allowDrawingOutsideViewBox: true,
                ),
                SizedBox(width: b * 11),
                Text(
                  "vysiontechnology@gmail.com",
                  style: txtS(dc, 14, FontWeight.w400),
                ),
              ]),
              sh(49),
              Text(
                "Get In Touch",
                style: txtS(dc, 20, FontWeight.w500),
              ),
              sh(30),
              Container(
                alignment: Alignment.center,
                child: TextField(
                  maxLines: 1,
                  controller: email,
                  style: TextStyle(fontSize: b * 14),
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: 'Enter E-Mail',
                    hintStyle: TextStyle(fontSize: b * 14),
                  ),
                ),
              ),
              sh(20),
              Container(
                padding: EdgeInsets.fromLTRB(b * 10, 0, 0, 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xffbebebe), width: b * 1),
                  borderRadius: BorderRadius.circular(b * 3),
                ),
                child: TextField(
                  controller: message,
                  maxLines: null,
                  minLines: 7,
                  style: TextStyle(fontSize: b * 14),
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: 'Type your message here....',
                    hintStyle:
                        TextStyle(fontSize: b * 14, color: Color(0xff858585)),
                    border: InputBorder.none,
                  ),
                ),
              ),
              sh(27),
              MaterialButton(
                color: blc,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(b * 6),
                ),
                onPressed: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: h * 11),
                  alignment: Alignment.center,
                  child: Text(
                    'Send',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: b * 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
