class WeatherData {
  String name;
  int timezone;
  Main main;
  Wind wind;

  WeatherData(
      {required this.name,
      required this.timezone,
      required this.main,
      required this.wind});

  factory WeatherData.fromJson(Map<String, dynamic> jsData) {
    return WeatherData(
        name: jsData['name'],
        timezone: jsData['timezone'],
        main: Main.fromJson(jsData['main']),
        wind: Wind.fromJson(jsData['wind']));
  }
}

class Main {
  double temp;
  int pressure;
  int humidity;

  Main({required this.temp, required this.pressure, required this.humidity});
  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
        temp: json['temp'],
        pressure: json['pressure'],
        humidity: json["humidity"]);
  }
}

class Wind {
  double speed;

  Wind({required this.speed});
  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(speed: json['speed']);
  }
}


// {
// "weather":[{"main":"Haze","description":"haze","icon":"50n"}],
// 
// "main":{"temp":293.05,"feels_like":291.93,"pressure":1017,"humidity":32},
//
// "wind":{"speed":1.54,"deg":10},
// "clouds":{"all":0},
//
// "sys":{"type":1,"id":7576,"country":"PK","sunrise":1638496865,"sunset":1638535331},
// "timezone":18000,
// 
// "name":"Karachi",
//}