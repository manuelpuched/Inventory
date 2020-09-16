import 'package:flutter/material.dart';
import 'package:inventory_app/login/screens/auth/register.dart';
import 'package:inventory_app/login/screens/auth/sign_in.dart';
import 'package:inventory_app/login/screens/background_painter.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key key}) : super(key:key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with SingleTickerProviderStateMixin{
  AnimationController _controller;

  ValueNotifier<bool> ShowSignInPage = ValueNotifier<bool>(true);

  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LitAuth.custom(
        child: Stack(
          children: [
            SizedBox.expand(
              child: CustomPaint(
                painter: BackGroundPainter(
                  animation: _controller.view
                ),
              ),
            ),
            ValueListenableBuilder<bool>(
              valueListenable: ShowSignInPage,
              builder: (context, value, child){
                return value ? SignIn(
                  onRegisterClicked: (){
                    ShowSignInPage.value = false;
                  },
                ) : Register();
              },
            ),
          ],
        ),
      ),
    );
  }
}
