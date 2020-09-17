import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory_app/ui/widgets/grid_products.dart';
import '../widgets/header_widget.dart';
import 'package:inventory_app/ui/widgets/new_product.dart';

class ProductView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(
          color: Colors.white,
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
