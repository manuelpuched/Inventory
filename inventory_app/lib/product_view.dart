import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory_app/grid_products.dart';
import 'header_widget.dart';
import 'package:inventory_app/new_product.dart';

class ProductView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(
          color: Color(0xff392850),
          child: Column(
            children: <Widget>[
              HeaderWidget(true, view: NewProduct(), title: "Productos", actualView: "Productos"),
              GridProducts()
            ],
          ),
        ),
    );
  }
}
