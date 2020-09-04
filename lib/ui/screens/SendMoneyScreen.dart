import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:rapidpay/ui/components/RoundEditText.dart';

import '../../StringRes.dart';
import '../../res.dart';

class SendMoneyScreen extends StatefulWidget {
  Map<String, dynamic> data;

  SendMoneyScreen(this.data);

  @override
  State createState() => SendMoneyScreenState(data);
}

MoneyMaskedTextController _money = MoneyMaskedTextController(
    thousandSeparator: " ",
    decimalSeparator: '',
    initialValue: 0,
    precision: 0);

class SendMoneyScreenState extends State<SendMoneyScreen> {
  Map<String, dynamic> data;

  SendMoneyScreenState(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: _money,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                    ],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 50,
                        color: Palette.black,
                        fontFamily: FontRes.medium),
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                  Chip(
                    backgroundColor: Palette.colorPrimary,
                    padding: EdgeInsets.all(0),
                    label: Text('Franc CFA',
                        style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RoundEditText(
                    hintText: "Votre message",
                    maxLines: 4,
                    maxLength: 400,
                  )
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              child: FlatButton(
                  color: Palette.colorPrimary,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30),
                  ),
                  onPressed: () {
                    if (!isSend()) generate();
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      isSend() ? "Envoyer" : "Générer",
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
      )),
      appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text(
            isSend() ? "Envoyer à ${data['name']}" : "Générer",
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            icon: Icon(
              Res.backIcon,
              color: Palette.colorBlueBlack,
            ),
            onPressed: () => Navigator.pop(context),
          )),
    );
  }

  void generate() {
    Navigator.pushReplacementNamed(context, AppRoutes.qrcode);
  }

  bool isSend() => data['type'] == StringRes.SEND;
}
