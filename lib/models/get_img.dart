import 'package:flutter/cupertino.dart';

Image getWeatherIcon(String _icon){
  String path = 'assets/icons/';
  String ext = '.png';
  return Image.asset(
    path+_icon+ext
  );
}
Image getWeatherIconWeek(String _i) {
  String path = 'assets/week/';
  String ext = '.png';
  return Image.asset(
    path + _i + ext,
    width: 119,
    height: 119,
  );
}




























