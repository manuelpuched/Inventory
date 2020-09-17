import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:inventory_app/bloc/bloc_user.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingsOnePage extends StatefulWidget {
  var name;
  var email;
  var isVerified;
  var id;
  SettingsOnePage({this.name, this.email, this.isVerified, this.id});

  @override
  _SettingsOnePageState createState() => _SettingsOnePageState();
}

class _SettingsOnePageState extends State<SettingsOnePage> {
  bool _dark = false;

  Brightness _getBrightness() {
    return _dark ? Brightness.dark : Brightness.light;
  }

  @override
  Widget build(BuildContext context) {

    return Theme(
      isMaterialAppTheme: false,
      data: ThemeData(
        brightness: _getBrightness(),
      ),
      child: Scaffold(
        backgroundColor: _dark ? null : Colors.grey.shade200,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Card(
                    margin: EdgeInsets.only(top: 80),
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    color: Color(0xff453658),
                    child: ListTile(
                      onTap: () {
                        //open edit profile
                      },
                      title: Text(
                        widget.email,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Card(
                    elevation: 4.0,
                    margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                            Icons.lock_outline,
                            color: Colors.black,
                          ),
                          title: Text("Cambiar Contraseña"),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            //open change password
                          },
                        ),
                        _buildDivider(),
                        ListTile(
                          leading: Icon(
                            Icons.language,
                            color: Colors.black,
                          ),
                          title: Text("Cambiar Idioma"),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            //open change language
                          },
                        ),
                        _buildDivider(),
                        ListTile(
                          leading: Icon(
                            Icons.verified_user,
                            color: widget.isVerified ? Colors.green : Colors.redAccent,
                          ),
                          title: Text("Verificar Cuenta"),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            //open change location
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    "Configuraciones",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                  SwitchListTile(
                    activeColor: Color(0xff453658),
                    contentPadding: const EdgeInsets.all(0),
                    value: false,
                    title: Text("Received notification"),
                    onChanged: null,
                  ),
                  SwitchListTile(
                    activeColor: Color(0xff453658),
                    contentPadding: const EdgeInsets.all(0),
                    value: _dark,
                    title: Text("Modo oscuro"),
                    onChanged: (bool value) {
                      setState(() {
                        _dark = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    activeColor: Color(0xff453658),
                    contentPadding: const EdgeInsets.all(0),
                    value: false,
                    title: Text("Received Offer Notification"),
                    onChanged: (null),
                  ),
                  SwitchListTile(
                    activeColor: Color(0xff453658),
                    contentPadding: const EdgeInsets.all(0),
                    value: false,
                    title: Text("Actualizar automaticamente"),
                    onChanged: (null),
                  ),
                  const SizedBox(height: 60.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade400,
    );
  }
}
