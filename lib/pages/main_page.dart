
import "package:flutter/material.dart";
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:intl/intl.dart';
import 'package:untitled/models/colors.dart';
import 'package:untitled/models/data.dart';
import 'package:untitled/models/get_img.dart';

import 'package:untitled/pages/week.dart';




class mainPage extends StatefulWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  var date = DateFormat.yMMMMd('ru').format(DateTime.now());

  var Date = DateFormat.yMMMMd('ru').format(DateTime.now());
  bool ExpOn = false;

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: MediaQuery.of(context).size.height * .6,
      child: ExpandableBottomSheet(
          background: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                child: const Image(
                  image: AssetImage('assets/background.png'),
                  fit: BoxFit.fill,
                ),
              ),
              AnimatedPadding(
                duration: Duration(milliseconds: 1),
                padding:
                const EdgeInsets.only(left: 8, top: 35.0, right: 8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NeumorphicButton(
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          style: const NeumorphicStyle(
                              shape: NeumorphicShape.concave,
                              boxShape: NeumorphicBoxShape.circle(),
                              depth: 3,
                              lightSource: LightSource.topLeft,
                              color: Colors.transparent),
                          child: NeumorphicIcon(
                            Icons.menu,
                            size: 30,
                          ),
                        ),
                        Column(
                          children:[
                            Visibility(
                              visible: !ExpOn,
                              child: Padding(
                                padding: EdgeInsets.only(top: 0.0),
                                child: Text(
                                  "${data.weather.current.temp!.round().toString()}˚c",
                                  style: const TextStyle(
                                    fontSize: 80,
                                    color: Colors.white,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: -4,
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: ExpOn,
                              child: const Padding(
                                padding: EdgeInsets.only(top: 10.0),
                                child: Text(
                                  'Санкт-Петербург',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: ExpOn,
                              child: Padding(
                                padding: EdgeInsets.only(top: 50.0),
                                child: Text(
                                  '${data.weather.current.temp!.round().toString()}˚c',
                                  style: const TextStyle(
                                    fontSize: 80,
                                    color: Colors.white,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: -4,
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: !ExpOn,
                              child: Text(
                                Date,
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        NeumorphicButton(
                          onPressed: () {},
                          style: const NeumorphicStyle(
                              shape: NeumorphicShape.concave,
                              boxShape: NeumorphicBoxShape.circle(),
                              depth: 3,
                              lightSource: LightSource.topLeft,
                              color: Colors.transparent),
                          child: NeumorphicIcon(
                            Icons.add,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          onIsContractedCallback: () {
            setState(() {
              ExpOn = false;
            });
            print(ExpOn);
          },
          onIsExtendedCallback: () {
            setState(() {
              ExpOn = true;
            });
            print(ExpOn);
          },
          enableToggle: true,
          persistentContentHeight: 200,
          persistentHeader: Container(
            height: 40,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(15),
              ),
              color: Viol,
            ),
            child: const Center(
              child: Image(
                image: AssetImage('assets/Modalheader.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          expandableContent: Stack(children: [
            Container(
                color: Viol,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .6),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 5, left: 29, right: 29),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Neumorphic(
                          child: Container(
                              width: 65,
                              height: 122,
                              color: Viol,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        DateFormat.Hm().format(
                                            DateTime.fromMillisecondsSinceEpoch(
                                                data.weather.hourly_weather[0].time!.round() * 1000)),
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    getWeatherIcon(data.weather.hourly_weather[0].image.toString()),
                                    Text(
                                      data.weather.hourly_weather[0].temp!.round().toString()+'˚c',
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                              ))),
                      Neumorphic(
                          child: Container(
                              width: 65,
                              height: 122,
                              color: Viol,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children:  [
                                    Text(
                                      DateFormat.Hm().format(
                                          DateTime.fromMillisecondsSinceEpoch(
                                              data.weather.hourly_weather[6].time!.round() * 1000)),
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    getWeatherIcon(data.weather.hourly_weather[6].image.toString()),
                                    Text(
                                      data.weather.hourly_weather[6].temp!.round().toString()+'˚c',
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ))),
                      Neumorphic(
                          child: Container(
                              width: 65,
                              height: 122,
                              color: Viol,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      DateFormat.Hm().format(
                                          DateTime.fromMillisecondsSinceEpoch(
                                              data.weather.hourly_weather[12].time!.round() * 1000)),
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    getWeatherIcon(data.weather.hourly_weather[12].image.toString()),
                                    Text(
                                      data.weather.hourly_weather[12].temp!.round().toString()+'˚c',
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ))),
                      Neumorphic(
                          child: Container(
                              width: 65,
                              height: 122,
                              color: Viol,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children:[
                                    Text(
                                      DateFormat.Hm().format(
                                          DateTime.fromMillisecondsSinceEpoch(
                                              data.weather.hourly_weather[18].time!.round() * 1000)),
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    getWeatherIcon(data.weather.hourly_weather[18].image.toString()),
                                    Text(
                                      data.weather.hourly_weather[18].temp!.round().toString()+'˚c',
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ))),
                    ],
                  ),
                ),
                Visibility(
                  visible: ExpOn,
                  child: Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 29.0, right: 29.0, top: 50),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Neumorphic(
                                child: Container(
                                  width: 150,
                                  height: 65,
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.only(left: 52.0),
                                    child: Row(children: [
                                      Container(
                                        width: 12,
                                        height: 24,
                                        child: NeumorphicIcon(
                                          Icons.thermostat_sharp,
                                          style: const NeumorphicStyle(
                                            color: Color(0xff5A5A5A),
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                          padding:
                                          EdgeInsets.only(left: 5)),
                                      Text(
                                        data.weather.current.temp!.round().toString(),
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const Text(
                                        '˚c',
                                        style: TextStyle(
                                          color: Color(0xff5A5A5A),
                                          fontSize: 16,
                                        ),
                                      ),
                                    ]),
                                  ),
                                ),
                                style: const NeumorphicStyle(
                                  color: Colors.transparent,
                                ),
                              ),
                              Neumorphic(
                                child: Container(
                                  width: 150,
                                  height: 65,
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.only(left: 42.0),
                                    child: Row(children: [
                                      Container(
                                        width: 19,
                                        height: 24,
                                        child: const Image(
                                          image: AssetImage(
                                            'assets/drop.png',
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                          padding:
                                          EdgeInsets.only(left: 5)),
                                      Text(
                                        data.weather.current.humidity!.round().toString(),
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const Text(
                                        '%',
                                        style: TextStyle(
                                          color: Color(0xff5A5A5A),
                                          fontSize: 16,
                                        ),
                                      ),
                                    ]),
                                  ),
                                ),
                                style: const NeumorphicStyle(
                                  color: Colors.transparent,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 29.0, right: 29.0, top: 15),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Neumorphic(
                                child: Container(
                                  width: 150,
                                  height: 65,
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.only(left: 38.0),
                                    child: Row(children: [
                                      Container(
                                        width: 19,
                                        height: 24,
                                        child: NeumorphicIcon(
                                          Icons.air,
                                          style: const NeumorphicStyle(
                                            color: Color(0xff5A5A5A),
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                          padding:
                                          EdgeInsets.only(left: 5)),
                                      Text(
                                        data.weather.current.windSpeed!.round().toString(),
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const Text(
                                        'м/с',
                                        style: TextStyle(
                                          color: Color(0xff5A5A5A),
                                          fontSize: 16,
                                        ),
                                      ),
                                    ]),
                                  ),
                                ),
                                style: const NeumorphicStyle(
                                  color: Colors.transparent,
                                ),
                              ),
                              Neumorphic(
                                child: Container(
                                  width: 150,
                                  height: 65,
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.only(left: 15.0),
                                    child: Row(children: [
                                      Container(
                                        width: 19,
                                        height: 24,
                                        child: NeumorphicIcon(
                                          Icons.speed,
                                          style: const NeumorphicStyle(
                                            color: Color(0xff5A5A5A),
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                          padding:
                                          EdgeInsets.only(left: 5)),
                                      Text(
                                        data.weather.current.pressure!.round().toString(),
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const Text(
                                        'мм.рт.ст',
                                        style: TextStyle(
                                          color: Color(0xff5A5A5A),
                                          fontSize: 16,
                                        ),
                                      ),
                                    ]),
                                  ),
                                ),
                                style: const NeumorphicStyle(
                                  color: Colors.transparent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Visibility(
                    visible: !ExpOn,
                  child: Container(
                    width: 170,
                    height: 40,
                    margin: const EdgeInsets.only(top: 16),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Blue),
                        backgroundColor: Bot,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),

                        onPressed: () {

                          Navigator.of(context).push(MaterialPageRoute(builder: (_) => WeeklyForecast()));
                        },
                        child: const Text(
                          "Прогноз на неделю",
                          style: TextStyle(
                            color: Color(0xff038CFE),
                            fontSize: 14,
                          ),
                        ),
                      ),),),
              ],
            ),
          ])),
    );
  }
  }
