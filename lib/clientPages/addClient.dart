import 'package:decon/clientPages/dropDownSeries.dart';
import 'package:decon/clientPages/addManager.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../Utils/SizeConfig.dart';
import '../Utils/constants.dart';

class AddClient extends StatefulWidget {
  @override
  _AddClientState createState() => _AddClientState();
}

class _AddClientState extends State<AddClient> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController department = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController district = TextEditingController();
  final TextEditingController state = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var h = SizeConfig.screenHeight / 812;
    var b = SizeConfig.screenWidth / 375;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios, color: blc, size: b * 16),
        ),
        elevation: 10,
        titleSpacing: -3,
        iconTheme: IconThemeData(color: blc),
        title: Text(
          "Add Client",
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
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: b * 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sh(42),
            textField("Enter Name", name),
            textField("Enter Department Name", department),
            textField("City", city),
            textField("District", district),
            textField("State", state),
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: b * 16, vertical: b * 14),
              margin: EdgeInsets.only(bottom: h * 10),
              decoration: BoxDecoration(
                color: Color(0xfff6f6f6),
                borderRadius: BorderRadius.circular(b * 5),
              ),
              child: DropDownMenuBar(),
            ),
            Spacer(),
            MaterialButton(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              color: blc,
              padding: EdgeInsets.symmetric(vertical: h * 3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(b * 6),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    duration: Duration(milliseconds: 400),
                    type: PageTransitionType.rightToLeftWithFade,
                    childCurrent: AddClient(),
                    child: AddManagerList(),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: h * 10),
                alignment: Alignment.center,
                child: Text(
                  'Next',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: b * 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            sh(28),
          ],
        ),
      ),
    );
  }

  Widget textField(String title, controller) {
    var h = SizeConfig.screenHeight / 812;
    var b = SizeConfig.screenWidth / 375;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: b * 16, vertical: b * 14),
      margin: EdgeInsets.only(bottom: h * 10),
      decoration: BoxDecoration(
        color: Color(0xfff6f6f6),
        borderRadius: BorderRadius.circular(b * 5),
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: b * 16, color: dc),
        decoration: InputDecoration(
          isDense: true,
          contentPadding:
              EdgeInsets.symmetric(vertical: h * 0, horizontal: b * 0),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: title,
          hintStyle: TextStyle(
            fontSize: b * 16,
            color: Color(0xff858585),
          ),
          enabledBorder: InputBorder.none,
        ),
        maxLines: 1,
      ),
    );
  }
}
