import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory_app/model/user.dart';
import 'package:inventory_app/ui/widgets/grid_category.dart';
import '../widgets/header_widget.dart';
import 'package:inventory_app/ui/widgets/new_product.dart';

class CategoryView extends StatelessWidget {

  User user;
  CategoryView(this.user);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              HeaderWidget(button: true, view: NewProduct(user), title: "Categorias", actualView: "Categorias"),
              GridCategory(user)
            ],
          ),
        ),
    );
  }
}
