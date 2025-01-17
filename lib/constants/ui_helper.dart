import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UIHelper {
  UIHelper._();

  static final Map<String, Color> _typeColorMap = {
    'Grass': Colors.green,
    'Fire': Colors.redAccent,
    'Water': Colors.blue,
    'Electric': Colors.yellow,
    'Rock': Colors.grey,
    'Ground': Colors.brown,
    'Bug': Colors.lightGreenAccent,
    'Psychic': Colors.indigo,
    'Fighting': Colors.orangeAccent,
    'Ghost': Colors.deepPurpleAccent,
    'Normal': Colors.black26,
    'Poison': Colors.deepPurpleAccent,
  };

  static dynamic getColorFromType( type) {
    if (_typeColorMap.containsKey(type)) {
      return _typeColorMap[type] ?? Colors.pink.shade300;
    } else {
      Colors.pink.shade300;
    }
  }

  static double getAppTitleWidgetHeight() {
    return ScreenUtil().orientation == Orientation.portrait ? 0.15.sh : 0.15.sw;
  }

  static EdgeInsets getDefaultPadding() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return EdgeInsets.all(12.h);
    } else {
      return EdgeInsets.all(8.w);
    }
  }

  static double calculatePokeImageAndBallSize() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return 0.2.sw;
    } else {
      return 0.3.sh;
    }
  }
}
