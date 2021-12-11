import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Daily extends StatelessWidget {
   Daily(
      {Key? key, this.day, this.image,this.temperature, this.speed, this.humidity,this.pressure}) : super(key: key);

  String? day;
  String? image;
  num? temperature;
  num? speed;
  num? humidity;
  num? pressure;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 387,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFCDDAF5),
            Color(0xFF9CBCFF),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16),
            child: Text(
              day.toString(),
              style: const TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16),
            child: Container(
              height: 76,
              width: 85,
              child: Image(
                image: AssetImage(image.toString()),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 44, left: 22),
            child: Row(children: [
              Container(
                width: 12,
                height: 24,
                child: const Icon(
                  Icons.thermostat_sharp,
                  color: Color(0xff5A5A5A),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 5)),
              Text(
                temperature.toString(),
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
          Padding(
            padding: const EdgeInsets.only(top: 28, left: 22),
            child: Row(children: [
              Container(
                width: 19,
                height: 24,
                child: const Icon(
                  Icons.air,
                  color: Color(0xff5A5A5A),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 5)),
              Text(
                speed.toString(),
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
          Padding(
            padding: const EdgeInsets.only(top: 28, left: 22),
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
              Padding(padding: EdgeInsets.only(left: 5)),
              Text(
                humidity.toString(),
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
          Padding(
            padding: const EdgeInsets.only(top: 28, left: 22),
            child: Row(children: [
              Container(
                width: 19,
                height: 24,
                child: const Icon(
                  Icons.speed,
                  color: Color(0xff5A5A5A),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 5)),
              Text(
                pressure.toString(),
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
        ],
      ),
    );
  }
}
