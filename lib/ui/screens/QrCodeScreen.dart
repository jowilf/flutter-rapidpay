import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

import '../../StringRes.dart';
import '../../res.dart';

class QrCodeScreen extends StatefulWidget {
  @override
  State createState() => QrCodeScreenState();
}

class QrCodeScreenState extends State<QrCodeScreen> {
  Uint8List image;

  @override
  void initState() {
    super.initState();
    scanner.generateBarCode('rapidpay').then((value) => this.setState(() {
          image = value;
        }));
  }

  var leftStyle = TextStyle(color: Palette.colorPrimary, fontFamily: FontRes.medium);
  var rightStyle = TextStyle(color: Palette.greyText,fontFamily: FontRes.medium);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            if (image != null)
              Center(
                child: Container(
                    padding: EdgeInsets.only(top: 30),
                    width: 200,
                    height: 200,
                    child: Image(image: MemoryImage(image))),
              ),
            Container(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Palette.greyDark, width: 1)),
              ),
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Montant",
                        style: leftStyle,
                      ),
                      Text(
                        "10 000 CFA",
                        style: rightStyle,
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "A",
                        style: leftStyle,
                      ),
                      Text(
                        "John Doe",
                        style: rightStyle,
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Crée le",
                        style: leftStyle,
                      ),
                      Text(
                        "20 juin 2020 à 15h:00",
                        style: rightStyle,
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Expire le",
                        style: leftStyle,
                      ),
                      Text(
                        "20 Juillet 2020",
                        style: rightStyle,
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "ID",
                        style: leftStyle,
                      ),
                      Text(
                        "DEM-580164-NMR",
                        style: rightStyle,
                      )
                    ],
                  ),
                ],
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

                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: RichText(text: TextSpan(
                        text: "",
                        children: [
                          WidgetSpan(child: Icon(Icons.share,color: Colors.white,)),
                          TextSpan(text: "  Partager le code")
                        ],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: StringRes.Avenir_Light,
                            fontWeight: FontWeight.bold),
                      ))
                    )),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: true,
          elevation: 2,
          backgroundColor: Colors.white,
          title: Text(
            "Code de Paiement",
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
}
