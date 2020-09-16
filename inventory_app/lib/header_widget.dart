import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory_app/login/screens/auth/auth.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';

class HeaderWidget extends StatelessWidget {

  String title;
  String actualView;
  bool button;
  var view;

  HeaderWidget(this.button, {this.view, this.title, this.actualView});

  @override
  Widget build(BuildContext context) {

    final titleHome = Container(
      margin: EdgeInsets.only(
          bottom: 4
      ),
      child: Text(
        title,
        style: GoogleFonts.openSans(
            textStyle: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
      ),
    );

    final actualHome = Container(
      child: Text(
        actualView,
        style: GoogleFonts.openSans(
            textStyle: TextStyle(
                color: Color(0xffa29aac),
                fontSize: 14,
                fontWeight: FontWeight.w600)),
      ),
    );

    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 105,
          ),
          height: 65,
          width: MediaQuery.of(context).size.width*0.6,
          decoration: BoxDecoration(
            color: Color(0xff392850),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50),
              bottomRight: Radius.circular(10)
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xff392850),
                blurRadius: 10,
                spreadRadius: 1,
              )
            ]
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 110,
              bottom: 55
          ),
        padding: EdgeInsets.only(
          left: 16,
          right: 16
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                titleHome,
                actualHome,
              ],
            ),
              !button ? IconButton(
                alignment: Alignment.center,
                icon: Icon(
                  Icons.power_settings_new,
                  color: Color(0xff392850),
                ),
                onPressed: () {
                  context.signOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) => AuthScreen(),
                  ));
                },
              ) :IconButton(
              alignment: Alignment.center,
              icon: Icon(
              Icons.add,
              color: Color(0xff392850),
              ),
              onPressed: () {
              Navigator.push(context, MaterialPageRoute(
              builder: (context) => view,
              ));
              },
        )
        ],
        ),
        ),
      ],
    );
  }
}
