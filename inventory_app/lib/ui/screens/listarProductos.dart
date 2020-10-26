import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory_app/ui/screens/agregarProducto.dart';
import 'package:inventory_app/ui/screens/detalleProducto.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:inventory_app/repository/server.dart';

import '../../model/user.dart';

class AppProductos extends StatelessWidget {

  User user;

  AppProductos(this.user);

  List categorias;

  Future<List> getCategory() async{
    final response = await http.get("http://solvent-initiators.000webhostapp.com/getCategory.php");
    var datauser = json.decode(response.body);
    categorias = datauser.map((entry) => (entry['id_categoria'])).toList();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Mis Productos'),
        ),
        body: FutureBuilder<List>(
                future: MySQL(user).getProduct(),
                builder: (context, snapshot) {
                  if(snapshot.hasError) print(snapshot.error);
                  return snapshot.hasData
                      ? new ElementoLista(productos: snapshot.data,)
                      : new Center(
                          child: new CircularProgressIndicator(),
                        );
                }),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
        onPressed: (){
            getCategory();
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => agregarProductos(user),
              ));
        },
    ),
    );
  }
}

class ElementoLista extends StatelessWidget {
  final List productos;

  ElementoLista({this.productos});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: productos.length,
        itemBuilder: (_, index) {
          return Card(
            child: ListTile(
              title: Text(productos[index]['nombre_producto']),
              subtitle: Text(r'$ ' + productos[index]['precio_producto']),
              leading: Text(productos[index]['id_producto']),
              trailing: IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {
                    /*Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailPage(
                                index,
                                productos.elementAt(index)
                            )
                        ));*/
                  }),
            ),
          );
        });
  }
}
