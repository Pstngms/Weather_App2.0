class Weather {
  late List<Hourly> hourly_weather;
  late Current current;
  late List<Week> weekForecast;

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

class Week {
  num? day;
  String? image;
  num? temp;
  num? speed;
  num? humidity;
  num? pressure;

  Week(
      {this.day,this.image,this.temp,this.speed,this.humidity,this.pressure});

  factory Week.fromJson(Map<String, dynamic> json) {
    return Week(
        day: json['dt'],
        image: json['weather'][0]['main'],
        temp: json['temp']['min'],
        speed: json['wind_speed'],
        humidity: json['humidity'],
        pressure: json['pressure']);
  }

  @override
  String toString() {
    return 'DayWeather{day: $day, image: $image, maxTemperature: $temp, speed: $speed, humidity: $humidity, pressure: $pressure}';
  }
}