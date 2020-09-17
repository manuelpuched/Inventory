import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:inventory_app/bloc/bloc_user.dart';
import 'package:inventory_app/ui/screens/home.dart';
import 'package:inventory_app/model/user.dart';
import '../widgets/fade_animation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class Register extends StatefulWidget {

  @override
  _RegisterState createState() => _RegisterState();

}

class _RegisterState extends State<Register> {

  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;

  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {

    userBloc = BlocProvider.of(context);
    return registerView();
  }

  Widget registerView(){
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Color(0xff392850)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 80,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(1, Text("Register", style: TextStyle(color: Colors.white, fontSize: 40),)),
                  SizedBox(height: 10,),
                  FadeAnimation(1.3, Text("Welcome", style: TextStyle(color: Colors.white, fontSize: 18),)),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 60,),
                        FadeAnimation(1.4, Container(
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
                          child: Form(
                              key: formKey,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                      ),
                                      child: TextFormField(
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
                                        decoration: InputDecoration(
                                            hintText: "Email or Phone number",
                                            hintStyle: TextStyle(color: Colors.grey),
                                            border: InputBorder.none
                                        ),
                                      ),
                                      /*child: TextField(
                                      controller: emailController,
                                      decoration: InputDecoration(
                                          hintText: "Email or Phone number",
                                          hintStyle: TextStyle(color: Colors.grey),
                                          border: InputBorder.none
                                      ),
                                    ),*/
                                    ),
                                    Container(
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
                                        onSaved: (value) => _password = value,
                                        decoration: InputDecoration(
                                            hintText: "Password",
                                            hintStyle: TextStyle(color: Colors.grey),
                                            border: InputBorder.none
                                        ),
                                        obscureText: true,
                                      ),
                                      /*child: TextField(
                                      controller: passwordController,
                                      decoration: InputDecoration(
                                          hintText: "Password",
                                          hintStyle: TextStyle(color: Colors.grey),
                                          border: InputBorder.none
                                      ),
                                    ),*/
                                    ),
                                    SizedBox(height: 30,),
                                    FadeAnimation(1.6, FlatButton(onPressed: (){
                                      Navigator.pop(context);
                                    }, child: Text("Go Back", style: TextStyle(color: Colors.grey),))),
                                    SizedBox(height: 20,),
                                    FadeAnimation(1.7, Container(
                                      height: 50,
                                      margin: EdgeInsets.symmetric(horizontal: 50),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Color(0xff392850)
                                      ),
                                      child: InkWell(
                                        onTap: (){
                                          userBloc.createWithEmail(
                                              _email,
                                              _password
                                          );
                                        },
                                        child: Center(
                                          child: Text("Register", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                        ),
                                      ),
                                    )),
                                    SizedBox(height: 20,),
                                  ],
                                ),
                              )
                          ),
                        )),
                        SizedBox(height: 50,),
                        FadeAnimation(1.8, Text("Continue with social media", style: TextStyle(color: Colors.grey),)),
                        SizedBox(height: 30,),
                        FadeAnimation(
                          1.9
                          ,SignInButton(
                            Buttons.Google,
                            onPressed: () {
                              userBloc.signInGoogle();
                            }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
