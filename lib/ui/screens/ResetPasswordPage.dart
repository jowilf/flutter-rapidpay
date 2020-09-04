import 'package:flutter/material.dart';
import 'package:rapidpay/ui/components/RoundEditText.dart';

import '../../StringRes.dart';
import '../../res.dart';
class ResetPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    return Scaffold(
      backgroundColor: Palette.whiteBackGround,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                StringRes.renitialiser_mot_de_passe,
                style: Styles.hugeBlueBlackTitle,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            RoundEditText(
              hintText: StringRes.nouveau_mot_de_passe,
              obscureText: true,
            ),
            SizedBox(
              height: 10,
            ),
            RoundEditText(
              hintText: StringRes.confirmer_mot_de_passe,
              obscureText: true,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                child: FlatButton(
                  color: Palette.colorPrimary,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30),
                  ),
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(
                    context, AppRoutes.login, (r) => false),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      StringRes.renitialiser_mot_de_passe,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: StringRes.Avenir_Light,
                        fontWeight: FontWeight.bold),
                    ),
                  )),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text(""),
          leading: IconButton(
            icon: Icon(
              Res.backIcon,
              color: Palette.colorBlueBlack,
            ),
            onPressed: () => Navigator.pop(context),
          )),
    );
  }
}
