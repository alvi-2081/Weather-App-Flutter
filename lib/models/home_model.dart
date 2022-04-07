class WeatherData {
  String name;
  int timezone;
  Main main;
  Wind wind;
  List<Weather> weather;

  WeatherData(
      {required this.name,
      required this.timezone,
      required this.main,
      required this.wind,
      required this.weather});

  factory WeatherData.fromJson(Map<String, dynamic> jsData) {
    var list = jsData['weather'] as List;
    // print(list.runtimeType);
    List<Weather> wList = list.map((i) => Weather.fromJson(i)).toList();

    return WeatherData(
        name: jsData['name'],
        timezone: jsData['timezone'],
        main: Main.fromJson(jsData['main']),
        wind: Wind.fromJson(jsData['wind']),
        weather: wList);
  }
}

class Main {
  double temp;
  // double feelsLike;
  int pressure;
  int humidity;

  Main({
    required this.temp,
    // required this.feelsLike,
    required this.pressure,
    required this.humidity,
  });
  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      temp: json['temp'],
      // feelsLike: json["feels_like"],
      pressure: json['pressure'],
      humidity: json["humidity"],
    );
  }
}

class Wind {
  double speed;

  Wind({required this.speed});
  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(speed: json['speed']);
  }
}

class Weather {
  String main;
  String description;
  String icon;

  Weather({required this.main, required this.description, required this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        main: json['main'],
        description: json['description'],
        icon: json['icon']);
  }
}
