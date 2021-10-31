import 'package:flutter/material.dart';
import '../Utils/SizeConfig.dart';
import '../Utils/constants.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

class DialogBoxAddMember extends StatefulWidget {
  @override
  _DialogBoxAddMemberState createState() => _DialogBoxAddMemberState();
}

class _DialogBoxAddMemberState extends State<DialogBoxAddMember> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController post = TextEditingController();
  bool admin = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var h = SizeConfig.screenHeight / 900;
    var b = SizeConfig.screenWidth / 400;
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.symmetric(horizontal: b * 25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(b * 9),
      ),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          padding: EdgeInsets.fromLTRB(b * 13, h * 16, b * 13, h * 16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        admin = !admin;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: h * 6),
                      decoration: BoxDecoration(
                        color: !admin ? blc : Colors.white,
                        border: Border.all(
                            color: admin ? blc : Colors.transparent,
                            width: b * 1),
                        borderRadius: BorderRadius.circular(b * 12),
                      ),
                      child: Text(
                        'Add team member',
                        style: TextStyle(
                          color: !admin ? Colors.white : blc,
                          fontSize: b * 11.63,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: b * 16),
                Expanded(
                  flex: 2,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        admin = !admin;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: h * 6),
                      decoration: BoxDecoration(
                        color: admin ? blc : Colors.white,
                        border: Border.all(
                            color: !admin ? blc : Colors.transparent,
                            width: b * 1),
                        borderRadius: BorderRadius.circular(b * 12),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Add Admin',
                        style: TextStyle(
                          color: !admin ? blc : Colors.white,
                          fontSize: b * 11.63,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            sh(9),
            Text(
              "Name",
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
                keyboardType: TextInputType.emailAddress,
                controller: name,
                style: TextStyle(fontSize: b * 14, color: dc),
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
            sh(11),
            Text(
              "E-Mail",
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
                controller: email,
                style: TextStyle(fontSize: b * 14, color: dc),
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Enter Email',
                  hintStyle: TextStyle(
                    fontSize: b * 14,
                    color: blc.withOpacity(0.25),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            sh(11),
            Text(
              "Phone Number",
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
                controller: phone,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: b * 14, color: dc),
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Enter Phone Number',
                  hintStyle: TextStyle(
                    fontSize: b * 14,
                    color: blc.withOpacity(0.25),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            sh(11),
            Text(
              "Post",
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
                controller: post,
                keyboardType: TextInputType.name,
                style: TextStyle(fontSize: b * 14, color: dc),
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Enter the Post',
                  hintStyle: TextStyle(
                    fontSize: b * 14,
                    color: blc.withOpacity(0.25),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            sh(15),
            MaterialButton(
              color: Color(0xff00A3FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(b * 6),
              ),
              padding: EdgeInsets.zero,
              onPressed: () {},
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: b * 16,
                    fontWeight: FontWeight.w500,
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

void dialogBoxAddMember(BuildContext context) {
  showAnimatedDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return DialogBoxAddMember();
    },
    animationType: DialogTransitionType.scaleRotate,
    curve: Curves.fastOutSlowIn,
    duration: Duration(milliseconds: 400),
  );
}
