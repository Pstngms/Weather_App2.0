import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled/models/weather.dart';

class api {
  static Future<Weather> getWeather() async {
    var params = {
      'lat': '59.9386300',
      'lon': '30.3141300',
      'appid': 'f23bbb81b90fac4f08fd40fc584de217',
      'units': 'metric',
      'exclude': 'minutely,alerts',
    };
    final response = await http.get(Uri.https('api.openweathermap.org','/data/2.5/onecall',params));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      Weather weather = new Weather();
      weather.current = Current.fromJson(json);

      List<Hourly> hourly_weather = [];
      for (var h in json["hourly"]) {
        hourly_weather.add(Hourly.fromJson(h));
      }
      weather.hourly_weather = hourly_weather;

      //log(weather.toString());

      return weather;
    } else {
      throw Exception('Плоха');
    }
  }
}