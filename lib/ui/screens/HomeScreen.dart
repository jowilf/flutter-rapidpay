import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:rapidpay/StringRes.dart';
import 'package:rapidpay/utils/Utils.dart';

import '../../res.dart';

class HomeScreen extends StatefulWidget {
  @override
  State createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int counter = 1;

  @override
  void initState() {
    super.initState();
    notification();
  }

  void notification() async {
    while (true) {
      await Future.delayed(Duration(seconds: 5));
      setState(() {
        counter += 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.whiteBackGround,
        body: SafeArea(
            child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      color: Palette.colorPrimary,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Column(
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () => Navigator.pushNamed(
                                      context, AppRoutes.login),
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle),
                                    child: CircleAvatar(
                                      radius: 50,
                                      backgroundImage: AssetImage(
                                        Res.user,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Jocelin Hounon",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                RichText(
                                    text: TextSpan(
                                        text: "Votre solde est de: ",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.white),
                                        children: [
                                      TextSpan(
                                          text: "46 987 CFA",
                                          style: TextStyle(
                                              fontFamily: FontRes.medium,
                                              fontSize: 22))
                                    ])),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    /*Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Contacts",
                            style: TextStyle(
                                fontSize: 14, fontFamily: FontRes.medium),
                          ),
                          Text(
                            'Voir tout',
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: FontRes.medium,
                                color: Palette.colorPrimary),
                          )
                        ],
                      ),
                    ),*/
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Dernières activités",
                            style: TextStyle(
                                fontSize: 14, fontFamily: FontRes.medium),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, AppRoutes.activity),
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                'Voir tout',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: FontRes.medium,
                                    color: Palette.colorPrimary),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Card(
                        elevation: 4,
                        child: ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (context, index) => Divider(),
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return IntrinsicHeight(
                              child: Container(
                                //margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundImage: AssetImage(
                                        Res.user,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text("John Doe",
                                              style: TextStyle(
                                                  fontFamily: FontRes.medium,
                                                  fontSize: 16)),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                            "Achat de gaz",
                                            style: TextStyle(
                                                color: Palette.greyText),
                                          ),
                                          Text(
                                            "11 dec. 2020 à 7h:00",
                                            style: TextStyle(
                                                color: Palette.colorPrimary),
                                          )
                                        ],
                                      ),
                                    ),
                                    Text(
                                      "${index % 2 == 0 ? "" : "-"}${index * 500 + 500} CFA",
                                      style: TextStyle(
                                          fontFamily: FontRes.medium,
                                          fontSize: 20,
                                          color: index % 2 == 0
                                              ? Palette.green
                                              : Palette.colorSecondary),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              decoration: new BoxDecoration(color: Colors.white, boxShadow: [
                new BoxShadow(
                  color: Palette.greyDark,
                  blurRadius: 4,
                ),
              ]),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Material(
                      child: InkWell(
                        onTap: send,
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.payment,
                                  color: Palette.colorPrimary,
                                ),
                                Text(
                                  "Envoyer",
                                  style: TextStyle(
                                      fontSize: 12, fontFamily: FontRes.medium),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Material(
                      child: InkWell(
                        onTap: scan,
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  MdiIcons.qrcodeScan,
                                  color: Palette.colorPrimary,
                                ),
                                Text(
                                  "Scanner",
                                  style: TextStyle(
                                      fontSize: 12, fontFamily: FontRes.medium),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Material(
                      child: InkWell(
                        onTap: generate,
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  MdiIcons.qrcodePlus,
                                  color: Palette.colorPrimary,
                                ),
                                Text(
                                  "Générer un code",
                                  style: TextStyle(
                                      fontSize: 12, fontFamily: FontRes.medium),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )),
        appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: true,
          elevation: 0.0,
          backgroundColor: Palette.colorPrimary,
          title: Text(
            "RapidPay",
            style: TextStyle(fontFamily: FontRes.medium),
          ),
          actions: <Widget>[
            Badge(
              badgeContent: Text("$counter",
                  style: TextStyle(fontSize: 10, color: Colors.white)),
              badgeColor: Palette.red,
              borderRadius: 50,
              showBadge: counter > 0,
              position: BadgePosition.topRight(top: 5, right: 10),
              child: IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {},
              ),
            ),
//            IconButton(icon: Icon(MdiIcons.contacts), onPressed: () => null)
          ],
        ));
  }

  void scan() async {
    String code = await scanner.scan();
    Utils.toast(code);
    Navigator.pushNamed(context, AppRoutes.sendMoney,
        arguments: {'name': code, 'type': StringRes.SEND});
  }

  void send() {
    Navigator.pushNamed(context, AppRoutes.users);
  }

  void generate() {
    Navigator.pushNamed(context, AppRoutes.sendMoney,
        arguments: {'type': StringRes.GENERATE});
  }
}
