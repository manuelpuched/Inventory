import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:inventory_app/repository/my_sql.dart';
import 'dart:async';
import 'dart:convert';

import 'model/user.dart';

class agregarProductos extends StatefulWidget {

  User user;
  agregarProductos(this.user);

  @override
  _agregarProductosState createState() => _agregarProductosState();
}

class _agregarProductosState extends State<agregarProductos> {
  final formKey = new GlobalKey<FormState>();

  String _nombreProducto;
  int _precioProducto;
  int _cantidad;
  int valueDropDown;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Productos',
      color: Color(0xff392850),
      home: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(60),
                          topRight: Radius.circular(60)
                      ),
                      boxShadow: [BoxShadow(
                          color: Color(0xff392850),
                          blurRadius: 20,
                          offset: Offset(0, 10)
                      )]
                  ),
                  margin: EdgeInsets.all(20),
                  child: Form(
                      key: formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey[200]))
                              ),
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                maxLength: 20,
                                onSaved: (value) => _nombreProducto = value,
                                decoration: InputDecoration(
                                    hintText: "Nombre del producto",
                                    hintStyle: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey[200]))
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                onSaved: (value) => _precioProducto = int.parse(value),
                                decoration: InputDecoration(
                                    hintText: "Precio del producto",
                                    hintStyle: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey[200]))
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                onSaved: (value) => _cantidad = int.parse(value),
                                decoration: InputDecoration(
                                    hintText: "Cantidad",
                                    hintStyle: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.only(top: 20),
                              child: FutureBuilder<List>(
                                  future: MySQL(widget.user).getCategoryList(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError) print(snapshot.error);
                                    if (snapshot.hasData) {
                                      return DropdownButton(
                                        value: valueDropDown,
                                        items: MySQL(widget.user).loadData(snapshot.data),
                                        hint: Text('Selecciona una categoria'),
                                        onChanged: (value) => {
                                          setState(() {
                                            valueDropDown = value;
                                          }),
                                        },
                                      );
                                    } else {
                                      return new Center(
                                        child: new CircularProgressIndicator(),
                                      );
                                    }
                                  }),
                            ),
                            SizedBox(height: 40,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 50,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Color(0xff392850)
                                  ),
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.pop(context);
                                    },
                                    child: Center(
                                      child: Text("Cancelar", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20,),
                                Container(
                                  height: 50,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Color(0xff392850)
                                  ),
                                  child: InkWell(
                                    onTap: (){
                                      final form = formKey.currentState;
                                      if (form.validate()) {
                                        form.save();
                                        MySQL(widget.user).addProduct(valueDropDown, _nombreProducto, _precioProducto, _cantidad);
                                        Navigator.pop(context);
                                      }
                                    },
                                    child: Center(
                                      child: Text("Confirmar", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20,),
                          ],
                        ),
                      )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
