import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inventory_app/grid_products.dart';
import 'package:inventory_app/header_widget.dart';
import 'package:inventory_app/inventory.dart';
import 'package:inventory_app/product_view.dart';
import 'package:inventory_app/settings.dart';
import 'package:inventory_app/user.dart';
import 'grid_dash_board.dart';

class Home extends StatelessWidget {

  User user;
  Home({this.user});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          HeaderWidget(false, title: "Home", actualView: "DashBoard"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GridDashboard(
                  title: "Profile",
                  subtitle: "Modifica tu perfil",
                  img: "assets/images/user_icon.png"),
              GridDashboard(
                title: "Inventory",
                subtitle: "Verifica tu inventario",
                img: "assets/images/inventory_icon.png",
                view: Inventory(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GridDashboard(
                  title: "Products",
                  subtitle: "Crea nuevos productos",
                  img: "assets/images/product_icon.png",
                  view: ProductView()),
              GridDashboard(
                  title: "Finances",
                  subtitle: "Controla tus finanzas",
                  img: "assets/images/finance_icon.png"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GridDashboard(
                  title: "Calculator",
                  subtitle: "Haz Calculos",
                  img: "assets/images/calculator_icon.png"),
              GridDashboard(
                title: "Settings",
                subtitle: "Configura la app",
                img: "assets/images/config_icon.png",
                view: SettingsOnePage(name: user.name,isVerified: user.isVerified,id: user.id,email: user.email,),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
