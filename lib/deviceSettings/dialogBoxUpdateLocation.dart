import 'package:decon/deviceSettings/dialogBoxManual.dart';
import 'package:flutter/material.dart';
import '../Utils/SizeConfig.dart';
import '../Utils/constants.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

class DialogBoxUpdate extends StatelessWidget {
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
          child: Column(children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
                dialogBoxManual(context);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: h * 10),
                decoration: BoxDecoration(
                  border: Border.all(color: blc),
                  borderRadius: BorderRadius.circular(b * 6),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Manual Update',
                  style: TextStyle(
                      color: blc,
                      fontSize: b * 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            sh(16),
            Text("OR",
                textAlign: TextAlign.center,
                style: txtS(Colors.black, b * 16, FontWeight.w400)),
            Text("Are You sure?\nLocation of Device 1 is :",
                textAlign: TextAlign.center,
                style: txtS(Colors.black, b * 16, FontWeight.w500)),
            sh(9),
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: b * 11, vertical: h * 15.5),
              decoration: BoxDecoration(
                color: Color(0xfff1f1f1),
                borderRadius: BorderRadius.circular(b * 6),
              ),
              child: Text(
                  "981, sunder vihar, Geeta bhawan Road, Sardarpura, Jodhpur, 342003",
                  textAlign: TextAlign.center,
                  style: txtS(Colors.black, b * 16, FontWeight.w400)),
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
                  onPressed: () {},
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

void dialogBoxUpdate(BuildContext context) {
  showAnimatedDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return DialogBoxUpdate();
    },
    animationType: DialogTransitionType.scaleRotate,
    curve: Curves.fastOutSlowIn,
    duration: Duration(milliseconds: 400),
  );
}
