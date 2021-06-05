import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String text = 'Loading location data';

  void getLocationData() async {
    setState(() {
      text = 'Loading location data';
    });

    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getWeatherData();

    if (weatherData != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LocationScreen(
            weatherData: weatherData,
          ),
        ),
      );
    } else {
      setState(() {
        text = 'Location weather data is not available';
      });
    }
  }

  @override
  initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: text != 'Loading location data'
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Text(
                    text,
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    getLocationData();
                  },
                  child: Text('Get Location'),
                ),
              ],
            )
          : Center(
              child: SpinKitDoubleBounce(
                color: Colors.white,
                size: 100.0,
              ),
            ),
    );
  }
}
