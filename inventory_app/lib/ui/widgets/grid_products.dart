import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory_app/model/user.dart';
import 'package:inventory_app/repository/my_sql.dart';
import '../../model/Product.dart';
import 'package:http/http.dart' as http;

class GridProducts extends StatelessWidget {

  User user;

  GridProducts(this.user);

  Product item1 = new Product(
      nombre: "Zapatos",
      cantidad: 0,
  );

  Product item2 = new Product(
      nombre: "Ropa",
      cantidad: 0,
  );

  Product item3 = new Product(
      nombre: "Accesorios",
      cantidad: 0,
  );

  @override
  Widget build(BuildContext context) {

    List<Product> categorias;

    var data = MySQL(user).getCategory();

    List<Product> myList = [item1, item2, item3];

    return Flexible(
      child: myList.isEmpty ?
          Center(
            child: Text(
              "Vacio",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20
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
                              onTap: () => Scaffold.of(context).showSnackBar(
                                  SnackBar(content: Text("Delete"))
                              ),
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
                              onTap: () => Scaffold.of(context).showSnackBar(
                                  SnackBar(content: Text("Edit"))
                              ),
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
  }
}
