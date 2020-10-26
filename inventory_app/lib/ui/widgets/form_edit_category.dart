import 'package:flutter/material.dart';
import 'package:inventory_app/bloc/validaciones.dart';
import 'package:inventory_app/model/user.dart';
import 'package:inventory_app/repository/server.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:inventory_app/ui/widgets/grid_category.dart';

class FormEditCategory extends StatefulWidget {

  int id;
  String nombre;
  User user;

  FormEditCategory(this.id, this.nombre, this.user);

  @override
  FormEditCategoryState createState() => FormEditCategoryState();
}

class FormEditCategoryState extends State<FormEditCategory> {
  final scaffolkey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  String _nombreCategoria;

  Validaciones val = Validaciones();

  @override
  Widget build(BuildContext context) {
        return Stack(
          key: scaffolkey,
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
                                  if (val.validarContengaValores(value)) {
                                    return "Campo vacio";
                                  } else if (val.validarMinLongitud(value, 3)) {
                                    return 'Nombre muy corto';
                                  } else if(val.validarMaxLongitud(value, 15)){
                                    return 'Nombre muy largo';
                                  }else if(val.validarCaracteresEspeciales(value)){
                                    return 'Solo puedes ingresar letras';
                                  }else if(val.validarNoContengaNumeros(value)){
                                    return 'Solo puedes ingresar letras';
                                  }
                                  return null;
                                },
                                onSaved: (value) => _nombreCategoria = value,
                                decoration: InputDecoration(
                                    hintText: "Nuevo nombre de la categoria",
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
                                        MySQL(widget.user).editCategory(widget.id, _nombreCategoria);
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
              ),
            ),
          ],
        );
  }

  mostrarSnackBar() {
    final snackBar = SnackBar(
      content: Text('Categoria ${_nombreCategoria} creada'),
    );
    scaffolkey.currentState.showSnackBar(snackBar);
  }
}