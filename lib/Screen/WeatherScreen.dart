import 'package:flutter/material.dart';

import '../Models/WeatherModel.dart';
import '../Services/WeatherServices.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  //api key
  final _weatherServices =
      WeatherServices(apiKey: "9e6ca11b0b916ff0d51a7d2e701d7a30");
  WeatherModel? _weatherModel;

  //fetch weather
  _fetchWeather() async {
    String cityName = await _weatherServices.getCurrentCity();

    // try{
    final weather = await _weatherServices.getWeather(cityName: cityName);
    setState(() {
      _weatherModel = weather;
    });
    // }
    // catch(error){
    //   log("$error");
    // }
  }

  //weather animation

  //init State

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_weatherModel?.cityName ?? "Loading City ...."),
            Text("${_weatherModel?.temperature.round()} C"),
          ],
        ),
      ),
    );
  }
}
