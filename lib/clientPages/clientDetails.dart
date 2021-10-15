import 'package:decon/devices/dialogBoxNoData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../Utils/SizeConfig.dart';
import '../Utils/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shape_of_view/shape_of_view.dart';

class ClientDetails extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var h = SizeConfig.screenHeight / 812;
    var b = SizeConfig.screenWidth / 375;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios, color: blc, size: b * 16),
        ),
        elevation: 10,
        titleSpacing: -3,
        iconTheme: IconThemeData(color: blc),
        title: Text(
          "Client Name",
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
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: h * 211,
              child: Stack(
                children: [
                  ShapeOfView(
                    elevation: 2,
                    height: h * 190,
                    shape: DiagonalShape(
                      position: DiagonalPosition.Bottom,
                      direction: DiagonalDirection.Left,
                      angle: DiagonalAngle.deg(angle: 18),
                    ),
                    child: Container(
                      color: Color(0xffc1ebff),
                    ),
                  ),
                  Positioned(
                    top: h * 69,
                    left: b * 20,
                    child: Row(
                      children: [
                        Container(
                          height: h * 141,
                          width: b * 141,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(color: Colors.white, width: 5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                blurRadius: 16,
                                spreadRadius: 0,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://images.unsplash.com/photo-1517423440428-a5a00ad493e8',
                            fit: BoxFit.cover,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: b * 20),
                        Text(
                          "Aditya Vikram Singh",
                          style: txtS(blc, 20, FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            sh(63),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: b * 26),
              child: Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'images/work.svg',
                        allowDrawingOutsideViewBox: true,
                      ),
                      SizedBox(width: b * 5),
                      Text(
                        "Department name",
                        style: txtS(Color(0xff626262), 16, FontWeight.w400),
                      ),
                      Spacer(),
                      Text(
                        "Management",
                        style: txtS(dc, 16, FontWeight.w400),
                      ),
                    ],
                  ),
                  sh(28),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'images/location2.svg',
                        allowDrawingOutsideViewBox: true,
                      ),
                      SizedBox(width: b * 5),
                      Text(
                        "Location",
                        style: txtS(Color(0xff626262), 16, FontWeight.w400),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: b * 24, top: h * 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "City",
                              style:
                                  txtS(Color(0xff626262), 16, FontWeight.w400),
                            ),
                            Spacer(),
                            Text(
                              "Jodhpur",
                              style: txtS(dc, 16, FontWeight.w400),
                            ),
                          ],
                        ),
                        SizedBox(height: h * 5),
                        Row(
                          children: [
                            Text(
                              "District",
                              style:
                                  txtS(Color(0xff626262), 16, FontWeight.w400),
                            ),
                            Spacer(),
                            Text(
                              "Jaipur",
                              style: txtS(dc, 16, FontWeight.w400),
                            ),
                          ],
                        ),
                        SizedBox(height: h * 5),
                        Row(
                          children: [
                            Text(
                              "State",
                              style:
                                  txtS(Color(0xff626262), 16, FontWeight.w400),
                            ),
                            Spacer(),
                            Text(
                              "Jammu and Kashmir",
                              style: txtS(dc, 16, FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  sh(28),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'images/profile.svg',
                        allowDrawingOutsideViewBox: true,
                      ),
                      SizedBox(width: b * 5),
                      Text(
                        "Manager name",
                        style: txtS(Color(0xff626262), 16, FontWeight.w400),
                      ),
                      Spacer(),
                      Text(
                        "Ritesh Shukla",
                        style: txtS(dc, 16, FontWeight.w400),
                      ),
                    ],
                  ),
                  sh(28),
                  Row(
                    children: [
                      Icon(
                        Icons.memory,
                        color: Color(0xff8f8f8f),
                      ),
                      SizedBox(width: b * 5),
                      Text(
                        "Decon Series",
                        style: txtS(Color(0xff626262), 16, FontWeight.w400),
                      ),
                      Spacer(),
                      Text(
                        "Decon S0",
                        style: txtS(dc, 16, FontWeight.w400),
                      ),
                    ],
                  ),
                  sh(80),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Container(
                          height: h * 35,
                          width: b * 35,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: blc, width: b * 1),
                          ),
                          child: SvgPicture.asset(
                            'images/edit.svg',
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                      ),
                      SizedBox(width: b * 12),
                      InkWell(
                        onTap: () {},
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Container(
                          height: h * 35,
                          padding: EdgeInsets.symmetric(horizontal: b * 15),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(b * 20),
                            border: Border.all(
                                color: Color(0xffff000f), width: b * 1),
                          ),
                          child: Text(
                            "Deactivate Client",
                            style: txtS(Color(0xffff000f), 12, FontWeight.w400),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
