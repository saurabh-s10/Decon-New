import 'package:decon/deviceSettings/dialogBoxDone.dart';
import 'package:flutter/material.dart';
import '../Utils/SizeConfig.dart';
import '../Utils/constants.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

class DialogBoxManual extends StatelessWidget {
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
          padding: EdgeInsets.fromLTRB(b * 13, h * 16, b * 13, h * 16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(vertical: h * 10),
                decoration: BoxDecoration(
                  color: blc,
                  borderRadius: BorderRadius.circular(b * 6),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Manual Update',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: b * 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            sh(16),
            Text(
              "Latitude",
              style: TextStyle(
                fontSize: b * 16,
                color: dc,
                fontWeight: FontWeight.w500,
              ),
            ),
            sh(6),
            Container(
              padding: EdgeInsets.fromLTRB(b * 11, 0, 0, 0),
              width: b * 400,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                border: Border.all(color: blc, width: 0.7),
                borderRadius: BorderRadius.circular(b * 5),
              ),
              child: TextField(
                controller: latitude,
                style: TextStyle(fontSize: b * 14, color: blc),
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Enter Latitude',
                  hintStyle: TextStyle(
                    fontSize: b * 14,
                    color: blc.withOpacity(0.25),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            sh(18),
            Text(
              "Longitude",
              style: TextStyle(
                fontSize: b * 16,
                color: dc,
                fontWeight: FontWeight.w500,
              ),
            ),
            sh(6),
            Container(
              padding: EdgeInsets.fromLTRB(b * 11, 0, 0, 0),
              width: b * 400,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                border: Border.all(color: blc, width: 0.7),
                borderRadius: BorderRadius.circular(b * 5),
              ),
              child: TextField(
                controller: longitude,
                style: TextStyle(fontSize: b * 14, color: blc),
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Enter Longitude',
                  hintStyle: TextStyle(
                    fontSize: b * 14,
                    color: blc.withOpacity(0.25),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            sh(32),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(
                flex: 2,
                child: MaterialButton(
                  color: Color(0xff00A3FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(b * 6),
                  ),
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.pop(context);
                    dialogBoxDone(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Yes, Update',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: b * 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: MaterialButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'No',
                      style: TextStyle(
                        color: blc,
                        fontSize: b * 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ])
          ]),
        ),
      ]),
    );
  }
}

void dialogBoxManual(BuildContext context) {
  showAnimatedDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return DialogBoxManual();
    },
    animationType: DialogTransitionType.scaleRotate,
    curve: Curves.fastOutSlowIn,
    duration: Duration(milliseconds: 400),
  );
}
