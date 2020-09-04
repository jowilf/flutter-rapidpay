import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:rapidpay/res.dart';
import 'package:rapidpay/ui/screens/ActivityScreen.dart';
import 'package:rapidpay/ui/screens/ForgotPasswordPage.dart';
import 'package:rapidpay/ui/screens/HomeScreen.dart';
import 'package:rapidpay/ui/screens/LoginPage.dart';
import 'package:rapidpay/ui/screens/PhoneVerificationPage.dart';
import 'package:rapidpay/ui/screens/QrCodeScreen.dart';
import 'package:rapidpay/ui/screens/RegisterPage.dart';
import 'package:rapidpay/ui/screens/ResetPasswordPage.dart';
import 'package:rapidpay/ui/screens/SendMoneyScreen.dart';
import 'package:rapidpay/ui/screens/UsersScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Palette.colorPrimary);
    return MaterialApp(
      title: 'Recharge App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        cursorColor: Palette.greyText,
        fontFamily: FontRes.book,
        primaryColor: Palette.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) => makeRoute(
              context: context,
              routeName: settings.name,
              arguments: settings.arguments),
          maintainState: true,
        );
      },
    );
  }

  Widget makeRoute(
      {@required BuildContext context,
      @required String routeName,
      Object arguments}) {
    final Widget child = _buildRoute(
        context: context, routeName: routeName, arguments: arguments);
    return child;
  }

  Widget _buildRoute({
    @required BuildContext context,
    @required String routeName,
    Object arguments,
  }) {
    print('-----------------');
    print("Navigate to: " + routeName);
    print('-----------------');
    switch (routeName) {
      case AppRoutes.root:
        return HomeScreen();
      case AppRoutes.resetPassword:
        return ResetPasswordPage();
      case AppRoutes.forgotPassword:
        return ForgotPasswordPage();
      case AppRoutes.login:
        return LoginPage();
      case AppRoutes.register:
        return RegisterPage();
      case AppRoutes.phoneVerification:
        return PhoneVerificationPage(arguments);
      case AppRoutes.sendMoney:
        return SendMoneyScreen(arguments);
      case AppRoutes.activity:
        return ActivityScreen();
      case AppRoutes.users:
        return UsersScreen();
      case AppRoutes.qrcode:
        return QrCodeScreen();
    }
  }
}
