
import "package:flutter/material.dart";
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:untitled/models/data.dart';
import 'package:untitled/models/api.dart';
import 'package:untitled/models/weather.dart';
import 'package:untitled/pages/about.dart';
import 'package:untitled/pages/loading.dart';

import 'main_page.dart';

void main() {
  initializeDateFormatting('ru', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LukWeather',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'LukWeather'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var Viol = const Color(0xFFE2EBFF);
  var Blue = const Color(0xff038cfe);
  var Date = DateFormat.yMMMMd('ru').format(DateTime.now());
  bool ExpOn = false;



  @override

  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(
          canvasColor: const Color(0xFFE2EBFF),
        ),
        home: Scaffold(
          drawer: Drawer(
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Luka's Weather",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontFamily: 'Manrope-bold',
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 60),
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Image(
                                image: AssetImage('assets/Settings.png'),
                                height: 25,
                                width: 25,
                                fit: BoxFit.fill),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: GestureDetector(
                                child: const Text(
                                  'Настройки',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Image(
                                image: AssetImage('assets/Favourite.png'),
                                height: 25,
                                width: 25,
                                fit: BoxFit.fill),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: GestureDetector(
                                child: const Text(
                                  'Избранные',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Image(
                                image: AssetImage('assets/AboutUs.png'),
                                height: 25,
                                width: 25,
                                fit: BoxFit.fill),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: GestureDetector(
                                onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (_) => AboutApp()));},
                                child: const Text(
                                  'О Приложении',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: FutureBuilder(
            future: api.getWeather(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Builder(builder: (context) {
                  data.weather = snapshot.data as Weather;
                  return mainPage();
                });
              } else {
                return Loading();
              }
            },
          ),
        ),
      );


}

// This trailing comma makes auto-formatting nicer for build methods.
