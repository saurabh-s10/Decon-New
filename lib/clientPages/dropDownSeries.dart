import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../Utils/SizeConfig.dart';
import '../Utils/constants.dart';

class Option {
  String option;
  Option(this.option);
  static List<Option> getOption() {
    return <Option>[
      Option('Series 1'),
      Option('Series 2'),
      Option('Series 3'),
      Option('Series 4'),
      Option('Series 5'),
    ];
  }
}

class DropDownMenuBar extends StatefulWidget {
  @override
  _DropDownMenuBarState createState() => _DropDownMenuBarState();
}

class _DropDownMenuBarState extends State<DropDownMenuBar> {
  List<Option> _option = Option.getOption();
  List<DropdownMenuItem<Option>> _dropdownMenuItemsTime;
  Option _selectedTime;
  @override
  void initState() {
    _dropdownMenuItemsTime = buildDropdownMenuItemsTime(_option);
    super.initState();
  }

  List<DropdownMenuItem<Option>> buildDropdownMenuItemsTime(List options) {
    List<DropdownMenuItem<Option>> items = List();

    for (Option options in options) {
      items.add(
        DropdownMenuItem(
          value: options,
          child: Container(
            child: Text(
              options.option,
              style: TextStyle(
                fontSize: SizeConfig.screenWidth * 16 / 375,
              ),
            ),
          ),
        ),
      );
    }
    return items;
  }

  onchangeDropdownItemOption(Option selectedOption) {
    setState(() {
      _selectedTime = selectedOption;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var h = SizeConfig.screenHeight / 812;
    var b = SizeConfig.screenWidth / 375;

    return Wrap(children: [
      DropdownButtonHideUnderline(
        child: ButtonTheme(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: EdgeInsets.zero,
          child: DropdownButton(
            style: txtS(dc, 16, FontWeight.w400),
            isDense: true,
            isExpanded: true,
            icon: SvgPicture.asset(
              'images/drop.svg',
              allowDrawingOutsideViewBox: true,
            ),
            hint: Text(
              'Select Series',
              style: TextStyle(
                fontSize: b * 16,
                color: Color(0xff858585),
              ),
            ),
            value: _selectedTime,
            items: _dropdownMenuItemsTime,
            onChanged: onchangeDropdownItemOption,
          ),
        ),
      ),
    ]);
  }
}
