import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:weather_bloc_app_v2/utils/constants.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBar(),
      body: SafeArea(
        child: ListView(
          children: [
            _unitPicker(),
          ],
        ),
      ),
    );
  }

  Widget _unitPicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 8, right: 8, bottom: 8),
          child: Text(
            "Unit",
            style: TextStyle(
              color: Colors.blueGrey.shade900,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        Container(
          decoration: kSettingsPickerDecoration,
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Celsius",
                style: TextStyle(color: Colors.blueGrey.shade900),
              ),
              Radio(
                  value: 3,
                  groupValue: 3,
                  onChanged: (value) {},
                  activeColor: Colors.blueGrey.shade900)
            ],
          ),
        ),
        Divider(
          color: Colors.white,
          height: 1,
        ),
        Container(
          color: Colors.blueGrey.shade900.withOpacity(0.1),
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Fahrenheit",
                style: TextStyle(color: Colors.blueGrey.shade900),
              ),
              Radio(
                  value: 1,
                  groupValue: 1,
                  onChanged: (value) {},
                  activeColor: Colors.blueGrey.shade900)
            ],
          ),
        ),
        Divider(
          color: Colors.white,
          height: 1,
        ),
        Container(
          decoration: kSettingsPickerDecoration,
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Kelvin",
                style: TextStyle(color: Colors.blueGrey.shade900),
              ),
              Radio(
                  value: 2,
                  groupValue: 2,
                  onChanged: (value) {},
                  activeColor: Colors.blueGrey.shade900)
            ],
          ),
        ),
      ],
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(preferredSize.height),
      child: AppBar(
        centerTitle: true,
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.blueGrey.shade900),
        ),
        elevation: 0,
        leading: IconButton(
          icon: Platform.isAndroid
              ? Icon(
                  Icons.arrow_back,
                  color: Colors.blueGrey.shade900,
                )
              : Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.blueGrey.shade900,
                ),
          onPressed: () {},
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
