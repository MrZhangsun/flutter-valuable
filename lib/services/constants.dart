import 'package:flutter/material.dart';

const String baseUrl = 'http://127.0.0.1:8080';

class IconFont {
  static IconData creation =
      const IconData(0xe691, matchTextDirection: true, fontFamily: "iconfont");
  static IconData rmb =
      const IconData(0xe7d8, matchTextDirection: true, fontFamily: "iconfont");
}

class AppColors {
  static const Color primaryColor = Colors.blue;
  static const Color secondaryColor = Colors.green;
  static const Color backgroundColor = Colors.white;
  static const Color textHead1Color = Color.fromRGBO(0, 255, 0, 1);
  static const Color textHead2Color = Color.fromRGBO(14, 38, 223, 1);
  static const Color textHead3Color = Color.fromRGBO(100, 109, 100, 1);
  static const Color textHead4Color = Color.fromRGBO(35, 37, 35, 1);
  static const Color textContentColor = Color.fromRGBO(34, 26, 26, 1);

  static const Color accentColor = Colors.orange;
  static const Color iconColor = Color.fromARGB(255, 215, 98, 15);
}
