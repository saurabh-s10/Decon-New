import 'package:flutter/material.dart';
import 'package:decon/Utils/constants.dart';
import 'package:page_transition/page_transition.dart';
import '../Utils/SizeConfig.dart';
import 'package:pinput/pin_put/pin_put.dart';

class Otp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OtpState();
  }
}

class _OtpState extends State<Otp> {
  final _pinPutController = TextEditingController();
  final _pinPutFocusNode = FocusNode();
  bool keyboard = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var h = SizeConfig.screenHeight / 812;
    var b = SizeConfig.screenWidth / 375;
    BoxDecoration pinPutDecoration = BoxDecoration(
      border: Border.all(
        color: Color(0xFFA9E0FF),
        width: 1,
      ),
      color: Colors.white,
      borderRadius: BorderRadius.circular(b * 5),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            'images/login_image.png',
            width: SizeConfig.screenWidth,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: b * 26),
            child: Column(
              children: [
                Spacer(),
                Text(
                  'Please type the verification code sent to your entered mobile number',
                  style: TextStyle(
                    color: blc.withOpacity(0.75),
                    fontSize: b * 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                sh(25),
                Container(
                  width: SizeConfig.screenWidth,
                  child: PinPut(
                    onTap: () {
                      keyboard = true;
                    },
                    onSubmit: (value) {
                      keyboard = false;
                    },
                    onSaved: (value) {
                      keyboard = true;
                    },
                    withCursor: true,
                    fieldsCount: 6,
                    textStyle: TextStyle(fontSize: b * 20, color: dc),
                    eachFieldWidth: 40,
                    eachFieldHeight: 40,
                    focusNode: _pinPutFocusNode,
                    controller: _pinPutController,
                    submittedFieldDecoration: pinPutDecoration,
                    selectedFieldDecoration: pinPutDecoration,
                    followingFieldDecoration: pinPutDecoration,
                  ),
                ),
                sh(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'No Otp ',
                      style: TextStyle(
                        color: dc,
                        fontSize: b * 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Resend it!',
                        style: TextStyle(
                          color: blc,
                          fontSize: b * 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                sh(!keyboard ? 70 : 10),
              ],
            ),
          ),
          Positioned(
            top: SizeConfig.screenHeight - 50,
            child: !keyboard
                ? MaterialButton(
                    padding: EdgeInsets.symmetric(vertical: h * 13),
                    color: Color(0xff00A3FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(b * 6),
                    ),
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   PageTransition(
                      //     duration: Duration(milliseconds: 300),
                      //     type: PageTransitionType.rightToLeftWithFade,
                      //     childCurrent: Otp(),
                      //     child: Otp(),
                      //   ),
                      // );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: SizeConfig.screenWidth - b * 52,
                      child: Text(
                        'Verify',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: b * 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  )
                : sh(0),
          ),
        ],
      ),
    );
  }
}
