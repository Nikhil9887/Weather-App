import 'package:flutter/material.dart';
import 'package:new_weather_app/services/location.dart';
import 'package:new_weather_app/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = '4d986795fd68ae36d9ca33056170bf9e';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude = 0;
  double? longitude = 0;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {

    print("Hello1");

    Location location = Location();
    await location.getCurrentLocation();

    latitude = location.latitude;
    longitude = location.longitude;

    print("Hello2");

    print(location.latitude);
    print(location.longitude);

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=4d986795fd68ae36d9ca33056170bf9e');

    print("Hello3");

    var weatherData = await networkHelper.getData();

    int temperature = weatherData['main']['temp'];
    int condition = weatherData['weather'][0]['id'];
    String cityName = weatherData['name'];

    print("Hello4");

    print(temperature);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
