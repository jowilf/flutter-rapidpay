import 'dart:ui';

import 'package:flutter/material.dart';

class FontRes {
  static const book = "AirbnbCereal-Book";
  static const light = "AirbnbCereal-Light";
  static const medium = "AirbnbCereal-Medium";
}

class Palette {
  static const blue = Color(0xFF1F5080);
  static const black = Color(0xFF212529);
  static const yellow = Color(0xFFFFF600);
  static const grey = Color(0xFFD2DCE6);
  static const greyDark = Color(0xFFCED4DA);
  static const red = Color(0xFFCE3535);
  static const green = Color(0xFF0f9200);
  static const colorPrimary =
      Color(0xFF00AAE5); //Color(0xFF0f9200);//Color(0xffff8c29);
  static const colorPrimaryLight = Color(0xFFFDEDD4);
  static const colorPrimaryDark = Color(0xffc45a00);
  static const colorSecondary = Color(0xFFF52C56);
  static const colorBlue = Color(0xFF5754D5);
  static const colorBlack = Color(0xff242a37);
  static const colorBlueBlack = Color(0xff091F44);
  static const colorGrey = Color(0xfff1f2f6);
  static Color colorGreyBack = Colors.grey.shade50;
  static const greyText = Color(0xffA7A7A7);

  //static const greyDark = Color(0xffD2D1D7);
  static const whiteBackGround = Color(0xffffffff);
}

class AppRoutes {
  static const String root = "/";
  static const String login = "/login";
  static const String register = "/register";
  static const String phoneVerification = "/phoneVerification";
  static const String forgotPassword = "/forgotPassword";
  static const String resetPassword = "/resetPassword";
  static const String account = "/account";
  static const String sendMoney = "/sendMoney";
  static const String activity = "/activity";
  static const String users = "/users";
  static const String qrcode = "/qrcode";
}

class Res {
  static const backIcon = Icons.arrow_back;
  static const logo = 'assets/images/logo.png';
  static const user = 'assets/images/user.jpeg';
}

class Styles {
  static const hugeBlueBlackTitle =
      TextStyle(color: Palette.black, fontFamily: FontRes.medium, fontSize: 30);
  static const mediumBlueBlackTitle =
      TextStyle(color: Palette.black, fontFamily: FontRes.medium, fontSize: 20);
  static const smallTextGrey = TextStyle(color: Palette.greyText, fontSize: 15);
  static const smallTextGreyBold = TextStyle(
      color: Palette.greyText, fontSize: 15, fontWeight: FontWeight.bold);
  static const priceStyle =
      TextStyle(color: Palette.blue, fontSize: 16, fontWeight: FontWeight.bold);
}
