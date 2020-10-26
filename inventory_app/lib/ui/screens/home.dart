import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inventory_app/repository/server.dart';
import 'package:inventory_app/ui/screens/profile.dart';
import 'package:inventory_app/ui/widgets/grid_category.dart';
import 'package:inventory_app/ui/widgets/header_widget.dart';
import 'package:inventory_app/ui/screens/inventory.dart';
import 'package:inventory_app/ui/screens/category_view.dart';
import 'package:inventory_app/ui/screens/settings.dart';
import 'package:inventory_app/model/user.dart';
import 'listarProductos.dart';
import 'grid_dash_board.dart';
import 'package:http/http.dart' as http;

class Home extends StatelessWidget {

  User user;
  Home({this.user});

  @override
  Widget build(BuildContext context) {

    MySQL(user).getUser();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          HeaderWidget(button: false, title: "Home", actualView: "DashBoard"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GridDashboard(
                  title: "Perfil",
                  subtitle: "Modifica tu perfil",
                  img: "assets/images/user_icon.png",
                view: Profile("Perfil"),
              ),
              GridDashboard(
                title: "Productos",
                subtitle: "Verifica tu inventario",
                img: "assets/images/product_icon.png",
                view: AppProductos(user),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GridDashboard(
                  title: "Categorias",
                  subtitle: "Crea categorias",
                  img: "assets/images/inventory_icon.png",
                  view: CategoryView(user)),
              GridDashboard(
                  title: "Finanzas",
                  subtitle: "Controla tus finanzas",
                  img: "assets/images/finance_icon.png",
                view: Profile("Finances"),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GridDashboard(
                  title: "Calculadora",
                  subtitle: "Haz Calculos",
                  img: "assets/images/calculator_icon.png",
                view: Profile("Calculator"),
              ),
              GridDashboard(
                title: "Configuracion",
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
