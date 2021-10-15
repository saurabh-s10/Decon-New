import 'package:flutter/material.dart';
import '../Utils/SizeConfig.dart';
import '../Utils/constants.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

class DialogBoxNoData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var b = SizeConfig.screenWidth / 375;
    var h = SizeConfig.screenHeight / 812;
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.symmetric(horizontal: b * 27.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(b * 9),
      ),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          padding: EdgeInsets.fromLTRB(b * 10, h * 16, b * 10, h * 16),
          child: Column(children: [
            Image.asset('images/nodata.png'),
            sh(19),
            Container(
              padding: EdgeInsets.symmetric(vertical: h * 2, horizontal: b * 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(b * 2),
                color: blc,
              ),
              child: Text(
                'ID : C1_S9_D1',
                style: txtS(Colors.white, 12, FontWeight.w400),
              ),
            ),
            sh(9),
            Text(
              'No data received in last 15 days',
              style: TextStyle(
                color: blc,
                fontSize: b * 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            sh(14),
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(vertical: h * 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(b * 6),
                  color: Color(0xfff1f1f1),
                  border: Border.all(
                    color: blc,
                    width: 1,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  'View Old Stats',
                  style: TextStyle(
                    color: dc,
                    fontSize: b * 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}

void dialogBoxNoData(BuildContext context) {
  showAnimatedDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return DialogBoxNoData();
    },
    animationType: DialogTransitionType.scaleRotate,
    curve: Curves.fastOutSlowIn,
    duration: Duration(milliseconds: 400),
  );
}
