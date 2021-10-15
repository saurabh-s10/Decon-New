import 'package:flutter/material.dart';
import 'package:decon/Utils/constants.dart';
import 'package:decon/drawerPages.dart/drawer.dart';
import '../Utils/SizeConfig.dart';

class About extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var h = SizeConfig.screenHeight / 812;
    var b = SizeConfig.screenWidth / 375;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 10,
        titleSpacing: -3,
        iconTheme: IconThemeData(color: blc),
        title: Text(
          "About Us",
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
      backgroundColor: Color(0xffe5e5e5).withOpacity(0.97),
      drawer: MyDrawer(),
      body: Column(
        children: [
          sh(30),
          Container(
            padding: EdgeInsets.symmetric(horizontal: b * 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "About Company",
                  style: txtS(Colors.black, 20, FontWeight.w700),
                ),
                sh(8),
                Text(
                  "Vysion Technology is a Gujarat based technology startup working in trending Domains like IoT, AI and Cloud to Empower Smart cities and industry.\n\nVysion Technology is Incubated by Gujarat government under SSIP initiative. We are team of young, enthusiastic and skilled engineers working to achieve our Vision",
                  style: txtS(Color(0xff5c6266), 14, FontWeight.w400),
                ),
                sh(40),
                Text(
                  "Vision",
                  style: txtS(Colors.black, 20, FontWeight.w700),
                ),
                sh(8),
                Text(
                  "Our vision is to empower and develop a country by providing a series of IoT, AI and cloud based smart solutions in different sectors to eradict the bottleneck problems faced by the country.Our products aim to transform and develop smart cities and industry. ",
                  style: txtS(Color(0xff5c6266), 14, FontWeight.w400),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('images/decon.png'),
                Expanded(
                  child: Container(
                    width: SizeConfig.screenWidth,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        stops: [
                          0.1,
                          0.56,
                          0.95,
                        ],
                        colors: [
                          Color(0xffc4c4c4).withOpacity(0.15),
                          dc.withOpacity(0.57),
                          dc.withOpacity(1),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
