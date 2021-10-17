import 'package:flutter/material.dart';

import '../Utils/SizeConfig.dart';
import '../Utils/constants.dart';

class Error extends StatelessWidget {
  final String error;
  Error({this.error});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var h = SizeConfig.screenHeight / 812;
    var b = SizeConfig.screenWidth / 375;

    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: b * 26),
          child: Column(
            children: [
              sh(80),
              Image.asset(
                  error != "Data"
                      ? 'images/noInternet.png'
                      : 'images/nodata1.png',
                  height: h * 230),
              sh(75),
              Text(
                error != "Data"
                    ? 'No Internet Connection!'
                    : 'No Data Available!',
                style: txtS(blc, b * 20, FontWeight.w700),
              ),
              sh(40),
              Text(
                'Something went wrong.\nPlease try again',
                textAlign: TextAlign.center,
                style: txtS(Color(0xff908e9c), b * 16, FontWeight.w500),
              ),
              sh(100),
              MaterialButton(
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
                    'TRY AGAIN',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: b * 16,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
