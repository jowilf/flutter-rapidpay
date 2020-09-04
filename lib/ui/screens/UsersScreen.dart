import 'package:flutter/material.dart';
import 'package:rapidpay/StringRes.dart';
import 'package:rapidpay/ui/components/RoundEditText.dart';

import '../../res.dart';

class UsersScreen extends StatefulWidget {
  @override
  State createState() => UserScreenState();
}

class UserScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: RoundEditText(hintText: "Rechercher"),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: 0.75,
                child: Container(
                  color: Colors.grey.shade300,
                ),
              ),
              itemCount: 20,
              itemBuilder: (context, index) {
                return Material(
                  color: Colors.white,
                  child: InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, AppRoutes.sendMoney,
                            arguments: {'name': 'John Doe', 'type': StringRes.SEND}),
                    child: IntrinsicHeight(
                      child: Container(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage(
                                  Res.user,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text("John Doe",
                                  style: TextStyle(fontSize: 16)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: true,
          elevation: 2,
          backgroundColor: Colors.white,
          title: Text(
            "Choisir le bénéficiaire",
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
