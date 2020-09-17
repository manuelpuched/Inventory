import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inventory_app/ui/widgets/grid_products.dart';
import 'package:inventory_app/ui/widgets/header_widget.dart';
import 'package:inventory_app/ui/screens/inventory.dart';
import 'package:inventory_app/ui/screens/product_view.dart';
import 'package:inventory_app/ui/screens/settings.dart';
import 'package:inventory_app/model/user.dart';
import 'grid_dash_board.dart';
import 'package:http/http.dart' as http;

class Home extends StatelessWidget {

  User user;
  Home({this.user});

  Future getUser() async{
    final response = await http.get("http://solvent-initiators.000webhostapp.com/getUser.php");
    var datauser = json.decode(response.body);
    List data = datauser.map((entry) => (entry['id_usuario'])).toList();
    bool existe = false;
    for(int i = 0; i<data.length; i++){
      if(data[i] == user.id){
        existe = true;
        print("Usuario Antiguo");
      }
    }
    if(existe == false){
      addUser();
      print("Usuario Nuevo");
    }
  }

  Future addUser() async{
    final response = await http.post("http://solvent-initiators.000webhostapp.com/addUser.php", body: {
      "id_usuario" : user.id,
    });
  }

  @override
  Widget build(BuildContext context) {
    getUser();
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
                title: "Products",
                subtitle: "Verifica tu inventario",
                img: "assets/images/product_icon.png",
                view: Inventory(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GridDashboard(
                  title: "Categories",
                  subtitle: "Crea categorias",
                  img: "assets/images/inventory_icon.png",
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
