import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:weather_bloc_app_v2/utils/constants.dart';

class LocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _cityField(),
              Column(
                children: [
                  _flareWidget(),
                  _insertYourLocationText(context),
                ],
              ),
              _getLocationButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cityField() {
    return TextFormField(
        cursorColor: Colors.white,
        cursorHeight: 25,
        decoration: kTextFormFieldDecoration.copyWith(
            suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ))),
        onChanged: (value) {});
  }

  Widget _insertYourLocationText(BuildContext context) {
    return Text(
      'Insert your location.',
      style: TextStyle(
          fontSize: 25,
          color: Colors.blueGrey.shade900,
          fontWeight: FontWeight.w500),
    );
  }

  Widget _flareWidget() {
    return Container(
        child: FlareActor(
          "assets/animations/WorldSpin.flr",
          fit: BoxFit.contain,
          animation: "roll",
        ),
        height: 300,
        width: 300);
  }

  Widget _getLocationButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FloatingActionButton(
        backgroundColor: Colors.blueGrey.shade900,
        onPressed: () {},
        child: Icon(Icons.gps_fixed),
        elevation: 0,
      ),
    );
  }
}
