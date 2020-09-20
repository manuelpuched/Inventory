import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory_app/model/user.dart';
import 'package:inventory_app/repository/my_sql.dart';
import 'package:inventory_app/ui/screens/edit_category.dart';
import '../../model/Category.dart';
import 'package:http/http.dart' as http;

class GridCategory extends StatelessWidget {

  User user;

  GridCategory(this.user);

  @override
  Widget build(BuildContext context) {

    Category categoria;
    List myList = [];
    List id_categoria, id_usuario, nombre_categoria, cantidad;

    Future<List> getCategory() async{
      final response = await http.get("http://solvent-initiators.000webhostapp.com/getCategory.php");
      var datauser = json.decode(response.body);
      id_categoria = datauser.map((entry) => (entry['id_categoria'])).toList();
      id_usuario = datauser.map((entry) => (entry['id_usuario'])).toList();
      nombre_categoria = datauser.map((entry) => (entry['nombre_categoria'])).toList();
      cantidad = datauser.map((entry) => (entry['cantidad'])).toList();

      for(int i = 0; i<id_categoria.length; i++){
        if(user.id == id_usuario[i]) {
          categoria = Category(id: int.parse(id_categoria[i]) ,nombre: nombre_categoria[i], cantidad: int.parse(cantidad[i]));
          myList.add(categoria);
        }
      }
    }

    return FutureBuilder(
    future: getCategory(),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
    return Flexible(
      child: myList.isEmpty ?
      Center(
        child: Text(
          "Sin Categorias",
          style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            fontWeight: FontWeight.w600
          ),
        ),
      )
          : GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return Stack(
              alignment: Alignment(0.8, 1.15),
              children: [
                Container(
                  width: 180,
                  decoration: BoxDecoration(
                      color: Color(0xff453658).withAlpha(70), borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        data.nombre,
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Color(0xff453658),
                                fontSize: 16,
                                fontWeight: FontWeight.w700)),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      Text(
                        data.cantidad.toString()+" "+data.nombre,
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Color(0xff453658),
                                fontSize: 11,
                                fontWeight: FontWeight.w600)),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              right: 2.5
                          ),
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(100)
                          ),
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                builder: (context) => AlertDialog(
                                  title: Text("Confirmar"),
                                  content: Text("Desea eliminar la categoria "+data.nombre+"?"),
                                  actions: [
                                    FlatButton(
                                      child: Text("Ok"),
                                      onPressed: (){
                                        MySQL(user).deleteCategory(data.id);
                                        Navigator.pop(context);
                                      },
                                    ),
                                    FlatButton(
                                      child: Text("Cancelar"),
                                      onPressed: () => Navigator.pop(context),
                                    ),
                                  ],
                                )
                              );

                            },
                            child: Center(
                              child: Icon(
                                Icons.delete_forever,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Container(margin: EdgeInsets.only(
                            left: 2.5
                        ),
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(100)
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) => EditCategory(data.id, data.nombre, user),
                              ));
                            },
                            child: Center(
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            );
          }).toList()),
    );
    },
    );
  }
}
