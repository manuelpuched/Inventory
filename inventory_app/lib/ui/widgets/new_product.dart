import 'package:flutter/material.dart';
import 'package:inventory_app/model/user.dart';
import 'package:inventory_app/repository/my_sql.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class NewProduct extends StatefulWidget {

  User user;

  NewProduct(this.user);

  @override
  NewProductState createState() => NewProductState();
}

class NewProductState extends State<NewProduct> {
  final scaffolkey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  String _nombreCategoria;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffolkey,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          spreadRadius: 1,
                          blurRadius: 10
                      )
                    ]
                ),
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
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return "Campo vacio";
                                } else if (value.length < 6) {
                                  return 'La contraseña esta muy corta';
                                } else {
                                  for (var i = 0; i < value.length; i++) {
                                    if (value[i] == value[i].toUpperCase()) {
                                      return null;
                                    }
                                  }
                                  return 'La contraseña debe contener al menos una mayuscula';
                                }
                              },
                              onSaved: (value) => _nombreCategoria = value,
                              decoration: InputDecoration(
                                  hintText: "Nombre de la categoria",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none
                              ),
                            ),
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
                                      mostrarSnackBar();
                                      MySQL(widget.user).addCategory(_nombreCategoria);
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
            ),
          ),
        ],
      )
    );
  }

  mostrarSnackBar() {
    final snackBar = SnackBar(
      content: Text('Categoria ${_nombreCategoria} creada'),
    );
    scaffolkey.currentState.showSnackBar(snackBar);
  }
}