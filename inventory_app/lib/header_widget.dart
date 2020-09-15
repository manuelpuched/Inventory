import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

    return Container(
      margin: EdgeInsets.only(
          top: 110,
          bottom: 40
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
          !button ? Container() :IconButton(
            alignment: Alignment.topCenter,
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => view,
              ));
            },
          )
        ],
      ),
    );
  }
}
