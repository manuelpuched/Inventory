import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:inventory_app/model/Category.dart';
import 'package:inventory_app/model/user.dart';

class MySQL{

  Category categoria;

  User user;
  final _urlGetUser = "http://solvent-initiators.000webhostapp.com/getUser.php";
  final _urlAddUser = "http://solvent-initiators.000webhostapp.com/addUser.php";
  final _urlAddCategory = "http://solvent-initiators.000webhostapp.com/addCategory.php";
  final _urlGetCategory = "http://solvent-initiators.000webhostapp.com/getCategory.php";
  final _urlDeleteCategory = "http://solvent-initiators.000webhostapp.com/deleteCategory.php";
  final _urlEditCategory = "http://solvent-initiators.000webhostapp.com/editCategory.php";
  final _urlGetProduct = "http://solvent-initiators.000webhostapp.com/getProduct.php";
  final _urlAddProduct = "http://solvent-initiators.000webhostapp.com/addProduct.php";

  MySQL(this.user);

  Future getUser() async{
    final response = await http.get(_urlGetUser);
    var datauser = json.decode(response.body);
    List data = datauser.map((entry) => (entry['id_usuario'])).toList();
    bool existe = false;
    for(int i = 0; i<data.length; i++){
      if(data[i] == user.id){
        existe = true;
        print("Usuario Antiguo");
      }
    }
    if(existe == false){
      addUser();
      print("Usuario Nuevo");
    }
  }

  Future addUser() async{
    final response = await http.post(_urlAddUser, body: {
      "id_usuario" : user.id,
    });
  }

  Future addCategory(String nombre_categoria) async{
    final response = await http.post(_urlAddCategory, body: {
      "id_usuario" : user.id,
      "nombre_categoria" : nombre_categoria,
      "cantidad" : "0",
    });
  }

  Future getCategory() async{
    final response = await http.get(_urlGetCategory);
    var datauser = json.decode(response.body);
    List<Category> categorias;
    List id_categoria = datauser.map((entry) => (entry['id_categoria'])).toList();
    List id_usuario = datauser.map((entry) => (entry['id_usuario'])).toList();
    List nombre_categoria = datauser.map((entry) => (entry['nombre_categoria'])).toList();
    List cantidad = datauser.map((entry) => (entry['cantidad'])).toList();

    for(int i = 0; i<=id_categoria.length; i++){
      categoria = Category(nombre: nombre_categoria[i], cantidad: int.parse(cantidad[i]));
      categorias.add(categoria);
    }
  }

  Future<List> getCategoryList() async {
    final response = await http.get("http://solvent-initiators.000webhostapp.com/getCategory.php");
    return json.decode(response.body);
  }

  Future deleteCategory(int id) async{
    final response = await http.post(_urlDeleteCategory, body: {
      "id_categoria" : id.toString(),
    });
  }

  Future editCategory(int id, String nombre_categoria) async{
    final response = await http.post(_urlEditCategory, body: {
      "id_categoria" : id.toString(),
      "nombre_categoria" : nombre_categoria,
    });
  }

  List<DropdownMenuItem<int>> loadData( List categorias ) {
    List<DropdownMenuItem<int>> lista = [];
    for (int i = 0; i < categorias.length; i++) {
      lista.add(new DropdownMenuItem(
        child: new Text(categorias[i]['nombre_categoria']),
        value: int.parse(categorias[i]['id_categoria']),
      ));
    }
    return lista;
  }

  Future<List> getProduct() async {
    final response = await http.get(_urlGetProduct);
    return json.decode(response.body);
  }

  Future addProduct(int id_categoria, String nombre_producto, int precio_producto, int cantidad) async {
    final response = await http.post(_urlAddProduct, body: {
      "id_categoria" : id_categoria.toString(),
      "nombre_producto" : nombre_producto,
      "precio_producto" : precio_producto.toString(),
      "cantidad" : cantidad.toString(),
    });
  }

}