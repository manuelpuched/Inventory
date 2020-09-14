import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridDashboard extends StatelessWidget {

  String title;
  String subtitle;
  String img;

  GridDashboard({this.title, this.subtitle, this.img});

  @override
  Widget build(BuildContext context) {

    final imgHome = Container(
      child: Image.asset(
        img,
        width: 60,
      ),
    );

    final titleHome = Container(
      margin: EdgeInsets.only(
        top: 14,
        bottom: 8
      ),
      child: Text(
        title,
          style: GoogleFonts.openSans(
              textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600)
          )
      ),
    );

    final subtitleHome = Container(
      margin: EdgeInsets.only(
        bottom: 14
      ),
      child: Text(
        subtitle,
        style: GoogleFonts.openSans(
            textStyle: TextStyle(
                color: Colors.white38,
                fontSize: 10,
                fontWeight: FontWeight.w600)),
      ),
    );

    return Container(
      margin: EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: 20
      ),
      height: 180,
      width: 180,
      decoration: BoxDecoration(
          color: Color(0xff453658),
          borderRadius: BorderRadius.circular(15)
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: (){
          Scaffold.of(context).showSnackBar(
              SnackBar(content: Text(title))
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imgHome,
            titleHome,
            subtitleHome,
          ],
        ),
      ),
    );
  }
}