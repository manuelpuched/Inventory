import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:inventory_app/model/Product.dart';
import 'package:inventory_app/model/user.dart';

class MySQL{

  Product categoria;

  User user;
  final _urlGetUser = "http://solvent-initiators.000webhostapp.com/getUser.php";
  final _urlAddUser = "http://solvent-initiators.000webhostapp.com/addUser.php";
  final _urlAddCategory = "http://solvent-initiators.000webhostapp.com/addCategory.php";
  final _urlGetCategory = "http://solvent-initiators.000webhostapp.com/getCategory.php";

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
      "cantidad" : 0,
    });
  }

  Future<List<Product>> getCategory() async{
    final response = await http.get(_urlGetCategory);
    var datauser = json.decode(response.body);
    List<Product> categorias;
    List id_categoria = datauser.map((entry) => (entry['id_categoria'])).toList();
    List id_usuario = datauser.map((entry) => (entry['id_usuario'])).toList();
    List nombre_categoria = datauser.map((entry) => (entry['nombre_categoria'])).toList();
    List cantidad = datauser.map((entry) => (entry['cantidad'])).toList();

    for(int i = 0; i<=id_categoria.length; i++){
      categoria = Product(nombre: nombre_categoria[i], cantidad: cantidad[i]);
      categorias.add(categoria);
    }
    return categorias;
  }
}