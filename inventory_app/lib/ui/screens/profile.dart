import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  String nombre;

  Profile(this.nombre);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.white,
      child: Center(
        child: Text(nombre,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),),
      ),
    );
  }
}
