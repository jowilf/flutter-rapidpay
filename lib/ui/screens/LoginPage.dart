import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:rapidpay/ui/components/RoundEditText.dart';

import '../../StringRes.dart';
import '../../res.dart';

class LoginPage extends StatefulWidget {
  @override
  State createState() => LoginPageState();
}


class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    //FlutterStatusbarcolor.setStatusBarColor(Colors.blue);
    return Scaffold(
      backgroundColor: Palette.whiteBackGround,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  Res.logo,
                  height: 70,
                ),
              ),
              Center(
                child: Text(
                  StringRes.connectez_vous,
                  style: Styles.hugeBlueBlackTitle,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Text(
                  StringRes.information_de_connexion,
                  style: Styles.smallTextGreyBold,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RoundEditText(
                hintText: StringRes.phone,
                prefixText: StringRes.phone_code,
                inputType: TextInputType.phone,
              ),
              SizedBox(
                height: 10,
              ),
              RoundEditText(
                hintText: StringRes.mot_de_passe,
                obscureText: true,
              ),
              SizedBox(
                height: 40,
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
                      onPressed: () => null,
                      child: Container(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          StringRes.se_connecter,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: StringRes.Avenir_Light,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, AppRoutes.forgotPassword),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        StringRes.mot_de_passe_oublie,
                        style: TextStyle(
                            color: Palette.colorSecondary,
                            fontSize: 16,
                            fontFamily: StringRes.Avenir_Heavy,
                            decoration: TextDecoration.underline),
                      ),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => Navigator.pushNamed(context, AppRoutes.register),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: RichText(
                      text: TextSpan(
                          text: StringRes.vous_navez_pas_de_compte,
                          style: TextStyle(
                              fontSize: 16,
                              color: Palette.greyText,
                              fontFamily: StringRes.Avenir_Book),
                          children: [
                            TextSpan(
                              text: StringRes.s_inscrire,
                              style: TextStyle(
                                  fontFamily: StringRes.Avenir_Heavy,
                                  color: Palette.colorPrimary),
                            )
                          ]),
                    ),
                  ),
                ),
              )
              //SizedBox(10)
            ],
          ),
        ),
      ),
    );
  }
}
