import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _AppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            _cityText(city: 'Rio de Janeiro'),
            _conditionText(condition: 'Clear sky'),
            SizedBox(height: 80),
            _weatherAnimationWidget(
                path: 'assets/animations/weather-sunny.gif'),
            SizedBox(height: 100),
            _temperatureRow(weather: 'weather'),
            _humidityRow(humidity: '77 %'),
            _pressureRow(pressure: '1001'),
            _lastUpdateRow(lastUpdate: '22:30:26')
          ],
        ),
      ),
    );
  }

  Widget _conditionText({required String condition}) {
    return Text(
      '$condition',
      style: TextStyle(
          color: Colors.blueGrey.shade400,
          fontWeight: FontWeight.w700,
          fontSize: 17),
    );
  }

  Widget _cityText({dynamic city}) {
    return Text(
      '$city',
      style: TextStyle(
        color: Colors.blueGrey.shade800,
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    );
  }

  Widget _weatherAnimationWidget({required String path}) {
    return Container(
      width: 200,
      height: 200,
      child: Image.asset(path),
    );
  }

  Widget _temperatureRow({dynamic weather}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Temperature:',
          style: TextStyle(
              color: Colors.blueGrey.shade700,
              fontWeight: FontWeight.w700,
              fontSize: 17),
        ),
        SizedBox(
          width: 120,
        ),
        Text(
          '23° /',
          style: TextStyle(color: Colors.blueGrey.shade500, fontSize: 15),
        ),
        Text(
          '25°',
          style: TextStyle(color: Colors.blueGrey.shade700, fontSize: 17),
        ),
        Text(
          '/ 27°',
          style: TextStyle(color: Colors.blueGrey.shade500, fontSize: 15),
        ),
      ],
    );
  }

  Widget _humidityRow({dynamic humidity}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Humidity:',
          style: TextStyle(
              color: Colors.blueGrey.shade700,
              fontWeight: FontWeight.w700,
              fontSize: 17),
        ),
        SizedBox(
          width: 200,
        ),
        Text(
          '$humidity',
          style: TextStyle(color: Colors.blueGrey.shade700, fontSize: 17),
        ),
      ],
    );
  }

  Widget _pressureRow({dynamic pressure}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Pressure:',
          style: TextStyle(
              color: Colors.blueGrey.shade700,
              fontWeight: FontWeight.w700,
              fontSize: 17),
        ),
        SizedBox(
          width: 200,
        ),
        Text(
          '$pressure',
          style: TextStyle(color: Colors.blueGrey.shade700, fontSize: 17),
        ),
      ],
    );
  }

  Widget _lastUpdateRow({dynamic lastUpdate}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Last update:',
          style: TextStyle(
              color: Colors.blueGrey.shade700,
              fontWeight: FontWeight.w700,
              fontSize: 17),
        ),
        SizedBox(
          width: 150,
        ),
        Text(
          '$lastUpdate',
          style: TextStyle(color: Colors.blueGrey.shade700, fontSize: 17),
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
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.blueGrey.shade900,
            ),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: Icon(
            Icons.add,
            color: Colors.blueGrey.shade900,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
