class WeatherModel {
  final String cityName;
  final double temperature;
  final String mainCondition;
  final int code;
  final double tempMin;
  final double tempMax;
  final double sunRise;
  final double sunSet;

  WeatherModel(
      {required this.cityName,
      required this.mainCondition,
      required this.temperature,
      required this.code,
      required this.tempMax,
      required this.tempMin,
      required this.sunRise,
      required this.sunSet});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        cityName: json['name'] ?? "",
        temperature: json['main']['temp'].toDouble(),
        mainCondition: json['weather'][0]['main'] ?? "",
        tempMax: json['main']['temp_min'].toDouble(),
        tempMin: json['main']['temp_max'].toDouble(),
        sunRise: json['sys']['sunrise'].toDouble(),
        sunSet: json['sys']['sunset'].toDouble(),
        code: json['cod']);
  }
}
