import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:inventory_app/bloc/bloc_user.dart';
import 'package:inventory_app/home.dart';
import 'package:inventory_app/login/screens/auth/register.dart';
import 'package:inventory_app/login/screens/auth/sign_in.dart';
import 'package:inventory_app/login/screens/background_painter.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:animations/animations.dart';

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

    UserBloc user = BlocProvider.of(context);
    
    return Scaffold(
      body: LitAuth.custom(
        onAuthSuccess: (){
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Home(),
          ));
        },
        child: Stack(
          children: [
            SizedBox.expand(
              child: CustomPaint(
                painter: BackGroundPainter(
                  animation: _controller.view
                ),
              ),
            ),
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 800),
                child: ValueListenableBuilder<bool>(
                  valueListenable: ShowSignInPage,
                  builder: (context, value, child){
                    return PageTransitionSwitcher(
                      reverse: !value,
                      duration: Duration(
                        milliseconds: 800
                      ),
                      transitionBuilder: (child, animation, secondaryAnimation){
                        return SharedAxisTransition(
                          animation: animation,
                          secondaryAnimation: secondaryAnimation,
                          transitionType: SharedAxisTransitionType.vertical,
                          fillColor: Colors.transparent,
                          child: child,
                        );
                      },
                      child: value ? SignIn(
                        key: ValueKey('SignIn'),
                        onRegisterClicked: (){
                          context.resetSignInForm();
                          ShowSignInPage.value = false;
                          _controller.forward();
                        },
                      ) : Register(
                        key: ValueKey('Register'),
                        onSignInPressed: (){
                          context.resetSignInForm();
                          ShowSignInPage.value = true;
                          _controller.reverse();
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
