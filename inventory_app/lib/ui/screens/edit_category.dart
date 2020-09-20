import 'package:flutter/material.dart';
import 'package:inventory_app/model/user.dart';
import 'package:inventory_app/ui/widgets/form_edit_category.dart';
import 'package:inventory_app/ui/widgets/header_widget.dart';

class EditCategory extends StatelessWidget {

  int id;
  String nombre;
  User user;
  EditCategory(this.id, this.nombre, this.user);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            HeaderWidget(button: true, title: nombre, actualView: "Editando Categoria"),
            FormEditCategory(id, nombre, user),
          ],
        ),
      ),
    );
  }
}
