import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'grid_dash_board.dart';

class Home extends StatelessWidget {

  String title;
  String actualView = "Home";

  Home({this.title});

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

    return Scaffold(
      backgroundColor: Color(0xff392850),
      body: Column(
        children: <Widget>[
          Container(
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
                    actualHome
                  ],
                ),
                IconButton(
                  alignment: Alignment.topCenter,
                  icon: Image.asset(
                    "assets/notification.png",
                    width: 24,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GridDashboard(title:"Perfil", subtitle:"Modifica tu perfil", img:"assets/images/user_icon.png"),
              GridDashboard(title:"Inventario", subtitle:"Verifica tu inventario", img:"assets/images/inventory_icon.png"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GridDashboard(title:"Productos", subtitle:"Crea nuevos productos", img:"assets/images/product_icon.png"),
              GridDashboard(title:"Finanzas", subtitle:"Controla tus finanzas", img:"assets/images/finance_icon.png"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GridDashboard(title:"Calculadora", subtitle:"Haz Calculos", img:"assets/images/calculator_icon.png"),
              GridDashboard(title:"Configuracion", subtitle:"Configura la app", img:"assets/images/config_icon.png"),
            ],
          )
        ],
      ),
    );
  }
}
