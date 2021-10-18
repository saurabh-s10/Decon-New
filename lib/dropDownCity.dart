import 'package:flutter/material.dart';
import 'Utils/SizeConfig.dart';
import 'Utils/constants.dart';

class Option {
  String option;
  Option(this.option);
  static List<Option> getOption() {
    return <Option>[
      Option('Lakhimpur Kheri'),
      Option('City 2'),
      Option('City 3'),
      Option('City 4'),
      Option('City 5'),
    ];
  }
}

class DropDowncity extends StatefulWidget {
  @override
  _DropDowncityState createState() => _DropDowncityState();
}

class _DropDowncityState extends State<DropDowncity> {
  List<Option> _option = Option.getOption();
  List<DropdownMenuItem<Option>> _dropdownMenuItemsCity;
  Option _selectedTime;
  @override
  void initState() {
    _dropdownMenuItemsCity = buildDropdownMenuItemsCity(_option);
    _selectedTime = _dropdownMenuItemsCity[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Option>> buildDropdownMenuItemsCity(List options) {
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
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: dc,
            ),
            style: txtS(dc, 18, FontWeight.w400),
            isDense: true,
            value: _selectedTime,
            items: _dropdownMenuItemsCity,
            onChanged: onchangeDropdownItemOption,
          ),
        ),
      ),
    ]);
  }
}
