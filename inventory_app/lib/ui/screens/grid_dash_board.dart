import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory_app/ui/screens/home.dart';
import 'package:inventory_app/ui/screens/inventory.dart';

class GridDashboard extends StatelessWidget {

  String title;
  String subtitle;
  String img;
  var view;

  GridDashboard({this.title, this.subtitle, this.img, this.view});

  void navigateNewScreen(var view, BuildContext context){
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => view,
    ));
  }

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
                  color: Color(0xff453658),
                  fontSize: 16,
                  fontWeight: FontWeight.w700)
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
                color: Color(0xff453658),
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
          color: Color(0xff453658).withAlpha(70),
          borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () => navigateNewScreen(view, context),
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