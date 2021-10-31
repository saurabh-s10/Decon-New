import 'package:flutter/material.dart';
import 'package:decon/Utils/constants.dart';
import 'package:decon/loginPages/otp.dart';
import '../Utils/SizeConfig.dart';
import 'package:page_transition/page_transition.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  final TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
 var h = SizeConfig.screenHeight / 900;
    var b = SizeConfig.screenWidth / 400;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset('images/login_image.png', width: SizeConfig.screenWidth),
          Column(
            children: [
              Spacer(),
              Container(
                width: SizeConfig.screenWidth,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: b * 26),
                padding:
                    EdgeInsets.symmetric(horizontal: b * 17, vertical: h * 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(b * 5),
                  border: Border.all(color: blc, width: 1),
                ),
                child: TextFormField(
                  controller: phone,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: b * 16, color: blc),
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: 'Enter Your Phone',
                    hintStyle: TextStyle(
                      fontSize: b * 16,
                      color: Color(0xff848484),
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                ),
              ),
              sh(21),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: b * 26),
                child: MaterialButton(
                  padding: EdgeInsets.symmetric(vertical: h * 13),
                  color: Color(0xff00A3FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(b * 6),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        duration: Duration(milliseconds: 300),
                        type: PageTransitionType.rightToLeftWithFade,
                        childCurrent: Login(),
                        child: Otp(),
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: SizeConfig.screenWidth,
                    child: Text(
                      'Proceed',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: b * 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              sh(20),
            ],
          ),
        ],
      ),
    );
  }
}
