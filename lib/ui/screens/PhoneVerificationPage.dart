import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:libphonenumber/libphonenumber.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../StringRes.dart';
import '../../res.dart';

class PhoneVerificationPage extends StatefulWidget {
  String phoneNumber;

  PhoneVerificationPage(this.phoneNumber);

  @override
  State createState() => PhoneVerificationPageState(phoneNumber);
}

class PhoneVerificationPageState extends State<PhoneVerificationPage> {
  String phoneNumber, actualCode;
  String formattedText = "";
  String _code = "";
  final Duration timeout = Duration(seconds: 0);

  PhoneVerificationPageState(this.phoneNumber);

  @override
  void initState() {
    //sendSms();
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    //FlutterStatusbarcolor.setStatusBarColor(Colors.white);

    var regionInfo =
        PhoneNumberUtil.getRegionInfo(phoneNumber: phoneNumber, isoCode: 'BJ');
    print(regionInfo);
    return Scaffold(
      backgroundColor: Palette.whiteBackGround,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                StringRes.verification_numero,
                textAlign: TextAlign.center,
                style: Styles.hugeBlueBlackTitle,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: StringRes.en_attente_otp,
                    style: TextStyle(
                        color: Palette.greyText,
                        fontSize: 15,
                        fontFamily: StringRes.Avenir_Book),
                    children: [
                      TextSpan(
                          text: "${phoneNumber.substring(4)}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Palette.colorBlueBlack))
                    ]),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      StringRes.changer_le_num,
                      style: TextStyle(
                          color: Palette.colorSecondary,
                          fontSize: 16,
                          fontFamily: StringRes.Avenir_Heavy),
                    ),
                  )),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, top: 20, right: 20),
              child: PinCodeTextField(
                length: 6,
                obsecureText: false,
                animationType: AnimationType.fade,
                shape: PinCodeFieldShape.box,
                animationDuration: Duration(milliseconds: 300),
                borderRadius: BorderRadius.all(Radius.circular(5)),
                fieldHeight: 40,
                activeColor: Palette.colorPrimary,
                activeFillColor: Palette.colorPrimary,
                textStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                inactiveFillColor: Palette.colorGrey,
                selectedFillColor: Palette.colorGrey,
                selectedColor: Palette.colorPrimary,
                dialogContent: StringRes.voulez_vous_utiliser,
                dialogTitle: "Coller",
                affirmativeText: "Utiliser",
                negativeText: "Annuler",
                enableActiveFill: true,
                inactiveColor: Palette.colorGrey,
                onChanged: (value) {
                  _code = value;
                },
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              StringRes.code_recu_sms,
              style: TextStyle(color: Palette.greyText),
            ),
            SizedBox(
              height: 30,
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
                    onPressed: () {
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        StringRes.confirmer,
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
              height: 30,
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => null,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: StringRes.vous_navez_pas_recu_code + "\n",
                        style: TextStyle(
                            fontSize: 14,
                            color: Palette.greyText,
                            fontFamily: StringRes.Avenir_Book),
                        children: [
                          TextSpan(
                            text: StringRes.renvoyer_code,
                            style: TextStyle(
                                fontFamily: StringRes.Avenir_Heavy,
                                color: Palette.colorPrimary),
                          )
                        ]),
                  ),
                ),
              ),
            )
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
