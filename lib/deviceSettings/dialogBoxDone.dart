import 'package:flutter/material.dart';
import '../Utils/SizeConfig.dart';
import '../Utils/constants.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

class DialogBoxDone extends StatelessWidget {
  final TextEditingController latitude = TextEditingController();
  final TextEditingController longitude = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var b = SizeConfig.screenWidth / 375;
    var h = SizeConfig.screenHeight / 812;
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.symmetric(horizontal: b * 25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(b * 12),
      ),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          padding: EdgeInsets.fromLTRB(b * 13, h * 0, b * 13, h * 16),
          child: Column(children: [
            Image.asset(
              'images/update.png',
              height: h * 160,
            ),
            Text(
              "You are Done",
              style: TextStyle(
                fontSize: b * 18,
                color: dc,
                fontWeight: FontWeight.w500,
              ),
            ),
            sh(7),
            Text(
              "Settings are Updated",
              style: txtS(Color(0xff9ba1a3), b * 16, FontWeight.w400),
            ),
            sh(27),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: h * 12),
                decoration: BoxDecoration(
                  color: Color(0xffe7e7e7),
                  borderRadius: BorderRadius.circular(b * 6),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Close',
                  style: txtS(dc, b * 16, FontWeight.w500),
                ),
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}

void dialogBoxDone(BuildContext context) {
  showAnimatedDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return DialogBoxDone();
    },
    animationType: DialogTransitionType.scaleRotate,
    curve: Curves.fastOutSlowIn,
    duration: Duration(milliseconds: 400),
  );
}
