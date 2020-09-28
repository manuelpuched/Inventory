import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final int index;
  Producto producto;
  List<Atributo> atributos;
  DetailPage(this.index, this.producto);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    atributos = producto.atributos;
    return MaterialApp(
        title: 'Detail',
        home: Scaffold(
          appBar: AppBar(
            title: Text(producto.codigo),
          ),
          body: Column(
            children: [
              Column(
                children: [
                  Text(producto.nombre, style: TextStyle(fontSize: 40.0)),
                  Text('Codigo: ' + producto.codigo,
                      style: TextStyle(fontSize: 25.0)),
                  Text(r'Precio: $' + producto.precio.toString(),
                      style: TextStyle(fontSize: 25.0)),
                ],
              ),
              Column(
                children: atributos.map((e) => AppAtributo(e)).toList(),
              ),
            ],
          ),

        ));
  }
}

class AppAtributo extends StatelessWidget{
  Atributo atributo;
  AppAtributo(this.atributo);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(atributo.nombre+': '+atributo.valor),
    );
  }
}
class Producto {
  String codigo, nombre;
  double precio;
  List<Atributo> atributos;

  Producto(this.codigo, this.nombre, this.precio, this.atributos);
}

class Atributo {
  String nombre, valor;
  Atributo(this.nombre, this.valor);
}
