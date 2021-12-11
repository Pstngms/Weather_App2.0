import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';
import 'package:untitled/models/data.dart';
import 'package:untitled/models/get_img.dart';
import 'package:untitled/pages/daily.dart';
import 'package:untitled/models/colors.dart';

class WeeklyForecast extends StatelessWidget {
  WeeklyForecast({
    Key? key,
  }) : super(key: key);

  List<Daily> days = [
    Daily(
      image: data.weather.weekForecast[0].image,
      temperature: data.weather.weekForecast[0].temp,
      day: DateFormat.MMMMd('ru').format(DateTime.fromMillisecondsSinceEpoch(
          data.weather.weekForecast[0].day!.round() * 1000)),
      humidity: data.weather.weekForecast[0].humidity,
      pressure: data.weather.weekForecast[0].pressure?.round(),
      speed: data.weather.weekForecast[0].speed,
    ),
    Daily(
      image: data.weather.weekForecast[1].image,
      temperature: data.weather.weekForecast[0].temp,
      day: DateFormat.MMMMd('ru').format(DateTime.fromMillisecondsSinceEpoch(
          data.weather.weekForecast[1].day!.round() * 1000)),
      humidity: data.weather.weekForecast[1].humidity,
      pressure: data.weather.weekForecast[1].pressure?.round(),
      speed: data.weather.weekForecast[1].speed,
    ),
    Daily(
      image: data.weather.weekForecast[2].image,
      temperature: data.weather.weekForecast[2].temp,
      day: DateFormat.MMMMd('ru').format(DateTime.fromMillisecondsSinceEpoch(
          data.weather.weekForecast[2].day!.round() * 1000)),
      humidity: data.weather.weekForecast[2].humidity,
      pressure: data.weather.weekForecast[2].pressure?.round(),
      speed: data.weather.weekForecast[2].speed,
    ),
    Daily(
      image: data.weather.weekForecast[3].image,
      temperature: data.weather.weekForecast[3].temp,
      day: DateFormat.MMMMd('ru').format(DateTime.fromMillisecondsSinceEpoch(
          data.weather.weekForecast[3].day!.round() * 1000)),
      humidity: data.weather.weekForecast[3].humidity,
      pressure: data.weather.weekForecast[3].pressure?.round(),
      speed: data.weather.weekForecast[3].speed,
    ),
    Daily(
      image: data.weather.weekForecast[4].image,
      temperature: data.weather.weekForecast[4].temp,
      day: DateFormat.MMMMd('ru').format(DateTime.fromMillisecondsSinceEpoch(
          data.weather.weekForecast[4].day!.round() * 1000)),
      humidity: data.weather.weekForecast[4].humidity,
      pressure: data.weather.weekForecast[4].pressure?.round(),
      speed: data.weather.weekForecast[4].speed,
    ),
    Daily(
      image: data.weather.weekForecast[5].image,
      temperature: data.weather.weekForecast[5].temp,
      day: DateFormat.MMMMd('ru').format(DateTime.fromMillisecondsSinceEpoch(
          data.weather.weekForecast[5].day!.round() * 1000)),
      humidity: data.weather.weekForecast[5].humidity,
      pressure: data.weather.weekForecast[5].pressure?.round(),
      speed: data.weather.weekForecast[5].speed,
    ),
    Daily(
      image: data.weather.weekForecast[6].image,
      temperature: data.weather.weekForecast[6].temp,
      day: DateFormat.MMMMd('ru').format(DateTime.fromMillisecondsSinceEpoch(
          data.weather.weekForecast[6].day!.round() * 1000)),
      humidity: data.weather.weekForecast[6].humidity,
      pressure: data.weather.weekForecast[6].pressure?.round(),
      speed: data.weather.weekForecast[6].speed,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE2EBFF),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 32),
            child: Center(
              child: Text(
                "Прогноз на неделю",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Container(
              width: 320,
              height: 387,
              child: Swiper(
                itemWidth: 320,
                itemBuilder: (BuildContext context, int index) {
                  return days[index];
                },
                itemCount: days.length,
                layout: SwiperLayout.STACK,
              ),
            ),
          ),
          Container(
            width: 180,
            height: 40,
            margin: const EdgeInsets.only(top: 50),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.black),
                backgroundColor: Bot,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Вернуться на главную",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
