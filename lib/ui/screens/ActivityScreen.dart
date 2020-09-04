import 'package:flutter/material.dart';

import '../../res.dart';

class ActivityScreen extends StatefulWidget {
  @override
  State createState() => ActivityScreenState();
}

class ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: 20,
        itemBuilder: (context, index) {
          return IntrinsicHeight(
            child: Container(
              //margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("John Doe",
                            style: TextStyle(
                                fontFamily: FontRes.medium, fontSize: 16)),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Achat de gaz",
                          style: TextStyle(color: Palette.greyText),
                        ),
                        Text(
                          "11 dec. 2020 à 7h:00",
                          style: TextStyle(color: Palette.colorPrimary),
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
      appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: true,
          elevation: 2,
          backgroundColor: Colors.white,
          title: Text(
            "Activités",
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
