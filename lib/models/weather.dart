class Weather {
  late List<Hourly> hourly_weather;
  late Current current;
  late List<DayWeather> weekForecast;

  @override
  String toString() {
    return 'Weather{timeBlocks: $hourly_weather, current: $current}';
  }
}


class Current {
  num? temp;
  num? humidity;
  num? windSpeed;
  num? pressure;

  Current(
      {this.pressure, this.humidity, this.temp, this.windSpeed});

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
        pressure: json['current']['pressure'].toDouble()* 0.750062,
        humidity: json['current']['humidity'].toDouble(),
        temp: json['current']['temp'].toDouble(),
        windSpeed: json['current']['wind_speed'].toDouble());
  }

  @override
  String toString() {
    return 'Current{temp: $temp, humidity: $humidity, windSpeed: $windSpeed, pressure: $pressure}';
  }
}

class Hourly {
  num? time;
  String? image;
  num? temp;

  Hourly(
      {this.time, this.image, this.temp});

  factory Hourly.fromJson(Map<String, dynamic> json) {
    return Hourly(
        time: json['dt'],
        image: json['weather'][0]['main'],
        temp: json['temp']);
  }

  @override
  String toString() {
    return 'WeatherToTime{time: $time, image: $image, temperature: $temp}';
  }
}

class DayWeather {
  num? day;
  String? image;
  num? temp;
  num? speed;
  num? humidity;
  num? pressure;

  DayWeather(
      {this.day,this.image,this.temp,this.speed,this.humidity,this.pressure});

  factory DayWeather.fromJson(Map<String, dynamic> json) {
    return DayWeather(
        day: json['dt'],
        image: json['weather'][0]['main'],
        temp: json['temp']['min'].round(),
        speed: json['wind_speed'].round(),
        humidity: json['humidity'].round(),
        pressure: json['pressure'].round()* 0.750062);
  }

  @override
  String toString() {
    return 'DayWeather{day: $day, image: $image, maxTemperature: $temp, speed: $speed, humidity: $humidity, pressure: $pressure}';
  }
}