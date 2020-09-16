import 'package:flutter/material.dart';
import 'package:inventory_app/login/config/palette.dart';
import 'package:inventory_app/login/screens/auth/decoration_functions.dart';
import 'package:inventory_app/login/screens/auth/sign_in_up_bar.dart';
import 'package:inventory_app/login/screens/auth/title.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';

class SignIn extends StatelessWidget {

  final VoidCallback onRegisterClicked;

  SignIn({@required this.onRegisterClicked});

  @override
  Widget build(BuildContext context) {
    final isSubmitting = context.isSubmitting();

    return SignInForm(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.centerLeft,
                child: LoginTitle(
                  title: 'Welcome\nBack',
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: EmailTextFormField(
                      decoration: signInInputDecoration(hintText: 'Email')
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: PasswordTextFormField(
                        decoration: signInInputDecoration(hintText: 'Password')
                    ),
                  ),
                  SignInBar(
                    isLoading: isSubmitting,
                    label: 'Sign In',
                    onPressed: (){
                      context.signInWithEmailAndPassword();
                    },
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      splashColor: Colors.white,
                      onTap: () {
                        //onRegisterClicked?.call();
                        if(onRegisterClicked != null){
                          onRegisterClicked();
                        }
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          color: Palette.darkBlue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
