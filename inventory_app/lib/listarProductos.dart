import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory_app/detalleProducto.dart';

void main() {
  List<Atributo> atributos;
  List<Producto> productos = [
    Producto('1', 'Nike Air Max 95', 180,
      atributos = [
        Atributo('Marca', 'Nike'),
        Atributo('Color', 'Blanco'),
        Atributo('talla', '30'),
        Atributo('Cantidad', '30'),
      ]
    ),
    Producto('2', 'Nike Air Max 270 React', 170,
        atributos = [
          Atributo('Marca', 'Nike'),
          Atributo('Color', 'Blanco'),
          Atributo('talla', '30'),
          Atributo('Cantidad', '55'),
        ]
    ),
    Producto('3', 'PUMA x VON DUTCH RS-2K', 130,
        atributos = [
          Atributo('Marca', 'Puma'),
          Atributo('Color', 'Negro'),
          Atributo('talla', '32'),
          Atributo('Cantidad', '10'),
        ]
    )
  ];
  runApp(MyApp(productos));
}

class MyApp extends StatelessWidget {
  List<Producto> productos;
  MyApp(this.productos);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Productos',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AppProductos(productos),
    );
  }
}

class AppProductos extends StatelessWidget {
  List<Producto> productos;

  AppProductos(this.productos);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Mis Productos'),
      ),
      body: _buildListView(context),
    );
  }

  ListView _buildListView(BuildContext context) {
    return ListView.builder(
        itemCount: productos.length,
        itemBuilder: (_, index) {
          return Card(
            child: ListTile(
              title: Text(productos.elementAt(index).nombre),
              subtitle: Text(r'$ '+productos.elementAt(index).precio.toString()),
              leading: Text(productos.elementAt(index).codigo),
              trailing: IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailPage(
                                index,
                                productos.elementAt(index)
                            )
                        ));
                  }),
            ),
          );
        });
  }
}
