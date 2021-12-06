import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_app_v2/bloc/settings/settings_bloc.dart';
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
            _unitPicker(context),
          ],
        ),
      ),
    );
  }

  Widget _unitPicker(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 15, left: 8, right: 8, bottom: 8),
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
                    value: TemperatureUnits.Celsius,
                    groupValue:
                        context.read<SettingsBloc>().state.temperatureUnits,
                    onChanged: (value) {
                      context
                          .read<SettingsBloc>()
                          .add(TemperatureUnitsChanged(temperatureUnit: value));
                    },
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
                    value: TemperatureUnits.Fahrenheit,
                    groupValue:
                        context.read<SettingsBloc>().state.temperatureUnits,
                    onChanged: (value) {
                      context
                          .read<SettingsBloc>()
                          .add(TemperatureUnitsChanged(temperatureUnit: value));
                    },
                    activeColor: Colors.blueGrey.shade900)
              ],
            ),
          ),
        ],
      );
    });
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
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
