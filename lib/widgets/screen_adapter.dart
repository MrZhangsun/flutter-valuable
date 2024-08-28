import 'package:flutter/material.dart';

class AppPadding {
  static EdgeInsets all(BuildContext context, double rate) {
    return EdgeInsets.all(MediaQuery.of(context).size.width * rate);
  }

  static EdgeInsets left(BuildContext context, double rate) {
    return EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width * rate, 0, 0, 0);
  }

  static EdgeInsets right(BuildContext context, double rate) {
    return EdgeInsets.fromLTRB(
        0, 0, MediaQuery.of(context).size.width * rate, 0);
  }

  static EdgeInsets top(BuildContext context, double rate) {
    return EdgeInsets.fromLTRB(
        0, MediaQuery.of(context).size.width * rate, 0, 0);
  }

  static EdgeInsets bottom(BuildContext context, double rate) {
    return EdgeInsets.fromLTRB(
        0, 0, 0, MediaQuery.of(context).size.width * rate);
  }

  static EdgeInsets horizontal(BuildContext context, double rate) {
    return EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * rate);
  }

  static EdgeInsets vertical(BuildContext context, double rate) {
    return EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.width * rate);
  }

  static EdgeInsets only(BuildContext context,
      {double left = 0, double top = 0, double right = 0, double bottom = 0}) {
    return EdgeInsets.only(
        left: MediaQuery.of(context).size.width * left,
        top: MediaQuery.of(context).size.width * top,
        right: MediaQuery.of(context).size.width * right,
        bottom: MediaQuery.of(context).size.width * bottom);
  }
}

class ScreenAdapter {
  static double width = 375; //设计稿的宽度
  static double height = 667; //设计稿的高度
  static double fontSize = 16; // 设计稿字体大小

  static double screenWidth = 0;
  static double screenHeight = 0;
  static double textScaleFactor = 0;

  static double rpx(double px) {
    return screenWidth / width * px;
  }

  static double rpxHeight(double px) {
    return screenHeight / height * px;
  }

  static double rpxFontSize(double size) {
    return textScaleFactor * size / fontSize;
  }
}
