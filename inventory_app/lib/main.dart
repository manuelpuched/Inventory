import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory_app/home.dart';
import 'package:flutter/services.dart';
import 'package:inventory_app/login.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'bloc/bloc_user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
        home: Login(),
      ),
      bloc: UserBloc(),
    );
  }
}

    /*WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // transparent status bar
    ));*/
