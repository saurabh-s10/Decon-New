import 'package:decon/devices/devices.dart';
import 'package:decon/drawerPages.dart/drawer.dart';
import 'package:decon/peoplePages/people.dart';
import 'package:flutter/material.dart';

import 'package:decon/home.dart';
import 'package:flutter_svg/svg.dart';
import 'Utils/constants.dart';
import 'Utils/SizeConfig.dart';

class Bottom extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottomState();
  }
}

class _BottomState extends State<Bottom> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptionsInd = <Widget>[
    Home(),
    Devices(),
    People(),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var h = SizeConfig.screenHeight / 900;
    var b = SizeConfig.screenWidth / 400;

    return Scaffold(
      drawer: MyDrawer(),
      bottomNavigationBar: SizedBox(
        height: h * 60,
        child: BottomNavigationBar(
          backgroundColor: dc,
          unselectedItemColor: Colors.white,
          elevation: 10,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          selectedItemColor: blc,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'images/Home.svg',
                allowDrawingOutsideViewBox: true,
                color: _selectedIndex == 0 ? blc : Colors.white,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.memory, size: b * 32),
              label: 'Devices',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'images/3User.svg',
                allowDrawingOutsideViewBox: true,
                color: _selectedIndex == 2 ? blc : Colors.white,
              ),
              label: 'People',
            ),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
      // body: Stack(
      //   children: <Widget>[
      //     Navigator(
      //       //key: navigatorKey,
      //       onGenerateRoute: (RouteSettings settings) {
      //         return MaterialPageRoute(
      //           builder: (BuildContext context) =>
      //               _widgetOptionsInd[_selectedIndex],
      //         );
      //       },
      //     ),
      //   ],
      // ),
     body: _widgetOptionsInd.elementAt(_selectedIndex),
    );
  }
}
