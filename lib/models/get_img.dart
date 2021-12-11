import 'package:flutter/cupertino.dart';

Image getWeatherIcon(String _icon){
  String path = 'assets/icons/';
  String ext = '.png';
  return Image.asset(
    path+_icon+ext
  );
}
