import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  loginPageState createState() => loginPageState();
}

class loginPageState extends State<LoginPage> {
  final scaffolkey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffolkey,
      appBar: AppBar(
        title: Text("Validando formularios"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Campo vacio";
                    } else if (!value.contains('@') || !value.contains('.')) {
                      return 'Email invalido';
                    } else if (value.contains('<') ||
                        value.contains('>') ||
                        value.contains('!') ||
                        value.contains('¡') ||
                        value.contains('¿') ||
                        value.contains('?') ||
                        value.contains('»') ||
                        value.contains('#') ||
                        value.contains(r'$') ||
                        value.contains('%') ||
                        value.contains('&') ||
                        value.contains('‘') ||
                        value.contains(' ') ||
                        value.contains('(') ||
                        value.contains(')') ||
                        value.contains('*') ||
                        value.contains('+') ||
                        value.contains('-') ||
                        value.contains(',') ||
                        value.contains('/') ||
                        value.contains(r'\')) {
                      return 'Caracter invalido';
                    }
                    return null;
                  },
                  onSaved: (value) => _email = value,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
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
                  onSaved: (value) => _password = value,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  child: Text('ENVIAR DATOS'),
                  onPressed: () {
                    final form = formKey.currentState;
                    if (form.validate()) {
                      form.save();
                      mostrarSnackBar();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  mostrarSnackBar() {
    final snackBar = SnackBar(
      content: Text('Email: $_email, password: $_password'),
    );
    scaffolkey.currentState.showSnackBar(snackBar);
  }
}
