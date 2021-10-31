import 'package:decon/drawerPages.dart/drawer.dart';
import 'package:decon/peoplePages/profile.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../Utils/SizeConfig.dart';
import '../Utils/constants.dart';
import 'package:flutter_svg/svg.dart';

import 'dialogBoxAddMembers.dart';

class People extends StatefulWidget {
  @override
  _PeopleState createState() => _PeopleState();
}

class _PeopleState extends State<People> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
  var h = SizeConfig.screenHeight / 900;
    var b = SizeConfig.screenWidth / 400;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dialogBoxAddMember(context);
        },
        backgroundColor: blc,
        child: SvgPicture.asset(
          'images/AddUser.svg',
          allowDrawingOutsideViewBox: true,
        ),
      ),
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
        padding: EdgeInsets.symmetric(horizontal: b * 26),
        child: SingleChildScrollView(
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
              sh(25),
              Text(
                "Manager",
                style: txtS(dc, 14, FontWeight.w400),
              ),
              sh(8),
              Container(
                margin: EdgeInsets.only(bottom: h * 8),
                padding: EdgeInsets.symmetric(
                    vertical: h * 14.45, horizontal: b * 17),
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(b * 10),
                  border: Border.all(
                    color: Color(0xff065e87),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: h * 46,
                      width: b * 46,
                      decoration: BoxDecoration(
                        color: Color(0xff6d6d6d),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Ritesh Shukla',
                          style:
                              txtS(Color(0xff065e87), 15.51, FontWeight.w500),
                        ),
                        Text(
                          'ritesh.shuklalmp2018@gmail.com',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              txtS(Color(0xff858585), 11.63, FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              sh(16),
              Text(
                "Admin",
                style: txtS(dc, 14, FontWeight.w400),
              ),
              sh(8),
              Container(
                margin: EdgeInsets.only(bottom: h * 8),
                padding: EdgeInsets.symmetric(
                    vertical: h * 14.45, horizontal: b * 17),
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(b * 10),
                  border: Border.all(
                    color: Color(0xff065e87),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: h * 46,
                      width: b * 46,
                      decoration: BoxDecoration(
                        color: Color(0xff6d6d6d),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Admin Name',
                          style:
                              txtS(Color(0xff065e87), 15.51, FontWeight.w500),
                        ),
                        Text(
                          'ritesh.shuklalmp2018@gmail.com',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              txtS(Color(0xff858585), 11.63, FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              sh(17),
              Row(
                children: [
                  Text(
                    "Admin",
                    style: txtS(dc, 13.57, FontWeight.w400),
                  ),
                  Spacer(),
                  Text(
                    "Total:20",
                    style: txtS(Color(0xff858585), 12, FontWeight.w400),
                  ),
                ],
              ),
              ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: h * 10),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          duration: Duration(milliseconds: 400),
                          type: PageTransitionType.rightToLeftWithFade,
                          childCurrent: People(),
                          child: Profile(
                            myProfile: false,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: h * 8),
                      padding: EdgeInsets.symmetric(
                          vertical: h * 11, horizontal: b * 17),
                      decoration: BoxDecoration(
                        color: Color(0xfff1f1f1),
                        borderRadius: BorderRadius.circular(b * 10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: h * 36,
                            width: b * 36,
                            decoration: BoxDecoration(
                              color: Color(0xff6d6d6d),
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: b * 10),
                          Expanded(
                            flex: 7,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Team Member Team Member Team Member',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: txtS(dc, 15.51, FontWeight.w400),
                                ),
                                Text(
                                  'ritesh.shuklalmp2018@gmail.com',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: txtS(Color(0xff858585), 11.63,
                                      FontWeight.w400),
                                ),
                                Text(
                                  '6387246025',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: txtS(Color(0xff858585), 11.63,
                                      FontWeight.w400),
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
            ],
          ),
        ),
      ),
    );
  }
}
