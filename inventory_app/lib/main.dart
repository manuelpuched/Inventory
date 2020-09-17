import 'package:flutter/material.dart';
import 'package:inventory_app/ui/screens/login.dart';
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
        debugShowCheckedModeBanner: false,
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
